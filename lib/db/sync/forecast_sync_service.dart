import '../app_database.dart';
import '../dao/task_dao.dart';
import '../dao/project_dao.dart';
import 'forecast_rules.dart';
import 'forecast_sync.dart';

/// ForecastSyncService - Convenient service class
/// 
/// Provides simplified API to sync all ForecastItems
class ForecastSyncService {
  final AppDatabase db;

  ForecastSyncService(this.db);

  /// Sync all ForecastItems
  /// 
  /// This is the main entry function, automatically:
  /// 1. Get all Tasks and Projects
  /// 2. Generate ForecastItems using default rule set
  /// 3. Reconcile with database and update
  Future<void> syncAll() async {
    // Get all Tasks (including completed and uncompleted, rules will filter)
    final tasks = await db.select(db.tasks).get();
    
    // Get all Projects
    final projects = await db.projectDao.watchAllProjects();

    // Sync using default rule set
    await syncForecastItems(
      db: db,
      tasks: tasks,
      projects: projects,
      rules: defaultForecastRules,
    );
  }

  /// Sync with custom rule set
  /// 
  /// Allows passing custom rule list
  Future<void> syncWithRules(List<ForecastRule> rules) async {
    // Get all Tasks (including completed and uncompleted)
    final tasks = await db.select(db.tasks).get();
    final projects = await db.projectDao.watchAllProjects();

    await syncForecastItems(
      db: db,
      tasks: tasks,
      projects: projects,
      rules: rules,
    );
  }
}

/// Convenient function: sync all ForecastItems
/// 
/// This is the simplest way to use, just call directly
/// 
/// Usage example:
/// ```dart
/// await syncAllForecastItems(db);
/// ```
Future<void> syncAllForecastItems(AppDatabase db) async {
  final service = ForecastSyncService(db);
  await service.syncAll();
}

