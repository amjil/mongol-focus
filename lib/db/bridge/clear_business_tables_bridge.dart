import '../app_database.dart';

/// Clear Business Tables Bridge - Bridge layer for clearing business tables
/// 
/// Provides ClojureDart-callable functions for clearing business tables (for replay scenarios).

/// Clear all business tables
/// 
/// ⚠️ WARNING: This is a dangerous operation. Only use for replay scenarios.
/// 
/// Tables cleared:
/// - tasks
/// - forecasts
/// - projects
/// - perspectives
/// - reviews
/// - forecast_calibrations
/// - inbox_items
/// 
/// Note: Do not clear timeline_events (this is the fact layer)
Future<void> clearAllBusinessTables(AppDatabase db) async {
  await db.transaction(() async {
    // Clear all business tables
    await db.delete(db.tasks).go();
    await db.delete(db.forecasts).go();
    await db.delete(db.projects).go();
    await db.delete(db.perspectives).go();
    await db.delete(db.reviews).go();
    await db.delete(db.forecastCalibrations).go();
    await db.delete(db.inboxItems).go();
  });
}

