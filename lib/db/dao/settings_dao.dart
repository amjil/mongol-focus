import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/settings.dart';

part 'settings_dao.g.dart';

/// Settings DAO - Thin layer for settings data access
/// 
/// Only provides basic CRUD operations, no business logic.
@DriftAccessor(tables: [Settings])
class SettingsDao extends DatabaseAccessor with _$SettingsDaoMixin {
  SettingsDao(super.attachedDatabase);

  /// Get setting value by key
  Future<String?> getSettingValue(String key) async {
    final setting = await (select(settings)..where((s) => s.key.equals(key))).getSingleOrNull();
    return setting?.value;
  }

  /// Set setting value (insert or update)
  Future<void> setSettingValue(String key, String value, int updatedAt) async {
    await into(settings).insertOnConflictUpdate(
      SettingsCompanion(
        key: Value(key),
        value: Value(value),
        updatedAt: Value(updatedAt),
      ),
    );
  }

  /// Delete setting
  Future<void> deleteSetting(String key) async {
    await (delete(settings)..where((s) => s.key.equals(key))).go();
  }

  /// Watch all settings
  Stream<List<Setting>> watchAllSettings() {
    return (select(settings)
          ..orderBy([(s) => OrderingTerm.asc(s.key)]))
        .watch();
  }

  /// Get all settings (one-time query)
  Future<List<Setting>> getAllSettings() async {
    return await (select(settings)
          ..orderBy([(s) => OrderingTerm.asc(s.key)]))
        .get();
  }
}

