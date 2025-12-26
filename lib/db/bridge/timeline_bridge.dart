import '../app_database.dart';
import 'dao_bridge.dart';

/// Timeline Bridge - Bridge layer for Timeline Event operations
/// 
/// Provides ClojureDart-callable functions for Timeline DAO operations.

/// Insert a timeline event
Future<void> insertTimelineEvent(DaoBridge bridge, TimelineEventsCompanion event) {
  return bridge.timelineEventDao.insertEvent(event);
}

/// Query timeline events in time range
Future<List<TimelineEvent>> queryTimelineRange(DaoBridge bridge, int startTs, int endTs) {
  return bridge.timelineEventDao.queryRange(startTs, endTs);
}

/// Watch timeline events in time range (stream)
Stream<List<TimelineEvent>> watchTimelineRange(DaoBridge bridge, int startTs, int endTs) {
  return bridge.timelineEventDao.watchRange(startTs, endTs);
}

/// List all timeline events (descending order)
Future<List<TimelineEvent>> listAllTimelineEvents(DaoBridge bridge) {
  return bridge.timelineEventDao.listAll();
}

/// List all timeline events (ascending order, for replay)
Future<List<TimelineEvent>> listAllTimelineEventsAscending(DaoBridge bridge) {
  return bridge.timelineEventDao.listAllAscending();
}

/// Clear all timeline events (only for replay)
/// 
/// ⚠️ WARNING: This is a dangerous operation. Only use for replay.
Future<void> clearAllTimelineEvents(DaoBridge bridge) {
  return bridge.timelineEventDao.clearAll();
}

/// List timeline events by type
Future<List<TimelineEvent>> listTimelineEventsByType(DaoBridge bridge, String eventType) {
  return bridge.timelineEventDao.listByType(eventType);
}

/// List timeline events by entity
Future<List<TimelineEvent>> listTimelineEventsByEntity(
  DaoBridge bridge,
  String entityType,
  String? entityId,
) {
  return bridge.timelineEventDao.listByEntity(entityType, entityId);
}

/// List timeline events after timestamp (for replay)
Future<List<TimelineEvent>> listTimelineEventsAfter(DaoBridge bridge, int timestamp) {
  return bridge.timelineEventDao.listAfter(timestamp);
}

/// List timeline events before timestamp (for replay)
Future<List<TimelineEvent>> listTimelineEventsBefore(DaoBridge bridge, int timestamp) {
  return bridge.timelineEventDao.listBefore(timestamp);
}

/// Get timeline event by ID
Future<TimelineEvent?> getTimelineEventById(DaoBridge bridge, String eventId) {
  return bridge.timelineEventDao.getById(eventId);
}

