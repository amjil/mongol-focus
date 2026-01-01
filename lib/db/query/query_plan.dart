/// QueryPlan - Intermediate abstraction for perspective queries
/// 
/// This is the "stable layer" between Perspective (declarative data) and Drift queries.
/// Adding DSL in the future won't affect Drift.
class QueryPlan {
  /// Source type: 'tasks', 'forecast', 'projects'
  final String source;
  
  /// List of where conditions
  final List<WhereClause> wheres;
  
  /// Sort specification: 'field:asc' or 'field:desc'
  final String? sortBy;
  
  QueryPlan({
    required this.source,
    required this.wheres,
    this.sortBy,
  });
}

/// WhereClause - Single where condition
class WhereClause {
  /// Field name (e.g., 'due', 'completed', 'scheduledDate')
  final String field;
  
  /// Operator: '=', '!=', '<', '<=', '>', '>=', 'between', 'in', 'is-null', 'is-not-null', 'like'
  final String op;
  
  /// Value (can be dynamic: String, int, bool, List, DateTime, etc.)
  final dynamic value;
  
  WhereClause({
    required this.field,
    required this.op,
    required this.value,
  });
}








