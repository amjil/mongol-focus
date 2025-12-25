import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/tasks.dart';
import '../tables/projects.dart';
import '../tables/forecasts.dart';
import 'forecast_rule.dart';

/// 生成 ForecastItem 的稳定 ID
/// 
/// 格式：forecast:{type}:{refId}:{date}
/// 示例：forecast:task_due:task-123:2025-01-10
/// 
/// ⚠️ 关键：同一规则 + 同一实体 + 同一日期 = 同一个 ForecastItem
String generateForecastId({
  required String type,
  required String refId,
  required DateTime date,
}) {
  final dateStr = _formatDate(date);
  return 'forecast:$type:$refId:$dateStr';
}

/// 格式化日期为 yyyyMMdd 字符串
String _formatDate(DateTime date) {
  final year = date.year.toString().padLeft(4, '0');
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  return '$year$month$day';
}

/// 将 DateTime 转换为 yyyyMMdd 整数格式
int _dateToInt(DateTime date) {
  return date.year * 10000 + date.month * 100 + date.day;
}

/// 生成的 ForecastItem 数据
class GeneratedForecastItem {
  final String id;
  final String type;
  final String refId;
  final DateTime date;
  final int priority;

  GeneratedForecastItem({
    required this.id,
    required this.type,
    required this.refId,
    required this.date,
    required this.priority,
  });
}

/// 根据规则生成 ForecastItems（纯函数）
/// 
/// 遍历所有实体，应用所有规则，生成 ForecastItems 列表
List<GeneratedForecastItem> generateForecastItems({
  required List<Task> tasks,
  required List<Project> projects,
  required List<ForecastRule> rules,
}) {
  final List<GeneratedForecastItem> items = [];

  // 处理所有 Tasks
  for (final task in tasks) {
    for (final rule in rules) {
      if (rule.when(task)) {
        final date = rule.date(task);
        if (date != null) {
          final priority = rule.priority?.call(task) ?? 50;
          items.add(GeneratedForecastItem(
            id: generateForecastId(
              type: rule.type,
              refId: task.id,
              date: date,
            ),
            type: rule.type,
            refId: task.id,
            date: date,
            priority: priority,
          ));
        }
      }
    }
  }

  // 处理所有 Projects
  for (final project in projects) {
    for (final rule in rules) {
      if (rule.when(project)) {
        final date = rule.date(project);
        if (date != null) {
          final priority = rule.priority?.call(project) ?? 50;
          items.add(GeneratedForecastItem(
            id: generateForecastId(
              type: rule.type,
              refId: project.id,
              date: date,
            ),
            type: rule.type,
            refId: project.id,
            date: date,
            priority: priority,
          ));
        }
      }
    }
  }

  return items;
}

/// 同步所有 ForecastItems
/// 
/// 算法流程：
/// 1. 生成阶段：遍历所有 Task 和 Project，根据规则生成 ForecastItems（纯函数）
/// 2. 对账阶段：与数据库中的现有数据对比
///    - 插入新的 ForecastItems
///    - 删除不存在的 ForecastItems
/// 
/// 幂等性保证：
/// - ✅ 可以安全地多次调用
/// - ✅ 结果一致
/// - ✅ 永远可以删掉重建
Future<void> syncForecastItems({
  required AppDatabase db,
  required List<Task> tasks,
  required List<Project> projects,
  required List<ForecastRule> rules,
}) async {
  // 生成阶段：根据规则生成所有 ForecastItems
  final generated = generateForecastItems(
    tasks: tasks,
    projects: projects,
    rules: rules,
  );

  // 获取数据库中现有的所有 Forecasts
  final existing = await db.select(db.forecasts).get();
  final existingIds = existing.map((f) => f.id).toSet();
  final generatedIds = generated.map((g) => g.id).toSet();

  // 对账阶段
  await db.transaction(() async {
    // 插入新的 ForecastItems
    for (final item in generated) {
      if (!existingIds.contains(item.id)) {
        await db.into(db.forecasts).insert(
              ForecastsCompanion(
                id: Value(item.id),
                taskId: Value(item.refId),
                scheduledDate: Value(_dateToInt(item.date)),
                createdAt: Value(DateTime.now().millisecondsSinceEpoch),
                // 保持默认值：done=false, skipped=false, confidence=50, source=0
              ),
            );
      }
    }

    // 删除不存在的 ForecastItems
    for (final existingId in existingIds) {
      if (!generatedIds.contains(existingId)) {
        await (db.delete(db.forecasts)..where((f) => f.id.equals(existingId))).go();
      }
    }
  });
}

