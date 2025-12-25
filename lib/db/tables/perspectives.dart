import 'package:drift/drift.dart';

/// Perspectives table definition
/// 
/// Perspective is long-term direction / value dimension.
/// Weight is driven by behavior and Review.
class Perspectives extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  RealColumn get weight => real().withDefault(const Constant(0.5))(); // 0.0 ~ 1.0
  TextColumn get weightHistory => text().nullable()(); // JSON format
  IntColumn get createdAt => integer()(); // timestamp in seconds
  IntColumn get updatedAt => integer()(); // timestamp in seconds
  TextColumn get rules => text().nullable()(); // JSON format

  @override
  Set<Column> get primaryKey => {id};
}

