import 'package:drift/drift.dart';

/// Reviews table definition
class Reviews extends Table {
  TextColumn get id => text()();
  IntColumn get periodStart => integer()(); // timestamp in seconds
  IntColumn get periodEnd => integer()(); // timestamp in seconds
  IntColumn get expectedCount => integer()();
  IntColumn get actualCount => integer()();
  IntColumn get expectedDuration => integer()(); // minutes
  IntColumn get actualDuration => integer()(); // minutes
  IntColumn get moodScore => integer().nullable()(); // 0-100
  IntColumn get focusScore => integer().nullable()(); // 0-100
  IntColumn get createdAt => integer()(); // timestamp in seconds

  @override
  Set<Column> get primaryKey => {id};
}

