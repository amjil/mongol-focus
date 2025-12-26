import '../app_database.dart';
import '../forecast/forecast_timeline_aggregator.dart';

/// Forecast Timeline Bridge - Bridge layer for Forecast Timeline aggregation
/// 
/// Provides ClojureDart-callable functions for aggregating forecasts to timeline.

class ForecastTimelineBridge {
  final AppDatabase db;

  ForecastTimelineBridge(this.db);

  /// Rebuild forecast timeline
  /// 
  /// Parameters:
  /// - params: Map with 'from' (yyyy-MM-dd), 'to' (yyyy-MM-dd), 'k' (smoothing coefficient)
  Future<void> rebuildForecastTimeline(Map<String, dynamic> params) async {
    final fromStr = params['from'] as String;
    final toStr = params['to'] as String;
    final k = params['k'] as int? ?? 4;
    
    final from = DateTime.parse(fromStr);
    final to = DateTime.parse(toStr);
    
    // Note: The actual implementation would need to be adapted from forecast_timeline_aggregator.dart
    // This is a simplified version
    await aggregateForecastToTimeline(
      db: db,
      from: from,
      to: to,
    );
  }
}

