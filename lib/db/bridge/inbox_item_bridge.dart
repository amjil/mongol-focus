import '../tables/inbox_items.dart';
import 'dao_bridge.dart';

/// Inbox Item Bridge - Bridge layer for Inbox Item operations
/// 
/// Provides ClojureDart-callable functions for Inbox DAO operations.

/// Insert a new inbox item
Future<void> insertInboxItem(DaoBridge bridge, InboxItemsCompanion item) {
  return bridge.inboxDao.insertInboxItem(item);
}

/// Mark inbox item as processed
Future<void> markProcessed(DaoBridge bridge, String itemId) {
  return bridge.inboxDao.markProcessed(itemId);
}

/// Delete inbox item
Future<void> deleteInboxItem(DaoBridge bridge, String itemId) {
  return bridge.inboxDao.deleteInboxItem(itemId);
}

/// Watch all new (unprocessed) inbox items
Future<List<InboxItem>> watchAllNewInboxItems(DaoBridge bridge) {
  return bridge.inboxDao.watchAllNewInboxItems();
}

/// Get inbox item by ID
Future<InboxItem?> getInboxItemById(DaoBridge bridge, String itemId) {
  return bridge.inboxDao.getInboxItemById(itemId);
}

