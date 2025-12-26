import '../app_database.dart';
import 'dao_bridge.dart';

/// Forecast Bridge - Bridge layer for Forecast operations
/// 
/// Provides ClojureDart-callable functions for Forecast DAO operations.

/// Insert a new forecast
Future<void> insertForecast(DaoBridge bridge, ForecastsCompanion forecast) {
  return bridge.forecastDao.insertForecast(forecast);
}

/// Mark forecast as done
Future<void> markForecastDone(DaoBridge bridge, String forecastId) {
  return bridge.forecastDao.markDone(forecastId);
}

/// Watch forecasts by date
Stream<List<Forecast>> watchForecastsByDate(DaoBridge bridge, int yyyymmdd) {
  return bridge.forecastDao.watchByDate(yyyymmdd);
}

/// Get forecast by ID
Future<Forecast?> getForecastById(DaoBridge bridge, String forecastId) {
  return bridge.forecastDao.getForecastById(forecastId);
}

/// Delete forecast
Future<void> deleteForecast(DaoBridge bridge, String forecastId) {
  return bridge.forecastDao.deleteForecast(forecastId);
}

/// Update forecast
Future<void> updateForecast(DaoBridge bridge, String forecastId, ForecastsCompanion updates) {
  return bridge.forecastDao.updateForecast(forecastId, updates);
}

