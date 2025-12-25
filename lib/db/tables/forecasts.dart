import 'package:drift/drift.dart';

/// Forecasts table definition
class Forecasts extends Table {
  TextColumn get id => text()();
  TextColumn get taskId => text()();
  IntColumn get scheduledDate => integer()(); // yyyyMMdd format
  BoolColumn get done => boolean().withDefault(const Constant(false))();
  BoolColumn get skipped => boolean().withDefault(const Constant(false))();
  IntColumn get confidence => integer().withDefault(const Constant(50))();
  IntColumn get source => integer().withDefault(const Constant(0))(); // 0=auto, 1=review
  IntColumn get createdAt => integer()(); // timestamp in milliseconds

  @override
  Set<Column> get primaryKey => {id};
}

