import 'package:drift/drift.dart';
import 'database.dart';

/// Data Access Object for TaskDependencies table
/// Handles all database operations for task dependency relationships
class TaskDependenciesDao {
  final AppDatabase _db;

  TaskDependenciesDao(this._db);

  /// Create a dependency relationship
  /// dependentTaskId depends on dependsOnTaskId
  /// (dependentTaskId cannot be executed until dependsOnTaskId is completed)
  Future<void> createDependency(String dependentTaskId, String dependsOnTaskId) async {
    final companion = TaskDependenciesCompanion.insert(
      dependentTaskId: dependentTaskId,
      dependsOnTaskId: dependsOnTaskId,
    );
    await (_db.into(_db.taskDependencies)).insert(companion);
  }

  /// Delete a dependency relationship
  Future<void> deleteDependency(String dependentTaskId, String dependsOnTaskId) async {
    await (_db.delete(_db.taskDependencies)
          ..where((tbl) =>
              tbl.dependentTaskId.equals(dependentTaskId) &
              tbl.dependsOnTaskId.equals(dependsOnTaskId)))
        .go();
  }

  /// Delete all dependencies where a task is the dependent task
  Future<void> deleteDependenciesWhereDependent(String taskId) async {
    await (_db.delete(_db.taskDependencies)
          ..where((tbl) => tbl.dependentTaskId.equals(taskId)))
        .go();
  }

  /// Delete all dependencies where a task is the depended-on task
  Future<void> deleteDependenciesWhereDependedOn(String taskId) async {
    await (_db.delete(_db.taskDependencies)
          ..where((tbl) => tbl.dependsOnTaskId.equals(taskId)))
        .go();
  }

  /// Delete all dependencies involving a task (both as dependent and depended-on)
  Future<void> deleteAllDependenciesForTask(String taskId) async {
    await deleteDependenciesWhereDependent(taskId);
    await deleteDependenciesWhereDependedOn(taskId);
  }

  /// Get all tasks that the specified task depends on
  Future<List<TaskDependency>> getDependencies(String dependentTaskId) async {
    return await (_db.select(_db.taskDependencies)
          ..where((tbl) => tbl.dependentTaskId.equals(dependentTaskId)))
        .get();
  }

  /// Get all tasks that depend on the specified task
  Future<List<TaskDependency>> getDependents(String dependsOnTaskId) async {
    return await (_db.select(_db.taskDependencies)
          ..where((tbl) => tbl.dependsOnTaskId.equals(dependsOnTaskId)))
        .get();
  }

  /// Get all tasks that the specified task depends on (with task details)
  Future<List<Item>> getDependencyTasks(String dependentTaskId) async {
    final dependencies = await getDependencies(dependentTaskId);
    if (dependencies.isEmpty) {
      return [];
    }
    final dependsOnIds = dependencies.map((d) => d.dependsOnTaskId).toList();
    return await (_db.select(_db.items)
          ..where((tbl) => tbl.id.isIn(dependsOnIds)))
        .get();
  }

  /// Get all tasks that depend on the specified task (with task details)
  Future<List<Item>> getDependentTasks(String dependsOnTaskId) async {
    final dependents = await getDependents(dependsOnTaskId);
    if (dependents.isEmpty) {
      return [];
    }
    final dependentIds = dependents.map((d) => d.dependentTaskId).toList();
    return await (_db.select(_db.items)
          ..where((tbl) => tbl.id.isIn(dependentIds)))
        .get();
  }

  /// Check if a task has any uncompleted dependencies
  Future<bool> hasUncompletedDependencies(String taskId) async {
    final dependencies = await getDependencies(taskId);
    if (dependencies.isEmpty) {
      return false;
    }
    final dependsOnIds = dependencies.map((d) => d.dependsOnTaskId).toList();
    final tasks = await (_db.select(_db.items)
          ..where((tbl) =>
              tbl.id.isIn(dependsOnIds) &
              tbl.status.isNotValue('completed')))
        .get();
    return tasks.isNotEmpty;
  }

  /// Get complete dependency chain (all tasks in the dependency path)
  /// Returns a map: taskId -> list of taskIds it depends on (directly or indirectly)
  Future<Map<String, List<String>>> getDependencyChain(String taskId) async {
    final chain = <String, List<String>>{};
    final visited = <String>{};
    
    Future<void> traverse(String currentTaskId) async {
      if (visited.contains(currentTaskId)) {
        return;
      }
      visited.add(currentTaskId);
      
      final dependencies = await getDependencies(currentTaskId);
      final directDeps = dependencies.map((d) => d.dependsOnTaskId).toList();
      chain[currentTaskId] = directDeps;
      
      // Recursively traverse dependencies
      for (final depId in directDeps) {
        await traverse(depId);
        // Add indirect dependencies
        if (chain.containsKey(depId)) {
          chain[currentTaskId] = [
            ...directDeps,
            ...chain[depId]!,
          ];
        }
      }
    }
    
    await traverse(taskId);
    return chain;
  }

  /// Check for circular dependencies
  /// Returns true if there's a circular dependency involving the given task
  Future<bool> hasCircularDependency(String taskId) async {
    final visited = <String>{};
    final recursionStack = <String>{};
    
    Future<bool> hasCycle(String currentTaskId) async {
      if (recursionStack.contains(currentTaskId)) {
        return true; // Found a cycle
      }
      if (visited.contains(currentTaskId)) {
        return false; // Already processed, no cycle from here
      }
      
      visited.add(currentTaskId);
      recursionStack.add(currentTaskId);
      
      final dependencies = await getDependencies(currentTaskId);
      for (final dep in dependencies) {
        if (await hasCycle(dep.dependsOnTaskId)) {
          return true;
        }
      }
      
      recursionStack.remove(currentTaskId);
      return false;
    }
    
    return await hasCycle(taskId);
  }
}

