import '../app_database.dart';
import '../forecast_generation.dart';

/// Forecast Generation Bridge - Bridge layer for Forecast generation operations
/// 
/// Provides ClojureDart-callable functions for Forecast generation.

class ForecastGenerationBridge {
  final AppDatabase db;

  ForecastGenerationBridge(this.db);

  /// Regenerate forecast from perspective
  /// 
  /// Parameters:
  /// - perspective: Map with entity, filters, orderBy, limit
  /// - days: Number of days to generate forecast for
  Future<void> regenerateForecast(Map<String, dynamic> perspective, int days) {
    return regenerateForecastFromPerspective(
      db: db,
      perspective: perspective,
      days: days,
    );
  }
}

