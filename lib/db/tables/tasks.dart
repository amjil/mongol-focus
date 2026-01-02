import 'package:drift/drift.dart';

/// Tasks table definition
class Tasks extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get projectId => text().nullable()();
  TextColumn get perspectives => text().nullable()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();
  IntColumn get priority => integer().withDefault(const Constant(3))();
  IntColumn get postponeCount => integer().withDefault(const Constant(0))();
  BoolColumn get abandoned => boolean().withDefault(const Constant(false))();
  IntColumn get dueAt => integer().nullable()(); // Due date (milliseconds timestamp)
  IntColumn get deferAt => integer().nullable()(); // Defer date (milliseconds timestamp)

  @override
  Set<Column> get primaryKey => {id};
}

