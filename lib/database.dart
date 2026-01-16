import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// Reference the connection logic you just wrote
import 'connection/connection.dart' as impl;

part 'database.g.dart';


class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  // Mongolian main title
  TextColumn get title => text().withLength(min: 1, max: 1000)();
  
  // Detailed notes (Things supports writing long notes under tasks)
  TextColumn get notes => text().nullable()();
  
  // State management
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
  
  // Time dimension (for filtering like "Today", "Planned", etc.)
  DateTimeColumn get dueDate => dateTime().nullable()(); // Due date
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get completedAt => dateTime().nullable()(); // Completion time, used for Logbook sorting
  
  // Priority (Things-style: can use 0: None, 1: High, etc.)
  IntColumn get priority => integer().withDefault(const Constant(0))();

  // Associated category
  // If null, can default to "Inbox" (ᠳᠡᠭᠡᠵᠢ ᠪᠢᠴᠢᠭ)
  IntColumn get categoryId => integer().nullable().references(Categories, #id)();
  
  // Sort weight (for manual drag and drop sorting)
  RealColumn get displayOrder => real().withDefault(const Constant(0.0))();
}


class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  // List name (Mongolian)
  TextColumn get name => text()();
  
  // List icon (stores IconData's codePoint)
  IntColumn get iconCode => integer().nullable()();
  
  // Sort weight
  IntColumn get position => integer().withDefault(const Constant(0))();
}



@DriftDatabase(tables: [Tasks, Categories])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.connect());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migrations {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle logic for upgrading from old version to new version
        if (from < 1) {
          // Upgrade from version 0 to version 1: create all tables
          // If tables already exist, createAll will skip them
          await m.createAll();
        }
        // Can add more version upgrade logic here
        // For example: if (from < 2) { ... } for upgrading from version 1 to version 2
      },
    );
  }
}

Future<AppDatabase> initDriftDatabase() async {
  final db = AppDatabase();

  await db.customSelect("SELECT 1").get();

  return db;
}