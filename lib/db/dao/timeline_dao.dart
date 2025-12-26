import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/timeline_events.dart';

part 'timeline_dao.g.dart';

/// Timeline DAO - Thin layer for timeline event data access
/// 
/// Core principle: Append-only. Events cannot be modified or deleted.
@DriftAccessor(tables: [TimelineEvents])
class TimelineDao extends DatabaseAccessor with _$TimelineDaoMixin {
  TimelineDao(super.attachedDatabase);

  /// Insert a new timeline event
  /// 
  /// This is the only write operation allowed for timeline events.
  Future<void> insertEvent(TimelineEventsCompanion event) async {
    await into(timelineEvents).insert(event);
  }

  /// Query events in time range
  /// 
  /// Returns events in descending order (newest first)
  Future<List<TimelineEvent>> queryRange(int startTs, int endTs) async {
    return await (select(timelineEvents)
          ..where((e) => e.timestamp.isBiggerOrEqualValue(startTs) & 
                        e.timestamp.isSmallerOrEqualValue(endTs))
          ..orderBy([(e) => OrderingTerm.desc(e.timestamp)]))
        .get();
  }

  /// Watch events in time range (stream)
  /// 
  /// Returns events in descending order (newest first)
  Stream<List<TimelineEvent>> watchRange(int startTs, int endTs) {
    return (select(timelineEvents)
          ..where((e) => e.timestamp.isBiggerOrEqualValue(startTs) & 
                        e.timestamp.isSmallerOrEqualValue(endTs))
          ..orderBy([(e) => OrderingTerm.desc(e.timestamp)]))
        .watch();
  }

  /// List all events (descending order)
  Future<List<TimelineEvent>> listAll() async {
    return await (select(timelineEvents)
          ..orderBy([(e) => OrderingTerm.desc(e.timestamp)]))
        .get();
  }

  /// List all events (ascending order, for replay)
  Future<List<TimelineEvent>> listAllAscending() async {
    return await (select(timelineEvents)
          ..orderBy([(e) => OrderingTerm.asc(e.timestamp)]))
        .get();
  }

  /// Clear all events (only for replay scenarios)
  /// 
  /// ⚠️ WARNING: This is a dangerous operation. Only use for replay.
  Future<void> clearAll() async {
    await delete(timelineEvents).go();
  }

  /// List events by type
  Future<List<TimelineEvent>> listByType(String eventType) async {
    return await (select(timelineEvents)
          ..where((e) => e.type.equals(eventType))
          ..orderBy([(e) => OrderingTerm.desc(e.timestamp)]))
        .get();
  }

  /// List events by entity
  Future<List<TimelineEvent>> listByEntity(String entityType, String? entityId) async {
    var query = select(timelineEvents)
      ..where((e) => e.entityType.equals(entityType));
    
    if (entityId != null) {
      query = query..where((e) => e.entityId.equals(entityId));
    }
    
    return await (query..orderBy([(e) => OrderingTerm.desc(e.timestamp)])).get();
  }

  /// List events after timestamp (for replay)
  Future<List<TimelineEvent>> listAfter(int timestamp) async {
    return await (select(timelineEvents)
          ..where((e) => e.timestamp.isBiggerThanValue(timestamp))
          ..orderBy([(e) => OrderingTerm.asc(e.timestamp)]))
        .get();
  }

  /// List events before timestamp (for replay)
  Future<List<TimelineEvent>> listBefore(int timestamp) async {
    return await (select(timelineEvents)
          ..where((e) => e.timestamp.isSmallerThanValue(timestamp))
          ..orderBy([(e) => OrderingTerm.desc(e.timestamp)]))
        .get();
  }

  /// Get event by ID
  Future<TimelineEvent?> getById(String eventId) async {
    return await (select(timelineEvents)..where((e) => e.id.equals(eventId))).getSingleOrNull();
  }
}

