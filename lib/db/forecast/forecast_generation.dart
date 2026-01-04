import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';

import '../app_database.dart';
import '../bridge/perspective_query_bridge.dart';
import '../tables/forecasts.dart';
import '../tables/timeline_events.dart';

/// Convert DateTime to yyyyMMdd format (int)
int dateTimeToYyyyMmDd(DateTime date) {
  return date.year * 10000 + date.month * 100 + date.day;
}

Future<void> regenerateForecastFromPerspective({
  required AppDatabase db,
  required Map<String, dynamic> perspective,
  required int days,
}) async {
  await db.transaction(() async {
    final today = DateTime.now();
    final baseDate = DateTime(today.year, today.month, today.day);
    final baseYyyyMmDd = dateTimeToYyyyMmDd(baseDate);

    // 1️⃣ Query Tasks using PerspectiveQueryBridge
    // Ensure perspective has entity field
    if (!perspective.containsKey('entity') || perspective['entity'] == null) {
      throw ArgumentError('perspective must have a non-null "entity" field');
    }
    final bridge = PerspectiveQueryBridge(db);
    final taskMaps = await bridge.queryByPerspective(perspective);

    // 2️⃣ Clear old auto forecast
    await (db.delete(db.forecasts)
          ..where((f) =>
              f.source.equals(0) &
              f.scheduledDate.isBiggerOrEqualValue(baseYyyyMmDd)))
        .go();

    if (taskMaps.isEmpty) return;

    // 3️⃣ Calculate weights
    final weighted = <String, double>{};
    double total = 0;

    for (final taskMap in taskMaps) {
      final taskId = taskMap['id'] as String;
      final priority = taskMap['priority'] as int? ?? 3;
      
      // Since Task doesn't have dueAt field, we'll use priority and other factors
      final rawWeight = priority * 2;

      final weight = rawWeight.toDouble();
      weighted[taskId] = weight;
      total += weight;
    }

    // Avoid division by zero when all weights are zero, distribute evenly
    if (total == 0) {
      for (final entry in weighted.keys) {
        weighted[entry] = 1;
      }
      total = weighted.length.toDouble();
    }

    // 4️⃣ Distribute to dates
    final now = DateTime.now();
    final createdAtMs = now.millisecondsSinceEpoch;

    for (int i = 0; i < days; i++) {
      final date = baseDate.add(Duration(days: i));
      final scheduledDate = dateTimeToYyyyMmDd(date);

      for (final entry in weighted.entries) {
        final ratio = entry.value / total;
        final confidence = (ratio * 100).round().clamp(1, 100);

        await db.forecastDao.insertForecast(
          ForecastsCompanion.insert(
            id: Uuid().v4(),
            taskId: entry.key,
            scheduledDate: scheduledDate,
            confidence: Value(confidence),
            source: Value(0),
            createdAt: createdAtMs,
          ),
        );
      }
    }

    // 5️⃣ Write Timeline
    final timestamp = now.millisecondsSinceEpoch ~/ 1000; // Convert to seconds
    await db.timelineDao.insertEvent(
      TimelineEventsCompanion.insert(
        id: Uuid().v4(),
        timestamp: timestamp,
        type: 'forecast_regen',
        entityType: 'forecast',
        title: 'Forecast regenerated from perspective',
      ),
    );
  });
}

