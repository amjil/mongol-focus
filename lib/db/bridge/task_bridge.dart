import '../app_database.dart';
import 'dao_bridge.dart';

/// Task Bridge - Bridge layer for Task operations
/// 
/// Provides ClojureDart-callable functions for Task DAO operations.

/// Mark task as completed
Future<void> markTaskCompleted(DaoBridge bridge, String taskId) {
  return bridge.taskDao.markCompleted(taskId);
}

/// Insert a new task
Future<void> insertTask(DaoBridge bridge, TasksCompanion task) {
  return bridge.taskDao.insertTask(task);
}

/// Get all tasks (incomplete)
Stream<List<Task>> watchAllTasks(DaoBridge bridge) {
  return bridge.taskDao.watchAllTasks();
}

/// Get task by ID
Future<Task?> getTaskById(DaoBridge bridge, String taskId) {
  return bridge.taskDao.getTaskById(taskId);
}

/// Update task
Future<void> updateTask(DaoBridge bridge, String taskId, TasksCompanion updates) {
  return bridge.taskDao.updateTask(taskId, updates);
}

