import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'connection/connection.dart' as impl;

part 'database.g.dart';

// Items table - unified content table: task / project / note / focus
class Items extends Table {
  TextColumn get id => text()();

  // task | project | note | focus
  TextColumn get type => text()();

  TextColumn get content => text()();

  // active | blocked | completed | on_hold | dropped
  TextColumn get status =>
      text().withDefault(const Constant('active'))();

  // defer date (start to appear)
  DateTimeColumn get deferAt => dateTime().nullable()();

  // due date (latest completion time)
  DateTimeColumn get dueAt => dateTime().nullable()();

  // whether currently in focus
  BoolColumn get isFocused =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

// ItemTree table - hierarchy + order relationship
class ItemTree extends Table {
  TextColumn get parentId => text()();
  TextColumn get childId => text()();

  // sibling order (smaller means earlier/higher)
  IntColumn get position => integer()();

  @override
  Set<Column> get primaryKey => {parentId, childId};
}

// Tags table - tag system
class Tags extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();

  // hierarchical tag support
  TextColumn get parentId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ItemTags table - many-to-many relation
class ItemTags extends Table {
  TextColumn get itemId => text()();
  TextColumn get tagId => text()();

  @override
  Set<Column> get primaryKey => {itemId, tagId};
}

// FocusSessions table - focus session records
class FocusSessions extends Table {
  TextColumn get id => text()();

  TextColumn get itemId => text()();

  DateTimeColumn get startAt => dateTime()();
  DateTimeColumn get endAt => dateTime().nullable()();

  // focus depth score (0–100)
  IntColumn get depthScore =>
      integer().withDefault(const Constant(0))();

  TextColumn get note => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Reviews table - review system
class Reviews extends Table {
  TextColumn get id => text()();

  // daily | weekly | project
  TextColumn get type => text()();

  TextColumn get targetId => text().nullable()();

  TextColumn get content => text()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

// Settings table - local settings
class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(
  tables: [
    Items,
    ItemTree,
    Tags,
    ItemTags,
    FocusSessions,
    Reviews,
    Settings,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // future migration logic
      },
    );
  }

  // query examples

  // fetch executable tasks (not blocked)
  // status = active and parent is completed or absent
  Future<List<Item>> getExecutableTasks() async {
    // fetch all tasks with active status
    final allActive = await (select(items)
          ..where((t) => t.status.equals('active')))
        .get();
    
    // check whether each task is blocked
    final executable = <Item>[];
    for (final task in allActive) {
      // check whether it has a parent task
      final parentRel = await (select(itemTree)
            ..where((t) => t.childId.equals(task.id))
            ..limit(1))
          .getSingleOrNull();
      
      if (parentRel == null) {
        // no parent task, directly executable
        executable.add(task);
      } else {
        // has parent task, check parent status
        final parent = await (select(items)
              ..where((t) => t.id.equals(parentRel.parentId)))
            .getSingleOrNull();
        
        if (parent != null && parent.status == 'completed') {
          // parent completed, executable
          executable.add(task);
        }
        // parent not completed, task blocked, skip
      }
    }
    
    return executable;
  }

  // Today page: deferAt <= now and status != completed
  Future<List<Item>> getTodayItems() async {
    final now = DateTime.now();
    return (select(items)
          ..where((t) =>
              t.deferAt.isSmallerOrEqualValue(now) &
              t.status.isNotValue('completed'))
          ..orderBy([(t) => OrderingTerm.asc(t.deferAt)]))
        .get();
  }

  // tasks in Focus
  Future<List<Item>> getFocusedItems() async {
    return (select(items)
          ..where((t) => t.isFocused.equals(true))
          ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]))
        .get();
  }

  // Update task
  Future<void> updateTask(
    String id,
    String? content,
    String? status,
    DateTime? deferAt,
    DateTime? dueAt,
  ) async {
    final companion = ItemsCompanion(
      content: content != null ? Value(content) : const Value.absent(),
      status: status != null ? Value(status) : const Value.absent(),
      deferAt: deferAt != null ? Value(deferAt) : const Value.absent(),
      dueAt: dueAt != null ? Value(dueAt) : const Value.absent(),
      updatedAt: Value(DateTime.now()),
    );
    await (update(items)..where((t) => t.id.equals(id))).write(companion);
  }
}

Future<AppDatabase> initDriftDatabase() async {
  final db = AppDatabase(impl.connect());

  await db.customSelect("SELECT 1").get();

  return db;
}

