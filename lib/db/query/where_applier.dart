import 'package:drift/drift.dart';

import '../tables/tasks.dart';
import '../tables/forecasts.dart';
import '../tables/projects.dart';
import 'query_plan.dart';

/// Apply where conditions to a Tasks query
void applyTaskWhere<T>(
  T q,
  List<WhereClause> wheres,
) {
  for (var i = 0; i < wheres.length; i++) {
    final w = wheres[i];
    
    final field = normalizeFieldName(w.field);
    
    switch (field) {
      case 'due':
      case 'dueat':
      case 'due-at':
        // Note: dueAt field may not exist in current schema
        // This will cause runtime error if field doesn't exist
        try {
          _applyNullableIntWhere<T, Tasks>(q, (t) => (t as dynamic).dueAt, w);
        } catch (e) {
          // Field doesn't exist, skip
        }
        break;
        
      case 'defer':
      case 'deferat':
      case 'defer-at':
        // Note: deferAt field may not exist in current schema
        try {
          _applyNullableIntWhere<T, Tasks>(q, (t) => (t as dynamic).deferAt, w);
        } catch (e) {
          // Field doesn't exist, skip
        }
        break;
        
      case 'priority':
        _applyIntWhere<T, Tasks>(q, (t) => t.priority, w);
        break;
        
      case 'completed':
        _applyBoolWhere<T, Tasks>(q, (t) => t.completed, w);
        break;
        
      case 'status':
        // Convert status string to completed boolean
        // 'active' -> false (not completed)
        // 'completed' -> true (completed)
        // 'waiting' -> false (not completed, but could be handled differently)
        final statusValue = _convertStatusToBool(w.value);
        if (statusValue != null) {
          final statusWhere = WhereClause(
            field: w.field,
            op: w.op,
            value: statusValue,
          );
          _applyBoolWhere<T, Tasks>(q, (t) => t.completed, statusWhere);
        }
        break;
        
      case 'projectid':
      case 'project-id':
        _applyNullableStringWhere<T, Tasks>(q, (t) => t.projectId, w);
        break;
        
      case 'id':
        _applyStringWhere<T, Tasks>(q, (t) => t.id, w);
        break;
        
      case 'title':
        _applyStringWhere<T, Tasks>(q, (t) => t.title, w);
        break;
        
      case 'createdat':
      case 'created-at':
        _applyIntWhere<T, Tasks>(q, (t) => t.createdAt, w);
        break;
        
      case 'postponecount':
      case 'postpone-count':
        _applyIntWhere<T, Tasks>(q, (t) => t.postponeCount, w);
        break;
        
      case 'abandoned':
        _applyBoolWhere<T, Tasks>(q, (t) => t.abandoned, w);
        break;
        
      default:
        // Unknown field, skip
        break;
    }
  }
}

/// Apply where conditions to a Forecasts query
void applyForecastWhere<T>(
  T q,
  List<WhereClause> wheres,
) {
  for (var i = 0; i < wheres.length; i++) {
    final w = wheres[i];
    
    final field = normalizeFieldName(w.field);
    
    switch (field) {
      case 'scheduleddate':
      case 'scheduled-date':
        _applyIntWhere<T, Forecasts>(q, (f) => f.scheduledDate, w);
        break;
        
      case 'done':
        _applyBoolWhere<T, Forecasts>(q, (f) => f.done, w);
        break;
        
      case 'skipped':
        _applyBoolWhere<T, Forecasts>(q, (f) => f.skipped, w);
        break;
        
      case 'confidence':
        _applyIntWhere<T, Forecasts>(q, (f) => f.confidence, w);
        break;
        
      case 'source':
        _applyIntWhere<T, Forecasts>(q, (f) => f.source, w);
        break;
        
      case 'taskid':
      case 'task-id':
        _applyStringWhere<T, Forecasts>(q, (f) => f.taskId, w);
        break;
        
      case 'id':
        _applyStringWhere<T, Forecasts>(q, (f) => f.id, w);
        break;
        
      case 'type':
        // Note: type field might not exist in current schema, but included for future
        break;
        
      case 'createdat':
      case 'created-at':
        _applyIntWhere<T, Forecasts>(q, (f) => f.createdAt, w);
        break;
        
      default:
        // Unknown field, skip
        break;
    }
  }
}

/// Apply where conditions to a Projects query
void applyProjectWhere<T>(
  T q,
  List<WhereClause> wheres,
) {
  for (var i = 0; i < wheres.length; i++) {
    final w = wheres[i];
    
    final field = normalizeFieldName(w.field);
    
    switch (field) {
      case 'id':
        _applyStringWhere<T, Projects>(q, (p) => p.id, w);
        break;
        
      case 'title':
        _applyStringWhere<T, Projects>(q, (p) => p.title, w);
        break;
        
      case 'status':
        _applyStringWhere<T, Projects>(q, (p) => p.status, w);
        break;
        
      case 'createdat':
      case 'created-at':
        _applyIntWhere<T, Projects>(q, (p) => p.createdAt, w);
        break;
        
      case 'reviewat':
      case 'review-at':
        _applyNullableIntWhere<T, Projects>(q, (p) => p.reviewAt, w);
        break;
        
      case 'completed':
        _applyBoolWhere<T, Projects>(q, (p) => p.completed, w);
        break;
        
      default:
        // Unknown field, skip
        break;
    }
  }
}

/// Normalize field name (lowercase, remove hyphens)
String normalizeFieldName(String field) {
  return field.toLowerCase().replaceAll('-', '');
}

/// Apply where condition to IntColumn
void _applyIntWhere<T, D>(
  T q,
  Expression<int> Function(D) column,
  WhereClause w,
) {
  final op = normalizeOp(w.op);
  
  final value = _convertToInt(w.value);
  
  if (value == null) {
    return;
  }
  
  switch (op) {
    case '=':
    case '==':
      (q as dynamic).where((d) => column(d).equals(value));
      break;
    case '!=':
      (q as dynamic).where((d) => column(d).isNotValue(value));
      break;
    case '<':
      (q as dynamic).where((d) => (column(d) as dynamic).isSmallerThanValue(value));
      break;
    case '<=':
      (q as dynamic).where((d) => (column(d) as dynamic).isSmallerOrEqualValue(value));
      break;
    case '>':
      (q as dynamic).where((d) => (column(d) as dynamic).isBiggerThanValue(value));
      break;
    case '>=':
      (q as dynamic).where((d) => (column(d) as dynamic).isBiggerOrEqualValue(value));
      break;
    case 'between':
      if (w.value is List && (w.value as List).length == 2) {
        final list = w.value as List;
        final start = _convertToInt(list[0]);
        final end = _convertToInt(list[1]);
        if (start != null && end != null) {
          (q as dynamic).where((d) => (column(d) as dynamic).isBetweenValues(start, end));
        }
      }
      break;
    case 'in':
      if (w.value is List) {
        final list = (w.value as List).map((v) => _convertToInt(v)).whereType<int>().toList();
        if (list.isNotEmpty) {
          (q as dynamic).where((d) => column(d).isIn(list));
        }
      }
      break;
  }
}

/// Apply where condition to nullable IntColumn
void _applyNullableIntWhere<T, D>(
  T q,
  dynamic Function(D) column,
  WhereClause w,
) {
  final op = normalizeOp(w.op);
  
  if (op == 'is-null' || op == 'isnull') {
    (q as dynamic).where((d) => column(d).isNull());
    return;
  }
  
  if (op == 'is-not-null' || op == 'isnotnull') {
    (q as dynamic).where((d) => column(d).isNotNull());
    return;
  }
  
  final value = _convertToInt(w.value);
  if (value == null) return;
  
  switch (op) {
    case '=':
    case '==':
      (q as dynamic).where((d) => column(d).equals(value));
      break;
    case '!=':
      (q as dynamic).where((d) => column(d).isNotValue(value));
      break;
    case '<':
      (q as dynamic).where((d) => (column(d) as dynamic).isSmallerThanValue(value));
      break;
    case '<=':
      (q as dynamic).where((d) => (column(d) as dynamic).isSmallerOrEqualValue(value));
      break;
    case '>':
      (q as dynamic).where((d) => (column(d) as dynamic).isBiggerThanValue(value));
      break;
    case '>=':
      (q as dynamic).where((d) => (column(d) as dynamic).isBiggerOrEqualValue(value));
      break;
    case 'between':
      if (w.value is List && (w.value as List).length == 2) {
        final list = w.value as List;
        final start = _convertToInt(list[0]);
        final end = _convertToInt(list[1]);
        if (start != null && end != null) {
          (q as dynamic).where((d) => (column(d) as dynamic).isBetweenValues(start, end));
        }
      }
      break;
    case 'in':
      if (w.value is List) {
        final list = (w.value as List).map((v) => _convertToInt(v)).whereType<int>().toList();
        if (list.isNotEmpty) {
          (q as dynamic).where((d) => column(d).isIn(list));
        }
      }
      break;
  }
}

/// Apply where condition to StringColumn
void _applyStringWhere<T, D>(
  T q,
  Expression<String> Function(D) column,
  WhereClause w,
) {
  final op = normalizeOp(w.op);
  
  if (op == 'is-null' || op == 'isnull') {
    (q as dynamic).where((d) => column(d).isNull());
    return;
  }
  
  if (op == 'is-not-null' || op == 'isnotnull') {
    (q as dynamic).where((d) => column(d).isNotNull());
    return;
  }
  
  if (w.value is! String) return;
  final value = w.value as String;
  
  switch (op) {
    case '=':
    case '==':
      (q as dynamic).where((d) => column(d).equals(value));
      break;
    case '!=':
      (q as dynamic).where((d) => column(d).isNotValue(value));
      break;
    case 'like':
      (q as dynamic).where((d) => (column(d) as dynamic).like('%$value%'));
      break;
    case 'in':
      if (w.value is List) {
        final list = (w.value as List).whereType<String>().toList();
        if (list.isNotEmpty) {
          (q as dynamic).where((d) => column(d).isIn(list));
        }
      }
      break;
  }
}

/// Apply where condition to nullable StringColumn
void _applyNullableStringWhere<T, D>(
  T q,
  dynamic Function(D) column,
  WhereClause w,
) {
  final op = normalizeOp(w.op);
  
  if (op == 'is-null' || op == 'isnull') {
    (q as dynamic).where((d) => column(d).isNull());
    return;
  }
  
  if (op == 'is-not-null' || op == 'isnotnull') {
    (q as dynamic).where((d) => column(d).isNotNull());
    return;
  }
  
  if (w.value is! String) return;
  final value = w.value as String;
  
  switch (op) {
    case '=':
    case '==':
      (q as dynamic).where((d) => column(d).equals(value));
      break;
    case '!=':
      (q as dynamic).where((d) => column(d).isNotValue(value));
      break;
    case 'like':
      (q as dynamic).where((d) => (column(d) as dynamic).like('%$value%'));
      break;
    case 'in':
      if (w.value is List) {
        final list = (w.value as List).whereType<String>().toList();
        if (list.isNotEmpty) {
          (q as dynamic).where((d) => column(d).isIn(list));
        }
      }
      break;
  }
}

/// Apply where condition to BoolColumn
void _applyBoolWhere<T, D>(
  T q,
  Expression<bool> Function(D) column,
  WhereClause w,
) {
  final op = normalizeOp(w.op);
  
  if (w.value is! bool) return;
  final value = w.value as bool;
  
  switch (op) {
    case '=':
    case '==':
      (q as dynamic).where((d) => column(d).equals(value));
      break;
    case '!=':
      (q as dynamic).where((d) => column(d).isNotValue(value));
      break;
  }
}

/// Normalize operator name
String normalizeOp(String op) {
  return op.toLowerCase().replaceAll('_', '-');
}

/// Convert value to int (handles DateTime, int, String)
int? _convertToInt(dynamic value) {
  if (value is int) return value;
  if (value is DateTime) {
    // Convert DateTime to milliseconds timestamp
    return value.millisecondsSinceEpoch;
  }
  if (value is String) {
    // Try to parse as int
    return int.tryParse(value);
  }
  return null;
}

/// Convert status string to boolean completed value
/// 
/// 'active' -> false (not completed)
/// 'completed' -> true (completed)
/// 'waiting' -> false (not completed)
/// 
/// Returns null if value is not a recognized status string
bool? _convertStatusToBool(dynamic value) {
  if (value is bool) {
    return value;
  }
  if (value is String) {
    final status = value.toLowerCase();
    if (status == 'active' || status == 'waiting') {
      return false; // Not completed
    } else if (status == 'completed') {
      return true; // Completed
    }
  }
  return null;
}

