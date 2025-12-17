import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'connection/connection.dart' as impl;
import 'perspectives_dao.dart';
import 'tags_dao.dart';
import 'search_dao.dart';

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

  // whether task is flagged/starred
  BoolColumn get isFlagged =>
      boolean().withDefault(const Constant(false))();

  // recurrence rule: "daily", "weekly", "monthly", "yearly", or null
  TextColumn get recurrenceRule => text().nullable()();

  // recurrence end date (optional)
  DateTimeColumn get recurrenceEndDate => dateTime().nullable()();

  // last time this item (typically a project) was reviewed
  DateTimeColumn get lastReviewedAt => dateTime().nullable()();

  // preferred review interval in days (e.g. 7, 30); null means no automatic review reminder
  IntColumn get reviewIntervalDays => integer().nullable()();

  // estimated duration in minutes
  IntColumn get estimatedMinutes => integer().nullable()();

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

// Perspectives table - custom perspective configurations
class Perspectives extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  // filter conditions as JSON string
  // e.g., {"status": ["active"], "isFlagged": true, "tags": ["tag1", "tag2"]}
  TextColumn get filterConditions => text()();

  // sort rule: "dueDate", "createdAt", "updatedAt", "content", "custom"
  TextColumn get sortBy => text().withDefault(const Constant('dueDate'))();

  // sort order: "asc" or "desc"
  TextColumn get sortOrder => text().withDefault(const Constant('asc'))();

  // group by: "project", "tag", "dueDate", "deferDate", "none"
  TextColumn get groupBy => text().withDefault(const Constant('none'))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

// SearchHistory table - search history records
class SearchHistory extends Table {
  TextColumn get id => text()();

  TextColumn get query => text()();

  // search type: "fulltext", "advanced"
  TextColumn get searchType => text().withDefault(const Constant('fulltext'))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
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
    Perspectives,
    SearchHistory,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  // DAO instances
  PerspectivesDao? _perspectivesDao;
  PerspectivesDao get perspectivesDao =>
      _perspectivesDao ??= PerspectivesDao(this);

  TagsDao? _tagsDao;
  TagsDao get tagsDao => _tagsDao ??= TagsDao(this);

  SearchDao? _searchDao;
  SearchDao get searchDao => _searchDao ??= SearchDao(this);

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        // Create FTS virtual table for full-text search
        await customStatement(
          'CREATE VIRTUAL TABLE IF NOT EXISTS items_fts USING fts5(content, id UNINDEXED)',
        );
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Migration from version 1 to 2
          // Add new columns to Items table
          await m.addColumn(items, items.isFlagged);
          await m.addColumn(items, items.recurrenceRule);
          await m.addColumn(items, items.recurrenceEndDate);
          // Create Perspectives table
          await m.createTable(perspectives);
        }
        if (from < 3) {
          // Migration from version 2 to 3
          // Add review-related fields to Items table
          await m.addColumn(items, items.lastReviewedAt);
          await m.addColumn(items, items.reviewIntervalDays);
        }
        if (from < 4) {
          // Migration from version 3 to 4
          // Add estimated duration field to Items table
          await m.addColumn(items, items.estimatedMinutes);
        }
        if (from < 5) {
          // Migration from version 4 to 5
          // Create SearchHistory table
          await m.createTable(searchHistory);
          // Create FTS virtual table for full-text search
          await customStatement(
            'CREATE VIRTUAL TABLE IF NOT EXISTS items_fts USING fts5(content, id UNINDEXED)',
          );
          // Populate FTS table with existing items
          await customStatement(
            'INSERT INTO items_fts(content, id) SELECT content, id FROM items',
          );
        }
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
    int? estimatedMinutes,
  ) async {
    final companion = ItemsCompanion(
      content: content != null ? Value(content) : const Value.absent(),
      status: status != null ? Value(status) : const Value.absent(),
      deferAt: deferAt != null ? Value(deferAt) : const Value.absent(),
      dueAt: dueAt != null ? Value(dueAt) : const Value.absent(),
      estimatedMinutes: estimatedMinutes != null ? Value(estimatedMinutes) : const Value.absent(),
      updatedAt: Value(DateTime.now()),
    );
    await (update(items)..where((t) => t.id.equals(id))).write(companion);
  }

  // Get flagged tasks
  Future<List<Item>> getFlaggedTasks() async {
    return (select(items)
          ..where((t) =>
              t.isFlagged.equals(true) &
              t.status.isNotValue('completed'))
          ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]))
        .get();
  }

  // Get tasks with recurrence rules
  Future<List<Item>> getRecurringTasks() async {
    return (select(items)
          ..where((t) => t.recurrenceRule.isNotNull())
          ..orderBy([(t) => OrderingTerm.asc(t.dueAt)]))
        .get();
  }

  // Get tasks due soon (within next 3 days)
  Future<List<Item>> getDueSoonTasks() async {
    final now = DateTime.now();
    final soon = now.add(const Duration(days: 3));
    return (select(items)
          ..where((t) =>
              t.dueAt.isNotNull() &
              t.dueAt.isBiggerOrEqualValue(now) &
              t.dueAt.isSmallerOrEqualValue(soon) &
              t.status.isNotValue('completed'))
          ..orderBy([(t) => OrderingTerm.asc(t.dueAt)]))
        .get();
  }

  // Get stalled tasks (no activity for 7+ days and not completed)
  Future<List<Item>> getStalledTasks() async {
    final cutoff = DateTime.now().subtract(const Duration(days: 7));
    return (select(items)
          ..where((t) =>
              t.updatedAt.isSmallerOrEqualValue(cutoff) &
              t.status.isNotValue('completed'))
          ..orderBy([(t) => OrderingTerm.asc(t.updatedAt)]))
        .get();
  }

  // Get total estimated minutes for active tasks
  Future<int> getTotalEstimatedMinutes() async {
    final tasks = await (select(items)
          ..where((t) =>
              t.estimatedMinutes.isNotNull() &
              t.status.isNotValue('completed')))
        .get();
    return tasks.fold<int>(
      0,
      (sum, task) => sum + (task.estimatedMinutes ?? 0),
    );
  }

  // Get tasks ordered by estimated duration
  Future<List<Item>> getTasksByEstimatedDuration({bool ascending = true}) async {
    return (select(items)
          ..where((t) =>
              t.estimatedMinutes.isNotNull() &
              t.status.isNotValue('completed'))
          ..orderBy([
            (t) => ascending
                ? OrderingTerm.asc(t.estimatedMinutes)
                : OrderingTerm.desc(t.estimatedMinutes)
          ]))
        .get();
  }

}

Future<AppDatabase> initDriftDatabase() async {
  final db = AppDatabase(impl.connect());

  await db.customSelect("SELECT 1").get();

  return db;
}

