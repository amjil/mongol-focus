import 'query_plan.dart';

/// Perspective - Declarative query specification
class Perspective {
  /// Source type: 'tasks', 'forecast', 'projects'
  final String source;
  
  /// List of filters
  final List<PerspectiveFilter> filters;
  
  /// Sort specification: 'field:asc' or 'field:desc'
  final String? sortBy;
  
  /// Group by field (e.g., 'date', 'projectId')
  final String? groupBy;
  
  /// Display type (e.g., 'timeline', 'list')
  final String? display;
  
  Perspective({
    required this.source,
    required this.filters,
    this.sortBy,
    this.groupBy,
    this.display,
  });
  
  /// Create from map (for ClojureDart interop)
  factory Perspective.fromMap(Map<String, dynamic> map) {
    final filters = (map['filters'] as List<dynamic>?)
        ?.map((f) => PerspectiveFilter.fromMap(f as Map<String, dynamic>))
        .toList() ?? [];
    
    final source = map['source'] as String?;
    if (source == null) {
      throw ArgumentError('map["source"] cannot be null');
    }
    
    return Perspective(
      source: source,
      filters: filters,
      sortBy: map['sortBy'] as String?,
      groupBy: map['groupBy'] as String?,
      display: map['display'] as String?,
    );
  }
  
  /// Convert to map (for ClojureDart interop)
  Map<String, dynamic> toMap() {
    return {
      'source': source,
      'filters': filters.map((f) => f.toMap()).toList(),
      if (sortBy != null) 'sortBy': sortBy,
      if (groupBy != null) 'groupBy': groupBy,
      if (display != null) 'display': display,
    };
  }
}

/// PerspectiveFilter - Single filter condition
class PerspectiveFilter {
  /// Field name
  final String field;
  
  /// Operator
  final String op;
  
  /// Value (can be dynamic)
  final dynamic value;
  
  PerspectiveFilter({
    required this.field,
    required this.op,
    required this.value,
  });
  
  /// Create from map (for ClojureDart interop)
  factory PerspectiveFilter.fromMap(Map<String, dynamic> map) {
    final field = map['field'] as String?;
    final op = map['op'] as String?;
    if (field == null) {
      throw ArgumentError('map["field"] cannot be null');
    }
    if (op == null) {
      throw ArgumentError('map["op"] cannot be null');
    }
    return PerspectiveFilter(
      field: field,
      op: op,
      value: map['value'],
    );
  }
  
  /// Convert to map (for ClojureDart interop)
  Map<String, dynamic> toMap() {
    return {
      'field': field,
      'op': op,
      'value': value,
    };
  }
}

/// Compile Perspective to QueryPlan
/// 
/// Handles time semantics conversion (e.g., 'today' → DateTime)
QueryPlan compilePerspective(Perspective perspective) {
  print('[PerspectiveCompiler] 开始编译Perspective');
  print('[PerspectiveCompiler] 输入: source=${perspective.source}, filters=${perspective.filters.length}条');
  
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  print('[PerspectiveCompiler] 当前时间: $now, 今天: $today');
  
  final compiledWheres = perspective.filters.map((f) {
    print('[PerspectiveCompiler] 编译过滤器: ${f.field} ${f.op} ${f.value}');
    final compiled = compileFilter(f, today);
    print('[PerspectiveCompiler] 编译后: ${compiled.field} ${compiled.op} ${compiled.value}');
    return compiled;
  }).toList();
  
  // Normalize source name
  final source = normalizeSource(perspective.source);
  print('[PerspectiveCompiler] 标准化source: ${perspective.source} -> $source');
  
  final plan = QueryPlan(
    source: source,
    wheres: compiledWheres,
    sortBy: perspective.sortBy,
  );
  
  print('[PerspectiveCompiler] 编译完成 - QueryPlan: source=$source, wheres=${compiledWheres.length}条, sortBy=${perspective.sortBy}');
  
  return plan;
}

/// Compile PerspectiveFilter to WhereClause
/// 
/// Converts time semantics to actual values
WhereClause compileFilter(PerspectiveFilter f, DateTime today) {
  // Handle time semantics
  if (f.value is String) {
    final valueStr = f.value as String;
    
    if (valueStr == 'today') {
      return WhereClause(
        field: f.field,
        op: f.op,
        value: today,
      );
    } else if (valueStr == 'tomorrow') {
      final tomorrow = today.add(const Duration(days: 1));
      return WhereClause(
        field: f.field,
        op: f.op,
        value: tomorrow,
      );
    } else if (valueStr == 'yesterday') {
      final yesterday = today.subtract(const Duration(days: 1));
      return WhereClause(
        field: f.field,
        op: f.op,
        value: yesterday,
      );
    } else if (valueStr == 'next-7-days') {
      final nextWeek = today.add(const Duration(days: 7));
      return WhereClause(
        field: f.field,
        op: 'between',
        value: [today, nextWeek],
      );
    } else if (valueStr == 'this-week') {
      // Calculate week start (Monday) and end (Sunday)
      final weekday = today.weekday; // 1 = Monday, 7 = Sunday
      final weekStart = today.subtract(Duration(days: weekday - 1));
      final weekEnd = weekStart.add(const Duration(days: 6));
      return WhereClause(
        field: f.field,
        op: 'between',
        value: [weekStart, weekEnd],
      );
    } else if (valueStr == 'this-month') {
      final monthStart = DateTime(today.year, today.month, 1);
      final monthEnd = DateTime(today.year, today.month + 1, 0, 23, 59, 59);
      return WhereClause(
        field: f.field,
        op: 'between',
        value: [monthStart, monthEnd],
      );
    }
  }
  
  // No time semantics, return as-is
  return WhereClause(
    field: f.field,
    op: f.op,
    value: f.value,
  );
}

/// Normalize source name
/// 
/// Supports: 'task' → 'tasks', 'forecast' → 'forecasts', etc.
String normalizeSource(String source) {
  final normalized = source.toLowerCase();
  
  if (normalized == 'task') return 'tasks';
  if (normalized == 'forecast') return 'forecasts';
  if (normalized == 'project') return 'projects';
  
  return normalized;
}
















