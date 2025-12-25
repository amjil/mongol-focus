import '../tables/settings.dart';
import 'dao_bridge.dart';

/// Settings Bridge - Bridge layer for Settings operations
/// 
/// Provides ClojureDart-callable functions for Settings DAO operations.

/// Get setting value by key
Future<String?> getSettingValue(DaoBridge bridge, String key) {
  return bridge.settingsDao.getSettingValue(key);
}

/// Set setting value (insert or update)
Future<void> setSettingValue(DaoBridge bridge, String key, String value) {
  final now = (DateTime.now().millisecondsSinceEpoch / 1000).round();
  return bridge.settingsDao.setSettingValue(key, value, now);
}

/// Delete setting
Future<void> deleteSetting(DaoBridge bridge, String key) {
  return bridge.settingsDao.deleteSetting(key);
}

/// Watch all settings
Stream<List<Setting>> watchAllSettings(DaoBridge bridge) {
  return bridge.settingsDao.watchAllSettings();
}

/// Get all settings (one-time query)
Future<List<Setting>> getAllSettings(DaoBridge bridge) {
  return bridge.settingsDao.getAllSettings();
}

