import 'forecast_rule.dart';
import '../tables/tasks.dart';
import '../tables/projects.dart';

/// Calculate task due date priority
/// 
/// - Overdue: 100
/// - Today: 90
/// - Within 3 days: 80
/// - Within 7 days: 70
/// - Further: 60
int _calculateTaskDuePriority(Task task) {
  if (task.dueAt == null) return 60;

  final now = DateTime.now();
  final dueDate = DateTime.fromMillisecondsSinceEpoch(task.dueAt!);
  final today = DateTime(now.year, now.month, now.day);
  final due = DateTime(dueDate.year, dueDate.month, dueDate.day);
  
  final daysDiff = due.difference(today).inDays;

  if (daysDiff < 0) {
    // Overdue
    return 100;
  } else if (daysDiff == 0) {
    // Today
    return 90;
  } else if (daysDiff <= 3) {
    // Within 3 days
    return 80;
  } else if (daysDiff <= 7) {
    // Within 7 days
    return 70;
  } else {
    // Further
    return 60;
  }
}

/// Minimal rule set: Task due → Forecast
/// 
/// Condition: Task has dueAt and is not completed
/// Priority: dynamically calculated based on days from today
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

/// Minimal rule set: Task defer → Forecast
/// 
/// Condition: Task has deferAt and is not completed
/// Priority: 40 (lower)
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

/// Minimal rule set: Project review → Forecast
/// 
/// Condition: Project has reviewAt and is not completed
/// Priority: 50 (default)
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

/// Default rule list
/// 
/// Contains all minimal rule sets
const List<ForecastRule> defaultForecastRules = [
  taskDueRule,
  taskDeferRule,
  projectReviewRule,
];

