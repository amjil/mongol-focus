import 'dart:convert';
import 'package:drift/drift.dart';
import 'database.dart';

/// Data Access Object for Perspectives table
/// Handles all database operations for perspectives
class PerspectivesDao {
  final AppDatabase _db;

  PerspectivesDao(this._db);

  /// Create a new perspective
  Future<void> createPerspective(
    String id,
    String name, {
    String? filterConditions,
    String? sortBy,
    String? sortOrder,
    String? groupBy,
  }) async {
    final now = DateTime.now();
    final companion = PerspectivesCompanion.insert(
      id: id,
      name: name,
      filterConditions: filterConditions ?? '',
      sortBy: Value(sortBy ?? 'dueDate'),
      sortOrder: Value(sortOrder ?? 'asc'),
      groupBy: Value(groupBy ?? 'none'),
      createdAt: Value(now),
      updatedAt: Value(now),
    );
    await (_db.into(_db.perspectives)).insert(companion);
  }

  /// Update an existing perspective
  Future<void> updatePerspective(
    String id, {
    String? name,
    String? filterConditions,
    String? sortBy,
    String? sortOrder,
    String? groupBy,
  }) async {
    final now = DateTime.now();
    final companion = PerspectivesCompanion(
      name: name != null ? Value(name) : const Value.absent(),
      filterConditions: filterConditions != null
          ? Value(filterConditions)
          : const Value.absent(),
      sortBy: sortBy != null ? Value(sortBy) : const Value.absent(),
      sortOrder: sortOrder != null ? Value(sortOrder) : const Value.absent(),
      groupBy: groupBy != null ? Value(groupBy) : const Value.absent(),
      updatedAt: Value(now),
    );
    await (_db.update(_db.perspectives)
          ..where((tbl) => tbl.id.equals(id)))
        .write(companion);
  }

  /// Delete a perspective
  Future<void> deletePerspective(String id) async {
    await (_db.delete(_db.perspectives)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  /// Get perspective by ID
  Future<Perspective?> getPerspectiveById(String id) async {
    return await (_db.select(_db.perspectives)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  /// Get all perspectives ordered by creation date
  Future<List<Perspective>> getAllPerspectives() async {
    return await (_db.select(_db.perspectives)
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.createdAt)]))
        .get();
  }

  /// Apply perspective filters and sorting to get tasks
  Future<List<Item>> applyPerspective(Perspective perspective) async {
    final filterConditions = _parseFilterConditions(perspective.filterConditions);
    final sortBy = perspective.sortBy;
    final sortOrder = perspective.sortOrder;

    var query = _db.select(_db.items);

    // Apply status filter
    if (filterConditions.containsKey('status')) {
      final statuses = filterConditions['status'];
      if (statuses is List) {
        if (statuses.length == 1) {
          query = query..where((tbl) => tbl.status.equals(statuses[0] as String));
        } else {
          final statusList = statuses.cast<String>();
          query = query..where((tbl) => tbl.status.isIn(statusList));
        }
      }
    }

    // Apply flagged filter
    if (filterConditions.containsKey('isFlagged')) {
      final isFlagged = filterConditions['isFlagged'] as bool;
      query = query..where((tbl) => tbl.isFlagged.equals(isFlagged));
    }

    // Apply tags filter
    if (filterConditions.containsKey('tags')) {
      final tagsValue = filterConditions['tags'];
      if (tagsValue is List && tagsValue.isNotEmpty) {
        // tags: ["tagId1", "tagId2", ...]
        final tagIds = tagsValue.cast<String>();

        // tagsMode: "and" | "or" (default "or")
        final tagsMode = (filterConditions['tagsMode'] as String?) ?? 'or';

        final itemTags = _db.itemTags;

        switch (tagsMode) {
          case 'and':
            // Items that have ALL specified tags:
            // SELECT items.*
            // FROM items
            // JOIN item_tags ON items.id = item_tags.item_id
            // WHERE item_tags.tag_id IN (...)
            // GROUP BY items.id
            // HAVING COUNT(DISTINCT item_tags.tag_id) = tagIds.length
            final joined = query.join([
              innerJoin(
                itemTags,
                itemTags.itemId.equalsExp(_db.items.id),
              ),
            ])
              ..where(itemTags.tagId.isIn(tagIds))
              ..groupBy([_db.items.id])
              ..having(itemTags.tagId.count(distinct: true).equals(tagIds.length));

            final rows = await joined.get();
            return rows.map((row) => row.readTable(_db.items)).toList();

          case 'or':
          default:
            // Items that have ANY of the specified tags
            final joined = query.join([
              innerJoin(
                itemTags,
                itemTags.itemId.equalsExp(_db.items.id),
              ),
            ])
              ..where(itemTags.tagId.isIn(tagIds))
              ..groupBy([_db.items.id]);

            final rows = await joined.get();
            return rows.map((row) => row.readTable(_db.items)).toList();
        }
      }
    }

    // Apply date range filters
    if (filterConditions.containsKey('dueSoon')) {
      final now = DateTime.now();
      final soon = now.add(const Duration(days: 3));
      query = query
        ..where((tbl) =>
            tbl.dueAt.isNotNull() &
            tbl.dueAt.isBiggerOrEqualValue(now) &
            tbl.dueAt.isSmallerOrEqualValue(soon));
    }

    if (filterConditions.containsKey('overdue')) {
      final now = DateTime.now();
      // Use a slightly earlier time to simulate strict less-than comparison
      final justBeforeNow = now.subtract(const Duration(milliseconds: 1));
      query = query
        ..where((tbl) =>
            tbl.dueAt.isNotNull() &
            tbl.dueAt.isSmallerOrEqualValue(justBeforeNow) &
            tbl.status.isNotValue('completed'));
    }

    // Apply sorting
    switch (sortBy) {
      case 'dueDate':
        if (sortOrder == 'desc') {
          query = query..orderBy([(tbl) => OrderingTerm.desc(tbl.dueAt)]);
        } else {
          query = query..orderBy([(tbl) => OrderingTerm.asc(tbl.dueAt)]);
        }
        break;
      case 'deferDate':
        if (sortOrder == 'desc') {
          query = query..orderBy([(tbl) => OrderingTerm.desc(tbl.deferAt)]);
        } else {
          query = query..orderBy([(tbl) => OrderingTerm.asc(tbl.deferAt)]);
        }
        break;
      case 'createdAt':
        if (sortOrder == 'desc') {
          query = query..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]);
        } else {
          query = query..orderBy([(tbl) => OrderingTerm.asc(tbl.createdAt)]);
        }
        break;
      case 'updatedAt':
        if (sortOrder == 'desc') {
          query = query..orderBy([(tbl) => OrderingTerm.desc(tbl.updatedAt)]);
        } else {
          query = query..orderBy([(tbl) => OrderingTerm.asc(tbl.updatedAt)]);
        }
        break;
      case 'content':
        if (sortOrder == 'desc') {
          query = query..orderBy([(tbl) => OrderingTerm.desc(tbl.content)]);
        } else {
          query = query..orderBy([(tbl) => OrderingTerm.asc(tbl.content)]);
        }
        break;
      default:
        query = query..orderBy([(tbl) => OrderingTerm.asc(tbl.dueAt)]);
    }

    return await query.get();
  }

  /// Parse filter conditions JSON string to map
  Map<String, dynamic> _parseFilterConditions(String? filterJson) {
    if (filterJson == null || filterJson.isEmpty) {
      return {};
    }
    try {
      return jsonDecode(filterJson) as Map<String, dynamic>;
    } catch (e) {
      print('Error parsing filter conditions: $e');
      return {};
    }
  }
}

