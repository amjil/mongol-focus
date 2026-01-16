import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// 这里引用你刚才写的连接逻辑
import 'connection/connection.dart' as impl;

part 'database.g.dart';


class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  // 蒙古文主标题
  TextColumn get title => text().withLength(min: 1, max: 1000)();
  
  // 详细备注（Things 支持在任务下写很长的备注）
  TextColumn get notes => text().nullable()();
  
  // 状态管理
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
  
  // 时间维度（用于“今天”、“计划中”等筛选）
  DateTimeColumn get dueDate => dateTime().nullable()(); // 到期日
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get completedAt => dateTime().nullable()(); // 完成时间，用于 Logbook 排序
  
  // 优先级（Things 风格：可以使用 0: None, 1: High 等）
  IntColumn get priority => integer().withDefault(const Constant(0))();

  // 关联分类
  // 如果为 null，可以默认属于 "Inbox" (ᠳᠡᠭᠡᠵᠢ ᠪᠢᠴᠢᠭ)
  IntColumn get categoryId => integer().nullable().references(Categories, #id)();
  
  // 排序权重（用于手动拖拽排序）
  RealColumn get displayOrder => real().withDefault(const Constant(0.0))();
}


class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  // 清单名称（蒙文）
  TextColumn get name => text()();
  
  // 清单图标（存储 IconData 的 codePoint）
  IntColumn get iconCode => integer().nullable()();
  
  // 排序权重
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
        // 处理从旧版本升级到新版本的逻辑
        if (from < 1) {
          // 从版本 0 升级到版本 1：创建所有表
          // 如果表已存在，createAll 会跳过它们
          await m.createAll();
        }
        // 可以在这里添加更多版本升级逻辑
        // 例如：if (from < 2) { ... } 用于从版本 1 升级到版本 2
      },
    );
  }
}

Future<AppDatabase> initDriftDatabase() async {
  final db = AppDatabase();

  await db.customSelect("SELECT 1").get();

  return db;
}