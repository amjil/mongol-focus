import '../../db/app_database.dart';
import '../../db/dao/forecast_repository.dart';
import '../../db/tables/forecast_items.dart';

class ReviewToForecastTx {
  final AppDatabase db;
  final ForecastRepository forecastRepo;

  ReviewToForecastTx(this.db)
      : forecastRepo = ForecastRepository(db);

  /// signals / drafts come from ClojureDart layer calculation results
  Future<void> run({
    required List<Map<String, dynamic>> forecastDrafts,
  }) async {
    await db.transaction(() async {
      // 1️⃣ Clean up old auto-review drafts (optional, but strongly recommended)
      await (db.delete(db.forecastItems)
            ..where((tbl) =>
                tbl.status.equals('draft') &
                tbl.generatedBy.equals('auto-review')))
          .go();

      // 2️⃣ Insert new Forecast drafts
      await forecastRepo.insertDrafts(forecastDrafts);
    });
  }
}

