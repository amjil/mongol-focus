import 'package:drift/drift.dart';

/// TimelineEvents table definition
/// 
/// This is the "fact layer" of the system. All events are append-only.
/// Once written, events cannot be modified or deleted.
class TimelineEvents extends Table {
  TextColumn get id => text()();
  IntColumn get timestamp => integer()(); // timestamp in seconds
  TextColumn get type => text()(); // Event type (e.g., "task/create")
  TextColumn get entityType => text()(); // Entity type (e.g., "task", "forecast")
  TextColumn get entityId => text().nullable()(); // Entity ID (nullable)
  TextColumn get title => text()();
  IntColumn get duration => integer().nullable()(); // Duration in minutes
  TextColumn get perspectives => text().nullable()(); // Perspectives (JSON)
  TextColumn get payload => text().nullable()(); // Event Payload (JSON)

  @override
  Set<Column> get primaryKey => {id};
}

