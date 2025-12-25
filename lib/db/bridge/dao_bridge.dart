library mongol_focus.db.bridge.dao_bridge;

import '../app_database.dart';

/// DAO Bridge aggregation class
/// 
/// ClojureDart only holds `DaoBridge` instance, doesn't directly access Drift DAO.
/// 
/// This class aggregates all DAO instances from AppDatabase for convenient access.
class DaoBridge {
  final AppDatabase db;
  
  /// Task DAO instance
  get taskDao => db.taskDao;
  
  /// Forecast DAO instance
  get forecastDao => db.forecastDao;
  
  /// Review DAO instance
  get reviewDao => db.reviewDao;
  
  /// Timeline Event DAO instance
  get timelineEventDao => db.timelineDao;
  
  /// Project DAO instance
  get projectDao => db.projectDao;
  
  /// Perspective DAO instance
  get perspectiveDao => db.perspectiveDao;
  
  /// Inbox DAO instance
  get inboxDao => db.inboxDao;
  
  /// Settings DAO instance
  get settingsDao => db.settingsDao;
  
  /// Forecast Calibration DAO instance
  get forecastCalibrationDao => db.forecastCalibrationDao;
  
  /// Constructor
  /// 
  /// Initializes all DAO instances from the AppDatabase.
  DaoBridge(this.db);
}
