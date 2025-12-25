import 'package:drift/drift.dart';

/// ForecastCalibrations table definition
/// 
/// Stores forecast calibration parameters for learning and adjustment.
class ForecastCalibrations extends Table {
  TextColumn get id => text()();
  TextColumn get periodType => text()(); // 'daily' | 'weekly'
  RealColumn get targetCount => real()();
  RealColumn get targetDuration => real()(); // minutes
  RealColumn get confidence => real()(); // 0.0 ~ 1.0
  RealColumn get volatility => real()(); // behavior volatility
  IntColumn get updatedAt => integer()(); // timestamp in seconds

  @override
  Set<Column> get primaryKey => {id};
}

