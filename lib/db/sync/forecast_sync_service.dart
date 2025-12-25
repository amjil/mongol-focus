import '../app_database.dart';
import '../dao/task_dao.dart';
import '../dao/project_dao.dart';
import 'forecast_rules.dart';
import 'forecast_sync.dart';

/// ForecastSyncService - 便捷服务类
/// 
/// 提供简化的 API 来同步所有 ForecastItems
class ForecastSyncService {
  final AppDatabase db;

  ForecastSyncService(this.db);

  /// 同步所有 ForecastItems
  /// 
  /// 这是主要的入口函数，会自动：
  /// 1. 获取所有 Tasks 和 Projects
  /// 2. 使用默认规则集生成 ForecastItems
  /// 3. 与数据库对账并更新
  Future<void> syncAll() async {
    // 获取所有 Tasks（包括已完成和未完成的，因为规则会过滤）
    final tasks = await db.select(db.tasks).get();
    
    // 获取所有 Projects
    final projects = await db.projectDao.watchAllProjects();

    // 使用默认规则集同步
    await syncForecastItems(
      db: db,
      tasks: tasks,
      projects: projects,
      rules: defaultForecastRules,
    );
  }

  /// 使用自定义规则集同步
  /// 
  /// 允许传入自定义的规则列表
  Future<void> syncWithRules(List<ForecastRule> rules) async {
    // 获取所有 Tasks（包括已完成和未完成的）
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

/// 便捷函数：同步所有 ForecastItems
/// 
/// 这是最简单的使用方式，直接调用即可
/// 
/// 使用示例：
/// ```dart
/// await syncAllForecastItems(db);
/// ```
Future<void> syncAllForecastItems(AppDatabase db) async {
  final service = ForecastSyncService(db);
  await service.syncAll();
}

