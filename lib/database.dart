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
  
  IntColumn get recurrenceMode => integer().withDefault(const Constant(0))();
  
  // Time dimension (for filtering like "Today", "Planned", etc.)
  DateTimeColumn get dueDate => dateTime().nullable()(); // Due date
  DateTimeColumn get reminderAt => dateTime().nullable()(); // Reminder time
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get completedAt => dateTime().nullable()(); // Completion time, used for Logbook sorting
  
  // Priority (Things-style: can use 0: None, 1: High, etc.)
  IntColumn get priority => integer().withDefault(const Constant(0))();

  // Associated category
  // If null, can default to "Inbox" (ᠳᠡᠭᠡᠵᠢ ᠪᠢᠴᠢᠭ)
  IntColumn get categoryId => integer().nullable().references(Categories, #id)();
  
  // Parent task for subtasks (self-reference)
  IntColumn get parentId => integer().nullable().references(Tasks, #id, onDelete: KeyAction.cascade)();
  
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

class Anniversaries extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get type =>
      text().withDefault(const Constant('birthday'))(); // birthday | memorial | festival
  BoolColumn get isSolar =>
      boolean().withDefault(const Constant(false))(); // false = Lunar, true = Solar
  IntColumn get month =>
      integer().withDefault(const Constant(1))(); // 1..12 (lunar or solar)
  IntColumn get day =>
      integer().withDefault(const Constant(1))(); // 1..30 (lunar) or 1..31 (solar)
  IntColumn get lunarYear => integer().nullable()();
  IntColumn get lunarMonth => integer()();
  IntColumn get lunarDay => integer()();
  BoolColumn get isLeapMonth =>
      boolean().withDefault(const Constant(false))();
  IntColumn get advanceDays => integer().withDefault(const Constant(3))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

Future<bool> _anniversaryColumnExists(
  GeneratedDatabase db,
  String column,
) async {
  final rows = await db.customSelect(
    "SELECT 1 FROM pragma_table_info('anniversaries') WHERE name = ?",
    variables: [Variable.withString(column)],
  ).get();
  return rows.isNotEmpty;
}

@DriftDatabase(tables: [Tasks, Categories, Anniversaries])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.connect());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Step-by-step migration from version to version
        if (from < 1) {
          // Version 0 -> 1: Create all tables
          await m.createAll();
        }
        
        if (from < 2) {
          // Version 1 -> 2: Add parent_id column for subtasks support
          await m.addColumn(tasks, tasks.parentId);
        }

        if (from < 3) {
          await m.createTable(anniversaries);
        }

        if (from < 4) {
          final db = m.database;
          var backfillMonthDay = false;

          if (!await _anniversaryColumnExists(db, 'is_solar')) {
            await m.addColumn(anniversaries, anniversaries.isSolar);
          }
          if (!await _anniversaryColumnExists(db, 'month')) {
            await m.addColumn(anniversaries, anniversaries.month);
            backfillMonthDay = true;
          }
          if (!await _anniversaryColumnExists(db, 'day')) {
            await m.addColumn(anniversaries, anniversaries.day);
            backfillMonthDay = true;
          }
          if (backfillMonthDay) {
            await db.customStatement(
              'UPDATE anniversaries SET month = lunar_month, day = lunar_day',
            );
          }
        }
      },
    );
  }
}

Future<AppDatabase> initDriftDatabase() async {
  final db = AppDatabase();

  await db.customSelect("SELECT 1").get();

  return db;
}