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
  IntColumn get dueAt => integer().nullable()(); // 截止日期（毫秒时间戳）
  IntColumn get deferAt => integer().nullable()(); // 推迟日期（毫秒时间戳）

  @override
  Set<Column> get primaryKey => {id};
}

