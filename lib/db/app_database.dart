import 'package:drift/drift.dart';

import 'connection/connection.dart' as impl;
import 'dao/forecast_dao.dart';
import 'dao/review_dao.dart';
import 'dao/task_dao.dart';
import 'dao/timeline_dao.dart';
import 'tables/forecasts.dart';
import 'tables/reviews.dart';
import 'tables/tasks.dart';
import 'tables/timeline_events.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Tasks,
    Forecasts,
    Reviews,
    TimelineEvents,
  ],
  daos: [
    TaskDao,
    ForecastDao,
    ReviewDao,
    TimelineDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(DatabaseConnection connection) : super(connection);

  @override
  int get schemaVersion => 1;
}

Future<AppDatabase> initAppDatabase() async {
  final db = AppDatabase(impl.connect());
  await db.customSelect('SELECT 1').get();
  return db;
}


