import 'package:drift/drift.dart';

/// Settings table definition
class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()(); // JSON format
  IntColumn get updatedAt => integer()(); // timestamp in seconds

  @override
  Set<Column> get primaryKey => {key};
}

