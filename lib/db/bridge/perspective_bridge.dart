import '../tables/perspectives.dart';
import 'dao_bridge.dart';

/// Perspective Bridge - Bridge layer for Perspective operations
/// 
/// Provides ClojureDart-callable functions for Perspective DAO operations.

/// Insert a new perspective
Future<void> insertPerspective(DaoBridge bridge, PerspectivesCompanion perspective) {
  return bridge.perspectiveDao.insertPerspective(perspective);
}

/// Update perspective weight
Future<void> updateWeight(DaoBridge bridge, String perspectiveId, double weight, int updatedAt) {
  return bridge.perspectiveDao.updateWeight(perspectiveId, weight, updatedAt);
}

/// Update perspective weight history
Future<void> updateWeightHistory(
  DaoBridge bridge,
  String perspectiveId,
  String weightHistoryJson,
  int updatedAt,
) {
  return bridge.perspectiveDao.updateWeightHistory(perspectiveId, weightHistoryJson, updatedAt);
}

/// Watch all perspectives
Stream<List<Perspective>> watchAll(DaoBridge bridge) {
  return bridge.perspectiveDao.watchAll();
}

/// Get perspective by ID
Future<Perspective?> getById(DaoBridge bridge, String perspectiveId) {
  return bridge.perspectiveDao.getById(perspectiveId);
}

/// Update perspective rules
Future<void> updateRules(DaoBridge bridge, String perspectiveId, String rulesJson, int updatedAt) {
  return bridge.perspectiveDao.updateRules(perspectiveId, rulesJson, updatedAt);
}

