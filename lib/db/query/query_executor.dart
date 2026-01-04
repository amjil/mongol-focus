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
  print('[QueryExecutor] runQuery 开始执行');
  print('[QueryExecutor] QueryPlan: source=${plan.source}, wheres=${plan.wheres.length}条, sortBy=${plan.sortBy}');
  
  switch (plan.source) {
    case 'tasks':
      print('[QueryExecutor] 执行tasks查询');
      return runTaskQuery(db, plan);
    case 'forecasts':
      print('[QueryExecutor] 执行forecasts查询');
      return runForecastQuery(db, plan);
    case 'projects':
      print('[QueryExecutor] 执行projects查询');
      return runProjectQuery(db, plan);
    default:
      print('[QueryExecutor] ❌ 错误: 未知的source类型: ${plan.source}');
      throw ArgumentError('Unknown source: ${plan.source}');
  }
}

/// Run task query
Future<List<Task>> runTaskQuery(AppDatabase db, QueryPlan plan) async {
  print('[QueryExecutor] runTaskQuery 开始执行');
  
  var query = db.select(db.tasks);
  
  // Apply where conditions
  if (plan.wheres.isNotEmpty) {
    print('[QueryExecutor] 应用 ${plan.wheres.length} 个where条件');
    applyTaskWhere(query, plan.wheres);
  } else {
    print('[QueryExecutor] 没有where条件，查询所有tasks');
  }
  
  // Apply sorting
  if (plan.sortBy != null) {
    print('[QueryExecutor] 应用排序: ${plan.sortBy}');
    final sortParts = plan.sortBy!.split(':');
    if (sortParts.length == 2) {
      final field = normalizeFieldName(sortParts[0]);
      final direction = sortParts[1].toLowerCase();
      print('[QueryExecutor] 排序字段: $field, 方向: $direction');
      
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
          print('[QueryExecutor] 未知排序字段 $field，使用默认字段 createdAt');
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
    print('[QueryExecutor] 使用默认排序: createdAt desc');
    query = query..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);
  }
  
  print('[QueryExecutor] 执行数据库查询...');
  final results = await query.get();
  print('[QueryExecutor] 查询完成 - 返回 ${results.length} 条Task记录');
  
  if (results.isEmpty) {
    print('[QueryExecutor] ⚠️ Task查询结果为空');
    // 尝试查询总数以确认是否有数据
    final totalCount = await (db.selectOnly(db.tasks)..addColumns([db.tasks.id.count()])).getSingle();
    print('[QueryExecutor] 数据库中Task总数: ${totalCount.read(db.tasks.id.count())}');
  } else {
    print('[QueryExecutor] 前3条Task记录:');
    for (var i = 0; i < results.length && i < 3; i++) {
      final task = results[i];
      print('[QueryExecutor]   Task[$i]: id=${task.id}, title=${task.title}, completed=${task.completed}, dueAt=${task.dueAt}');
    }
  }
  
  return results;
}

/// Run forecast query
Future<List<Forecast>> runForecastQuery(AppDatabase db, QueryPlan plan) async {
  print('[QueryExecutor] runForecastQuery 开始执行');
  
  var query = db.select(db.forecasts);
  
  // Apply where conditions
  if (plan.wheres.isNotEmpty) {
    print('[QueryExecutor] 应用 ${plan.wheres.length} 个where条件');
    applyForecastWhere(query, plan.wheres);
  } else {
    print('[QueryExecutor] 没有where条件，查询所有forecasts');
  }
  
  // Apply sorting
  if (plan.sortBy != null) {
    print('[QueryExecutor] 应用排序: ${plan.sortBy}');
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
          print('[QueryExecutor] 未知排序字段 $field，使用默认字段 scheduledDate');
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
    print('[QueryExecutor] 使用默认排序: scheduledDate asc');
    query = query..orderBy([(f) => OrderingTerm.asc(f.scheduledDate)]);
  }
  
  print('[QueryExecutor] 执行数据库查询...');
  final results = await query.get();
  print('[QueryExecutor] 查询完成 - 返回 ${results.length} 条Forecast记录');
  
  if (results.isEmpty) {
    print('[QueryExecutor] ⚠️ Forecast查询结果为空');
    final totalCount = await (db.selectOnly(db.forecasts)..addColumns([db.forecasts.id.count()])).getSingle();
    print('[QueryExecutor] 数据库中Forecast总数: ${totalCount.read(db.forecasts.id.count())}');
  }
  
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

