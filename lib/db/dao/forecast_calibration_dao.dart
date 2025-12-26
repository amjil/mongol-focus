import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/forecast_calibrations.dart';

part 'forecast_calibration_dao.g.dart';

/// Forecast Calibration DAO - Thin layer for forecast calibration data access
/// 
/// Only provides basic CRUD operations, no business logic.
@DriftAccessor(tables: [ForecastCalibrations])
class ForecastCalibrationDao extends DatabaseAccessor<AppDatabase> with _$ForecastCalibrationDaoMixin {
  ForecastCalibrationDao(super.attachedDatabase);

  /// Insert a new forecast calibration
  Future<void> insertForecastCalibration(ForecastCalibrationsCompanion calibration) async {
    await into(forecastCalibrations).insert(calibration);
  }

  /// Update forecast calibration
  Future<void> updateForecast(
    String id,
    double targetCount,
    double targetDuration,
    double confidence,
    double volatility,
    int updatedAt,
  ) async {
    await (update(forecastCalibrations)..where((c) => c.id.equals(id)))
        .write(ForecastCalibrationsCompanion(
      targetCount: Value(targetCount),
      targetDuration: Value(targetDuration),
      confidence: Value(confidence),
      volatility: Value(volatility),
      updatedAt: Value(updatedAt),
    ));
  }

  /// Get forecast calibration by ID
  Future<ForecastCalibration?> getForecastCalibration(String id) async {
    return await (select(forecastCalibrations)..where((c) => c.id.equals(id))).getSingleOrNull();
  }
}

