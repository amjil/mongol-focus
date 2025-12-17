import 'package:drift/drift.dart';
import 'database.dart';

/// Data Access Object for Search functionality
/// Handles all database operations for search and search history
class SearchDao {
  final AppDatabase _db;

  SearchDao(this._db);

  /// Full-text search using FTS5
  Future<List<Item>> searchTasksFullText(String query) async {
    if (query.trim().isEmpty) {
      return [];
    }
    // Escape query for FTS5 (simple approach: wrap in quotes)
    final escapedQuery = '"$query"*';
    // Use FTS5 MATCH query
    final results = await _db.customSelect(
      '''
      SELECT i.* FROM items i
      INNER JOIN items_fts fts ON i.id = fts.id
      WHERE items_fts MATCH ?
      ORDER BY rank
      LIMIT 100
      ''',
      variables: [Variable.withString(escapedQuery)],
      readsFrom: {_db.items},
    ).get();
    return results.map((row) => _db.items.map(row.data)).toList();
  }

  /// Advanced search with filters
  Future<List<Item>> searchTasksAdvanced({
    String? query,
    List<String>? statuses,
    bool? isFlagged,
    DateTime? deferFrom,
    DateTime? deferTo,
    DateTime? dueFrom,
    DateTime? dueTo,
    List<String>? tagIds,
    String? type,
  }) async {
    var queryBuilder = _db.select(_db.items);

    // Text search in content (if query provided)
    if (query != null && query.trim().isNotEmpty) {
      queryBuilder = queryBuilder..where((t) => t.content.like('%$query%'));
    }

    // Status filter
    if (statuses != null && statuses.isNotEmpty) {
      if (statuses.length == 1) {
        queryBuilder = queryBuilder
          ..where((t) => t.status.equals(statuses[0]));
      } else {
        queryBuilder = queryBuilder
          ..where((t) => t.status.isIn(statuses));
      }
    }

    // Flagged filter
    if (isFlagged != null) {
      queryBuilder = queryBuilder
        ..where((t) => t.isFlagged.equals(isFlagged));
    }

    // Defer date range
    if (deferFrom != null) {
      queryBuilder = queryBuilder
        ..where((t) => t.deferAt.isBiggerOrEqualValue(deferFrom));
    }
    if (deferTo != null) {
      queryBuilder = queryBuilder
        ..where((t) => t.deferAt.isSmallerOrEqualValue(deferTo));
    }

    // Due date range
    if (dueFrom != null) {
      queryBuilder = queryBuilder
        ..where((t) => t.dueAt.isBiggerOrEqualValue(dueFrom));
    }
    if (dueTo != null) {
      queryBuilder = queryBuilder
        ..where((t) => t.dueAt.isSmallerOrEqualValue(dueTo));
    }

    // Type filter
    if (type != null && type.isNotEmpty) {
      queryBuilder = queryBuilder..where((t) => t.type.equals(type));
    }

    // Order by updated date descending
    queryBuilder = queryBuilder
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]);

    var results = await queryBuilder.get();

    // Tag filter (requires join, so filter after getting results)
    if (tagIds != null && tagIds.isNotEmpty) {
      final itemsWithTags = <String>{};
      for (final tagId in tagIds) {
        final taggedItems = await (_db.select(_db.itemTags)
              ..where((t) => t.tagId.equals(tagId)))
            .get();
        for (final itemTag in taggedItems) {
          itemsWithTags.add(itemTag.itemId);
        }
      }
      // Filter results to only include items with at least one of the tags
      results = results.where((item) => itemsWithTags.contains(item.id)).toList();
    }

    return results;
  }

  /// Add search to history
  Future<void> addSearchHistory(String query, String searchType) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final companion = SearchHistoryCompanion.insert(
      id: id,
      query: query,
      searchType: Value(searchType),
    );
    await _db.into(_db.searchHistory).insert(companion);
  }

  /// Get search history (most recent first)
  Future<List<SearchHistoryData>> getSearchHistory({int limit = 20}) async {
    return (_db.select(_db.searchHistory)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(limit))
        .get();
  }

  /// Clear search history
  Future<void> clearSearchHistory() async {
    await _db.delete(_db.searchHistory).go();
  }

  /// Update FTS index when item is inserted or updated
  Future<void> updateFtsIndex(String itemId, String content) async {
    await _db.customUpdate(
      'INSERT INTO items_fts(id, content) VALUES(?, ?) ON CONFLICT(id) DO UPDATE SET content = ?',
      variables: [
        Variable.withString(itemId),
        Variable.withString(content),
        Variable.withString(content),
      ],
      updates: {_db.items},
    );
  }

  /// Delete from FTS index when item is deleted
  Future<void> deleteFtsIndex(String itemId) async {
    await _db.customUpdate(
      'DELETE FROM items_fts WHERE id = ?',
      variables: [Variable.withString(itemId)],
      updates: {_db.items},
    );
  }
}

