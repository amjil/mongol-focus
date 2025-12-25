import 'package:drift/drift.dart';

import 'connection/connection.dart' as impl;
import 'dao/forecast_calibration_dao.dart';
import 'dao/forecast_dao.dart';
import 'dao/inbox_dao.dart';
import 'dao/perspective_dao.dart';
import 'dao/project_dao.dart';
import 'dao/review_dao.dart';
import 'dao/settings_dao.dart';
import 'dao/task_dao.dart';
import 'dao/timeline_dao.dart';
import 'tables/forecast_calibrations.dart';
import 'tables/forecasts.dart';
import 'tables/inbox_items.dart';
import 'tables/perspectives.dart';
import 'tables/projects.dart';
import 'tables/reviews.dart';
import 'tables/settings.dart';
import 'tables/tasks.dart';
import 'tables/timeline_events.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Tasks,
    Forecasts,
    Reviews,
    TimelineEvents,
    Projects,
    Perspectives,
    InboxItems,
    Settings,
    ForecastCalibrations,
  ],
  daos: [
    TaskDao,
    ForecastDao,
    ReviewDao,
    TimelineDao,
    ProjectDao,
    PerspectiveDao,
    InboxDao,
    SettingsDao,
    ForecastCalibrationDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(DatabaseConnection connection) : super(connection);

  @override
  int get schemaVersion => 3;
}

Future<AppDatabase> initAppDatabase() async {
  final db = AppDatabase(impl.connect());
  await db.customSelect('SELECT 1').get();
  return db;
}


