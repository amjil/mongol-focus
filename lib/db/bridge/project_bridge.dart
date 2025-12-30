import '../app_database.dart';
import 'dao_bridge.dart';

/// Project Bridge - Bridge layer for Project operations
/// 
/// Provides ClojureDart-callable functions for Project DAO operations.

/// Insert a new project
Future<void> insertProject(DaoBridge bridge, ProjectsCompanion project) {
  return bridge.projectDao.insertProject(project);
}

/// Watch all projects
Stream<List<Project>> watchAllProjects(DaoBridge bridge) {
  return bridge.projectDao.watchAllProjects();
}

/// Get project by ID
Future<Project?> getProjectById(DaoBridge bridge, String projectId) {
  return bridge.projectDao.getProjectById(projectId);
}

/// Get project's next action
Future<Task?> getNextAction(DaoBridge bridge, String projectId) {
  return bridge.projectDao.getNextAction(projectId);
}

/// Get all tasks for project
Future<List<Task>> getProjectTasks(DaoBridge bridge, String projectId) {
  return bridge.projectDao.getProjectTasks(projectId);
}

/// Update project status
Future<void> updateProjectStatus(DaoBridge bridge, String projectId, String status) {
  return bridge.projectDao.updateProjectStatus(projectId, status);
}

/// Update project review date
Future<void> updateProjectReviewAt(DaoBridge bridge, String projectId, int? reviewAt) {
  return bridge.projectDao.updateProjectReviewAt(projectId, reviewAt);
}

/// Update project title
Future<void> updateProjectTitle(DaoBridge bridge, String projectId, String title) {
  return bridge.projectDao.updateProjectTitle(projectId, title);
}

