import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'app_database.dart';
import 'tables/forecasts.dart';
import 'tables/timeline_events.dart';

/// 将 Forecast 聚合成 Timeline 的每日完成强度
Future<void> aggregateForecastToTimeline({
  required AppDatabase db,
  required DateTime from,
  required DateTime to,
}) async {
  await db.transaction(() async {
    final start = DateTime(from.year, from.month, from.day);
    final end = DateTime(to.year, to.month, to.day);

    // 1️⃣ 清旧的 forecast timeline
    await (db.delete(db.timelineEvents)
          ..where((t) =>
              t.type.equals('forecast_day') &
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerOrEqualValue(end)))
        .go();

    // 2️⃣ 查 Forecast
    final items = await (db.select(db.forecasts)
          ..where((f) =>
              f.date.isBiggerOrEqualValue(start) &
              f.date.isSmallerOrEqualValue(end)))
        .get();

    if (items.isEmpty) return;

    // 3️⃣ 按天聚合
    final Map<DateTime, List<int>> buckets = {};

    for (final f in items) {
      final day = DateTime(f.date.year, f.date.month, f.date.day);
      buckets.putIfAbsent(day, () => []).add(f.confidence);
    }

    // 4️⃣ 写 Timeline
    for (final entry in buckets.entries) {
      final sum = entry.value.fold<int>(0, (a, b) => a + b);
      // K=4，平滑防爆表；完成强度限定 0-100
      final score = (sum / 4).round().clamp(0, 100);

      await db.timelineDao.insertEvent(
        TimelineEventsCompanion.insert(
          id: const Uuid().v4(),
          type: 'forecast_day',
          refId: entry.key.toIso8601String().substring(0, 10),
          date: entry.key,
          value: score,
        ),
      );
    }
  });
}


