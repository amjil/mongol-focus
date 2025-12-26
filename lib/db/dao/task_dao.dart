import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/tasks.dart';

part 'task_dao.g.dart';

/// Task DAO - Thin layer for task data access
/// 
/// Only provides basic CRUD operations, no business logic.
@DriftAccessor(tables: [Tasks])
class TaskDao extends DatabaseAccessor with _$TaskDaoMixin {
  TaskDao(super.attachedDatabase);

  /// Insert a new task
  Future<void> insertTask(TasksCompanion task) async {
    await into(tasks).insert(task);
  }

  /// Mark task as completed
  Future<void> markCompleted(String taskId) async {
    await (update(tasks)..where((t) => t.id.equals(taskId)))
        .write(const TasksCompanion(completed: Value(true)));
  }

  /// Get all tasks (incomplete)
  Future<List<Task>> watchAllTasks() async {
    return await (select(tasks)..where((t) => t.completed.equals(false))).get();
  }

  /// Get task by ID
  Future<Task?> getTaskById(String taskId) async {
    return await (select(tasks)..where((t) => t.id.equals(taskId))).getSingleOrNull();
  }

  /// Update task
  Future<void> updateTask(String taskId, TasksCompanion updates) async {
    await (update(tasks)..where((t) => t.id.equals(taskId))).write(updates);
  }
}

