import 'package:drift/drift.dart';

/// Projects table definition
class Projects extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get createdAt => integer()(); // timestamp in seconds
  IntColumn get reviewAt => integer().nullable()(); // timestamp in milliseconds, nullable
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  TextColumn get status => text().withDefault(const Constant('active'))(); // 'active' | 'on-hold' | 'completed' | 'archived'
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

