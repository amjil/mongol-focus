import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/tasks.dart';
import '../tables/projects.dart';
import '../tables/forecasts.dart';
import 'forecast_rule.dart';

/// Generate stable ID for ForecastItem
/// 
/// Format: forecast:{type}:{refId}:{date}
/// Example: forecast:task_due:task-123:2025-01-10
/// 
/// ⚠️ Key: same rule + same entity + same date = same ForecastItem
String generateForecastId({
  required String type,
  required String refId,
  required DateTime date,
}) {
  final dateStr = _formatDate(date);
  return 'forecast:$type:$refId:$dateStr';
}

/// Format date to yyyyMMdd string
String _formatDate(DateTime date) {
  final year = date.year.toString().padLeft(4, '0');
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  return '$year$month$day';
}

/// Convert DateTime to yyyyMMdd integer format
int _dateToInt(DateTime date) {
  return date.year * 10000 + date.month * 100 + date.day;
}

/// Generated ForecastItem data
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

/// Generate ForecastItems based on rules (pure function)
/// 
/// Iterate through all entities, apply all rules, generate ForecastItems list
List<GeneratedForecastItem> generateForecastItems({
  required List<Task> tasks,
  required List<Project> projects,
  required List<ForecastRule> rules,
}) {
  final List<GeneratedForecastItem> items = [];

  // Process all Tasks
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

  // Process all Projects
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

/// Sync all ForecastItems
/// 
/// Algorithm flow:
/// 1. Generation phase: iterate through all Tasks and Projects, generate ForecastItems based on rules (pure function)
/// 2. Reconciliation phase: compare with existing data in database
///    - Insert new ForecastItems
///    - Delete non-existent ForecastItems
/// 
/// Idempotency guarantee:
/// - ✅ Can be safely called multiple times
/// - ✅ Consistent results
/// - ✅ Can always delete and rebuild
Future<void> syncForecastItems({
  required AppDatabase db,
  required List<Task> tasks,
  required List<Project> projects,
  required List<ForecastRule> rules,
}) async {
  // Generation phase: generate all ForecastItems based on rules
  final generated = generateForecastItems(
    tasks: tasks,
    projects: projects,
    rules: rules,
  );

  // Get all existing Forecasts from database
  final existing = await db.select(db.forecasts).get();
  final existingIds = existing.map((f) => f.id).toSet();
  final generatedIds = generated.map((g) => g.id).toSet();

  // Reconciliation phase
  await db.transaction(() async {
    // Insert new ForecastItems
    for (final item in generated) {
      if (!existingIds.contains(item.id)) {
        await db.into(db.forecasts).insert(
              ForecastsCompanion(
                id: Value(item.id),
                taskId: Value(item.refId),
                scheduledDate: Value(_dateToInt(item.date)),
                createdAt: Value(DateTime.now().millisecondsSinceEpoch),
                // Keep default values: done=false, skipped=false, confidence=50, source=0
              ),
            );
      }
    }

    // Delete non-existent ForecastItems
    for (final existingId in existingIds) {
      if (!generatedIds.contains(existingId)) {
        await (db.delete(db.forecasts)..where((f) => f.id.equals(existingId))).go();
      }
    }
  });
}

