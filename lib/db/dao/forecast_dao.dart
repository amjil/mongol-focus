import 'package:drift/drift.dart';

import '../tables/forecasts.dart';

part 'forecast_dao.g.dart';

/// Forecast DAO - Thin layer for forecast data access
/// 
/// Only provides basic CRUD operations, no business logic.
@DriftAccessor(tables: [Forecasts])
class ForecastDao extends DatabaseAccessor with _$ForecastDaoMixin {
  ForecastDao(super.attachedDatabase);

  /// Insert a new forecast
  Future<void> insertForecast(ForecastsCompanion forecast) async {
    await into(forecasts).insert(forecast);
  }

  /// Mark forecast as done
  Future<void> markDone(String forecastId) async {
    await (update(forecasts)..where((f) => f.id.equals(forecastId)))
        .write(const ForecastsCompanion(done: Value(true)));
  }

  /// Watch forecasts by date
  Stream<List<Forecast>> watchByDate(int yyyymmdd) {
    return (select(forecasts)
          ..where((f) => f.scheduledDate.equals(yyyymmdd))
          ..orderBy([(f) => OrderingTerm(expression: f.createdAt)]))
        .watch();
  }

  /// Get forecast by ID
  Future<Forecast?> getForecastById(String forecastId) async {
    return await (select(forecasts)..where((f) => f.id.equals(forecastId))).getSingleOrNull();
  }

  /// Delete forecast
  Future<void> deleteForecast(String forecastId) async {
    await (delete(forecasts)..where((f) => f.id.equals(forecastId))).go();
  }

  /// Update forecast
  Future<void> updateForecast(String forecastId, ForecastsCompanion updates) async {
    await (update(forecasts)..where((f) => f.id.equals(forecastId))).write(updates);
  }
}

