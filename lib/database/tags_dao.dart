import 'package:drift/drift.dart';
import 'database.dart';

/// Data Access Object for Tags table
/// Handles all database operations for tags and tag-item associations
class TagsDao {
  final AppDatabase _db;

  TagsDao(this._db);

  /// Create a new tag
  Future<Null> createTag(String id, String name, {String? parentId, String? contextType}) async {
    final companion = TagsCompanion.insert(
      id: id,
      name: name,
      parentId: parentId != null ? Value(parentId) : const Value.absent(),
      contextType: contextType != null ? Value(contextType) : const Value.absent(),
    );
    await (_db.into(_db.tags)).insert(companion);
    return null;
  }

  /// Update an existing tag
  Future<void> updateTag(
    String id, {
    String? name,
    String? parentId,
    String? contextType,
  }) async {
    final companion = TagsCompanion(
      name: name != null ? Value(name) : const Value.absent(),
      parentId: parentId != null ? Value(parentId) : const Value.absent(),
      contextType: contextType != null ? Value(contextType) : const Value.absent(),
    );
    await (_db.update(_db.tags)
          ..where((tbl) => tbl.id.equals(id)))
        .write(companion);
  }

  /// Delete a tag (also deletes associations)
  Future<void> deleteTag(String id) async {
    // First delete associations
    await (_db.delete(_db.itemTags)
          ..where((tbl) => tbl.tagId.equals(id)))
        .go();
    // Then delete tag
    await (_db.delete(_db.tags)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  /// Get tag by ID
  Future<Tag?> getTagById(String id) async {
    return await (_db.select(_db.tags)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  /// Get all tags
  Future<List<Tag>> getAllTags() async {
    return await _db.select(_db.tags).get();
  }

  /// Get all child tags of specified parent tag
  Future<List<Tag>> getTagsByParent(String parentId) async {
    return await (_db.select(_db.tags)
          ..where((tbl) => tbl.parentId.equals(parentId)))
        .get();
  }

  /// Add tag to item
  Future<void> addTagToItem(String itemId, String tagId) async {
    final companion = ItemTagsCompanion.insert(
      itemId: itemId,
      tagId: tagId,
    );
    await (_db.into(_db.itemTags)).insert(companion);
  }

  /// Remove tag from item
  Future<void> removeTagFromItem(String itemId, String tagId) async {
    await (_db.delete(_db.itemTags)
          ..where((tbl) =>
              tbl.itemId.equals(itemId) & tbl.tagId.equals(tagId)))
        .go();
  }

  /// Get all tags of an item
  Future<List<ItemTag>> getItemTags(String itemId) async {
    return await (_db.select(_db.itemTags)
          ..where((tbl) => tbl.itemId.equals(itemId)))
        .get();
  }

  /// Get all items by tag
  Future<List<Item>> getItemsByTag(String tagId) async {
    final query = _db.select(_db.items);
    final joined = query.join([
      innerJoin(
        _db.itemTags,
        _db.itemTags.itemId.equalsExp(_db.items.id),
      ),
    ])
      ..where(_db.itemTags.tagId.equals(tagId));
    final rows = await joined.get();
    return rows.map((row) => row.readTable(_db.items)).toList();
  }

  /// Get all items that have any of the specified tags (OR logic)
  Future<List<Item>> getItemsByTags(List<String> tagIds) async {
    if (tagIds.isEmpty) {
      return [];
    }
    final query = _db.select(_db.items);
    final joined = query.join([
      innerJoin(
        _db.itemTags,
        _db.itemTags.itemId.equalsExp(_db.items.id),
      ),
    ])
      ..where(_db.itemTags.tagId.isIn(tagIds))
      ..groupBy([_db.items.id]);
    final rows = await joined.get();
    return rows.map((row) => row.readTable(_db.items)).toList();
  }

  /// Get all items that have all of the specified tags (AND logic)
  Future<List<Item>> getItemsByAllTags(List<String> tagIds) async {
    if (tagIds.isEmpty) {
      return [];
    }
    // Get items for each tag separately, then find intersection
    final tagQueries = tagIds.map((tagId) => getItemsByTag(tagId));
    final results = await Future.wait(tagQueries);
    
    if (results.isEmpty) {
      return [];
    }
    
    // Find intersection of all tag results
    final idSets = results.map((items) => items.map((item) => item.id).toSet()).toList();
    var commonIds = idSets.first;
    for (var i = 1; i < idSets.length; i++) {
      commonIds = commonIds.intersection(idSets[i]);
    }
    
    // Return items with common IDs (use first result set as source)
    final allItems = results.expand((items) => items).toList();
    return allItems.where((item) => commonIds.contains(item.id)).toList();
  }
}

