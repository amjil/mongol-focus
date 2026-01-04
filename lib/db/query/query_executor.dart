import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/tasks.dart';
import '../tables/forecasts.dart';
import '../tables/projects.dart';
import 'query_plan.dart';
import 'where_applier.dart';

/// Run query based on QueryPlan
/// 
/// Returns raw data (List<dynamic>), no grouping
Future<List<dynamic>> runQuery(AppDatabase db, QueryPlan plan) {
  switch (plan.source) {
    case 'tasks':
      return runTaskQuery(db, plan);
    case 'forecasts':
      return runForecastQuery(db, plan);
    case 'projects':
      return runProjectQuery(db, plan);
    default:
      throw ArgumentError('Unknown source: ${plan.source}');
  }
}

/// Run task query
Future<List<Task>> runTaskQuery(AppDatabase db, QueryPlan plan) async {
  var query = db.select(db.tasks);
  
  // Apply where conditions
  if (plan.wheres.isNotEmpty) {
    applyTaskWhere(query, plan.wheres);
  }
  
  // Apply sorting
  if (plan.sortBy != null) {
    final sortParts = plan.sortBy!.split(':');
    if (sortParts.length == 2) {
      final field = normalizeFieldName(sortParts[0]);
      final direction = sortParts[1].toLowerCase();
      
      Expression<Comparable> Function(Tasks) getColumn;
      switch (field) {
        case 'due':
        case 'dueat':
        case 'due-at':
          getColumn = (t) => t.dueAt;
          break;
        case 'defer':
        case 'deferat':
        case 'defer-at':
          getColumn = (t) => t.deferAt;
          break;
        case 'priority':
          getColumn = (t) => t.priority;
          break;
        case 'createdat':
        case 'created-at':
          getColumn = (t) => t.createdAt;
          break;
        case 'title':
          getColumn = (t) => t.title;
          break;
        case 'postponecount':
        case 'postpone-count':
          getColumn = (t) => t.postponeCount;
          break;
        default:
          // Default to createdAt
          getColumn = (t) => t.createdAt;
      }
      
      if (direction == 'asc') {
        query = query..orderBy([(t) => OrderingTerm.asc(getColumn(t))]);
      } else {
        query = query..orderBy([(t) => OrderingTerm.desc(getColumn(t))]);
      }
    }
  } else {
    // Default sort by createdAt desc
    query = query..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);
  }
  
  final results = await query.get();
  
  return results;
}

/// Run forecast query
Future<List<Forecast>> runForecastQuery(AppDatabase db, QueryPlan plan) async {
  var query = db.select(db.forecasts);
  
  // Apply where conditions
  if (plan.wheres.isNotEmpty) {
    applyForecastWhere(query, plan.wheres);
  }
  
  // Apply sorting
  if (plan.sortBy != null) {
    final sortParts = plan.sortBy!.split(':');
    if (sortParts.length == 2) {
      final field = normalizeFieldName(sortParts[0]);
      final direction = sortParts[1].toLowerCase();
      
      Expression<Comparable> Function(Forecasts) getColumn;
      switch (field) {
        case 'scheduleddate':
        case 'scheduled-date':
          getColumn = (f) => f.scheduledDate;
          break;
        case 'confidence':
          getColumn = (f) => f.confidence;
          break;
        case 'createdat':
        case 'created-at':
          getColumn = (f) => f.createdAt;
          break;
        case 'source':
          getColumn = (f) => f.source;
          break;
        default:
          // Default to scheduledDate
          getColumn = (f) => f.scheduledDate;
      }
      
      if (direction == 'asc') {
        query = query..orderBy([(f) => OrderingTerm.asc(getColumn(f))]);
      } else {
        query = query..orderBy([(f) => OrderingTerm.desc(getColumn(f))]);
      }
    }
  } else {
    // Default sort by scheduledDate asc
    query = query..orderBy([(f) => OrderingTerm.asc(f.scheduledDate)]);
  }
  
  final results = await query.get();
  
  return results;
}

/// Run project query
Future<List<Project>> runProjectQuery(AppDatabase db, QueryPlan plan) async {
  var query = db.select(db.projects);
  
  // Apply where conditions
  if (plan.wheres.isNotEmpty) {
    applyProjectWhere(query, plan.wheres);
  }
  
  // Apply sorting
  if (plan.sortBy != null) {
    final sortParts = plan.sortBy!.split(':');
    if (sortParts.length == 2) {
      final field = normalizeFieldName(sortParts[0]);
      final direction = sortParts[1].toLowerCase();
      
      Expression<Comparable> Function(Projects) getColumn;
      switch (field) {
        case 'createdat':
        case 'created-at':
          getColumn = (p) => p.createdAt;
          break;
        case 'reviewat':
        case 'review-at':
          getColumn = (p) => p.reviewAt;
          break;
        case 'title':
          getColumn = (p) => p.title;
          break;
        case 'status':
          getColumn = (p) => p.status;
          break;
        default:
          // Default to createdAt
          getColumn = (p) => p.createdAt;
      }
      
      if (direction == 'asc') {
        query = query..orderBy([(p) => OrderingTerm.asc(getColumn(p))]);
      } else {
        query = query..orderBy([(p) => OrderingTerm.desc(getColumn(p))]);
      }
    }
  } else {
    // Default sort by createdAt desc
    query = query..orderBy([(p) => OrderingTerm.desc(p.createdAt)]);
  }
  
  return await query.get();
}

/// Normalize field name (lowercase, remove hyphens)
String normalizeFieldName(String field) {
  return field.toLowerCase().replaceAll('-', '');
}

