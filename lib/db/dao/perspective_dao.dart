import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/perspectives.dart';

part 'perspective_dao.g.dart';

/// Perspective DAO - Thin layer for perspective data access
/// 
/// Only provides basic CRUD operations, no business logic.
@DriftAccessor(tables: [Perspectives])
class PerspectiveDao extends DatabaseAccessor with _$PerspectiveDaoMixin {
  PerspectiveDao(super.attachedDatabase);

  /// Insert a new perspective
  Future<void> insertPerspective(PerspectivesCompanion perspective) async {
    await into(perspectives).insert(perspective);
  }

  /// Update perspective weight
  Future<void> updateWeight(String perspectiveId, double weight, int updatedAt) async {
    await (update(perspectives)..where((p) => p.id.equals(perspectiveId)))
        .write(PerspectivesCompanion(
          weight: Value(weight),
          updatedAt: Value(updatedAt),
        ));
  }

  /// Update perspective weight history
  Future<void> updateWeightHistory(String perspectiveId, String weightHistoryJson, int updatedAt) async {
    await (update(perspectives)..where((p) => p.id.equals(perspectiveId)))
        .write(PerspectivesCompanion(
          weightHistory: Value(weightHistoryJson),
          updatedAt: Value(updatedAt),
        ));
  }

  /// Watch all perspectives
  Stream<List<Perspective>> watchAll() {
    return (select(perspectives)
          ..orderBy([(p) => OrderingTerm.desc(p.weight)]))
        .watch();
  }

  /// Get perspective by ID
  Future<Perspective?> getById(String perspectiveId) async {
    return await (select(perspectives)..where((p) => p.id.equals(perspectiveId))).getSingleOrNull();
  }

  /// Update perspective rules
  Future<void> updateRules(String perspectiveId, String rulesJson, int updatedAt) async {
    await (update(perspectives)..where((p) => p.id.equals(perspectiveId)))
        .write(PerspectivesCompanion(
          rules: Value(rulesJson),
          updatedAt: Value(updatedAt),
        ));
  }
}

