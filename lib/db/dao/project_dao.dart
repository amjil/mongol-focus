import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/projects.dart';
import '../tables/tasks.dart';

part 'project_dao.g.dart';

/// Project DAO - Thin layer for project data access
/// 
/// Only provides basic CRUD operations, no business logic.
@DriftAccessor(tables: [Projects, Tasks])
class ProjectDao extends DatabaseAccessor with _$ProjectDaoMixin {
  ProjectDao(super.attachedDatabase);

  /// Insert a new project
  Future<void> insertProject(ProjectsCompanion project) async {
    await into(projects).insert(project);
  }

  /// Watch all projects
  Future<List<Project>> watchAllProjects() async {
    return await (select(projects)
          ..orderBy([(p) => OrderingTerm.desc(p.createdAt)]))
        .get();
  }

  /// Get project by ID
  Future<Project?> getProjectById(String projectId) async {
    return await (select(projects)..where((p) => p.id.equals(projectId))).getSingleOrNull();
  }

  /// Get project's next action (first incomplete task)
  Future<Task?> getNextAction(String projectId) async {
    return await (select(tasks)
          ..where((t) => t.projectId.equals(projectId) & t.completed.equals(false))
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  /// Get all tasks for project
  Future<List<Task>> getProjectTasks(String projectId) async {
    return await (select(tasks)
          ..where((t) => t.projectId.equals(projectId))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  /// Update project status
  Future<void> updateProjectStatus(String projectId, String status) async {
    await (update(projects)..where((p) => p.id.equals(projectId)))
        .write(ProjectsCompanion(status: Value(status)));
  }

  /// Update project review date
  Future<void> updateProjectReviewAt(String projectId, int? reviewAt) async {
    await (update(projects)..where((p) => p.id.equals(projectId)))
        .write(ProjectsCompanion(reviewAt: Value(reviewAt)));
  }

  /// Update project title
  Future<void> updateProjectTitle(String projectId, String title) async {
    await (update(projects)..where((p) => p.id.equals(projectId)))
        .write(ProjectsCompanion(title: Value(title)));
  }
}

