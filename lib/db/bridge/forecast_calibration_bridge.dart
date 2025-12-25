import '../tables/forecast_calibrations.dart';
import '../app_database.dart';
import 'dao_bridge.dart';

/// Forecast Calibration Bridge - Bridge layer for Forecast Calibration operations
/// 
/// Provides ClojureDart-callable functions for Forecast Calibration DAO operations.

/// Insert a new forecast calibration
Future<void> insertForecastCalibration(DaoBridge bridge, ForecastCalibrationsCompanion calibration) {
  return bridge.forecastCalibrationDao.insertForecastCalibration(calibration);
}

/// Update forecast calibration
Future<void> updateForecast(
  DaoBridge bridge,
  String id,
  double targetCount,
  double targetDuration,
  double confidence,
  double volatility,
) {
  final now = (DateTime.now().millisecondsSinceEpoch / 1000).round();
  return bridge.forecastCalibrationDao.updateForecast(
    id,
    targetCount,
    targetDuration,
    confidence,
    volatility,
    now,
  );
}

/// Get forecast calibration by ID
Future<ForecastCalibration?> getForecastCalibration(DaoBridge bridge, String id) {
  return bridge.forecastCalibrationDao.getForecastCalibration(id);
}

/// Apply Review to Forecast calibration transaction
/// 
/// This is a transaction that updates forecast calibration based on review results.
Future<void> applyReviewToForecastTransaction(
  AppDatabase db,
  DaoBridge bridge,
  String forecastId,
  double targetCount,
  double targetDuration,
  double confidence,
  double volatility,
) {
  return db.transaction(() async {
    final now = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    await bridge.forecastCalibrationDao.updateForecast(
      forecastId,
      targetCount,
      targetDuration,
      confidence,
      volatility,
      now,
    );
  });
}

