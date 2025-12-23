import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';

import 'app_database.dart';
import 'tables/forecasts.dart';
import 'tables/timeline_events.dart';

Future<void> regenerateForecastFromPerspective({
  required AppDatabase db,
  required Map<String, dynamic> perspective,
  required int days,
}) async {
  await db.transaction(() async {
    final today = DateTime.now();
    final baseDate = DateTime(today.year, today.month, today.day);

    // 1️⃣ 查询 Task
    final tasks = await db.taskDao.queryByPerspective(perspective);

    // 2️⃣ 清空旧的 auto forecast
    await (db.delete(db.forecasts)
          ..where((f) =>
              f.source.equals(0) &
              f.date.isBiggerOrEqualValue(baseDate)))
        .go();

    if (tasks.isEmpty) return;

    // 3️⃣ 计算权重
    final weighted = <String, double>{};
    double total = 0;

    for (final t in tasks) {
      final overdue =
          t.dueAt == null ? 0 : baseDate.difference(t.dueAt!).inDays;
      final rawWeight =
          t.priority * 2 +
          (overdue > 0 ? overdue : 0) +
          (t.dueAt != null ? 2 : 0);

      final weight = rawWeight.toDouble();
      weighted[t.id] = weight;
      total += weight;
    }

    // 避免全零导致除零错误，均分权重
    if (total == 0) {
      for (final entry in weighted.keys) {
        weighted[entry] = 1;
      }
      total = weighted.length.toDouble();
    }

    // 4️⃣ 分布到日期
    for (int i = 0; i < days; i++) {
      final date = baseDate.add(Duration(days: i));

      for (final entry in weighted.entries) {
        final ratio = entry.value / total;
        final confidence = (ratio * 100).round().clamp(1, 100);

        await db.forecastDao.insertForecast(
          ForecastsCompanion.insert(
            id: const Uuid().v4(),
            taskId: entry.key,
            date: date,
            confidence: confidence,
            source: 0,
            createdAt: DateTime.now(),
          ),
        );
      }
    }

    // 5️⃣ 写 Timeline
    await db.timelineDao.insertEvent(
      TimelineEventsCompanion.insert(
        id: const Uuid().v4(),
        type: 'forecast_regen',
        refId: 'perspective',
        date: baseDate,
        value: tasks.length,
      ),
    );
  });
}

