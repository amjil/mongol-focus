import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/inbox_items.dart';

part 'inbox_dao.g.dart';

/// Inbox DAO - Thin layer for inbox item data access
/// 
/// Only provides basic CRUD operations, no business logic.
@DriftAccessor(tables: [InboxItems])
class InboxDao extends DatabaseAccessor with _$InboxDaoMixin {
  InboxDao(super.attachedDatabase);

  /// Insert a new inbox item
  Future<void> insertInboxItem(InboxItemsCompanion item) async {
    await into(inboxItems).insert(item);
  }

  /// Mark inbox item as processed
  Future<void> markProcessed(String itemId) async {
    await (update(inboxItems)..where((i) => i.id.equals(itemId)))
        .write(const InboxItemsCompanion(processed: Value(true)));
  }

  /// Delete inbox item
  Future<void> deleteInboxItem(String itemId) async {
    await (delete(inboxItems)..where((i) => i.id.equals(itemId))).go();
  }

  /// Watch all new (unprocessed) inbox items
  Future<List<InboxItem>> watchAllNewInboxItems() async {
    return await (select(inboxItems)
          ..where((i) => i.processed.equals(false))
          ..orderBy([(i) => OrderingTerm.asc(i.createdAt)]))
        .get();
  }

  /// Get inbox item by ID
  Future<InboxItem?> getInboxItemById(String itemId) async {
    return await (select(inboxItems)..where((i) => i.id.equals(itemId))).getSingleOrNull();
  }
}

