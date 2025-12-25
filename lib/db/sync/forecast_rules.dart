import 'forecast_rule.dart';
import '../tables/tasks.dart';
import '../tables/projects.dart';

/// 计算任务截止日期的优先级
/// 
/// - 逾期：100
/// - 今天：90
/// - 3天内：80
/// - 7天内：70
/// - 更远：60
int _calculateTaskDuePriority(Task task) {
  if (task.dueAt == null) return 60;

  final now = DateTime.now();
  final dueDate = DateTime.fromMillisecondsSinceEpoch(task.dueAt!);
  final today = DateTime(now.year, now.month, now.day);
  final due = DateTime(dueDate.year, dueDate.month, dueDate.day);
  
  final daysDiff = due.difference(today).inDays;

  if (daysDiff < 0) {
    // 逾期
    return 100;
  } else if (daysDiff == 0) {
    // 今天
    return 90;
  } else if (daysDiff <= 3) {
    // 3天内
    return 80;
  } else if (daysDiff <= 7) {
    // 7天内
    return 70;
  } else {
    // 更远
    return 60;
  }
}

/// 最小规则集：Task due → Forecast
/// 
/// 条件：Task 有 dueAt 且未完成
/// 优先级：根据距离今天的天数动态计算
final ForecastRule taskDueRule = ForecastRule(
  type: 'task_due',
  when: (entity) {
    if (entity is! Task) return false;
    return entity.dueAt != null && !entity.completed;
  },
  date: (entity) {
    if (entity is! Task || entity.dueAt == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(entity.dueAt!);
  },
  priority: (entity) {
    if (entity is! Task) return 60;
    return _calculateTaskDuePriority(entity);
  },
);

/// 最小规则集：Task defer → Forecast
/// 
/// 条件：Task 有 deferAt 且未完成
/// 优先级：40（较低）
final ForecastRule taskDeferRule = ForecastRule(
  type: 'task_defer',
  when: (entity) {
    if (entity is! Task) return false;
    return entity.deferAt != null && !entity.completed;
  },
  date: (entity) {
    if (entity is! Task || entity.deferAt == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(entity.deferAt!);
  },
  priority: (_) => 40,
);

/// 最小规则集：Project review → Forecast
/// 
/// 条件：Project 有 reviewAt 且未完成
/// 优先级：50（默认）
final ForecastRule projectReviewRule = ForecastRule(
  type: 'project_review',
  when: (entity) {
    if (entity is! Project) return false;
    return entity.reviewAt != null && !entity.completed;
  },
  date: (entity) {
    if (entity is! Project || entity.reviewAt == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(entity.reviewAt!);
  },
  priority: (_) => 50,
);

/// 默认规则列表
/// 
/// 包含所有最小规则集
const List<ForecastRule> defaultForecastRules = [
  taskDueRule,
  taskDeferRule,
  projectReviewRule,
];

