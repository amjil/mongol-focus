import '../app_database.dart';
import 'perspective_compiler.dart' as query;

/// PerspectiveResult - Grouped query result
class PerspectiveResult {
  /// Grouped data: Map<groupKey, List<items>>
  final Map<String, List<dynamic>> groups;
  
  /// Display configuration
  final String? display;
  
  /// Raw data (if needed)
  final List<dynamic>? raw;
  
  PerspectiveResult({
    required this.groups,
    this.display,
    this.raw,
  });
  
  /// Convert to map (for ClojureDart interop)
  Map<String, dynamic> toMap() {
    return {
      'groups': groups,
      if (display != null) 'display': display,
      if (raw != null) 'raw': raw,
    };
  }
}

/// Build result from raw data and perspective
/// 
/// Performs in-memory grouping and display configuration
PerspectiveResult buildResult(
  List<dynamic> rawData,
  query.Perspective perspective,
) {
  if (perspective.groupBy == null) {
    // No grouping, return single group
    return PerspectiveResult(
      groups: {'all': rawData},
      display: perspective.display,
      raw: rawData,
    );
  }
  
  final groupBy = perspective.groupBy!;
  final groups = <String, List<dynamic>>{};
  
  for (final item in rawData) {
    final groupKey = extractGroupKey(item, groupBy, perspective.source);
    groups.putIfAbsent(groupKey, () => []).add(item);
  }
  
  return PerspectiveResult(
    groups: groups,
    display: perspective.display,
    raw: rawData,
  );
}

/// Extract group key from item
String extractGroupKey(dynamic item, String groupBy, String source) {
  final normalizedGroupBy = groupBy.toLowerCase().replaceAll('-', '');
  
  if (normalizedGroupBy == 'date') {
    return extractDateKey(item, source);
  }
  
  // Group by field value
  if (item is Task) {
    switch (normalizedGroupBy) {
      case 'projectid':
      case 'project-id':
        return item.projectId ?? 'none';
      case 'priority':
        return item.priority.toString();
      case 'completed':
        return item.completed.toString();
      default:
        return 'unknown';
    }
  }
  
  if (item is Forecast) {
    switch (normalizedGroupBy) {
      case 'taskid':
      case 'task-id':
        return item.taskId;
      case 'done':
        return item.done.toString();
      case 'skipped':
        return item.skipped.toString();
      case 'confidence':
        return item.confidence.toString();
      case 'source':
        return item.source.toString();
      default:
        return 'unknown';
    }
  }
  
  if (item is Project) {
    switch (normalizedGroupBy) {
      case 'status':
        return item.status;
      case 'completed':
        return item.completed.toString();
      default:
        return 'unknown';
    }
  }
  
  return 'unknown';
}

/// Extract date key from item
/// 
/// Handles different date formats:
/// - Forecast.scheduledDate: yyyyMMdd format (IntColumn)
/// - Task.dueAt: milliseconds timestamp (nullable IntColumn)
/// - Task.createdAt: milliseconds timestamp (IntColumn)
/// - Project.createdAt: seconds timestamp (IntColumn)
String extractDateKey(dynamic item, String source) {
  int? timestamp;
  bool isMilliseconds = true;
  
  if (item is Forecast) {
    // Forecast.scheduledDate is already in yyyyMMdd format
    final scheduledDate = item.scheduledDate;
    return scheduledDate.toString();
  }
  
  if (item is Task) {
    // Note: dueAt field may not exist in current schema
    // Try dueAt first (using dynamic access), then createdAt
    try {
      final dueAt = (item as dynamic).dueAt;
      if (dueAt != null) {
        timestamp = dueAt as int?;
        isMilliseconds = true;
      } else {
        timestamp = item.createdAt;
        isMilliseconds = true;
      }
    } catch (e) {
      // dueAt field doesn't exist, use createdAt
      timestamp = item.createdAt;
      isMilliseconds = true;
    }
  } else if (item is Project) {
    timestamp = item.createdAt;
    // Projects.createdAt might be in seconds, but let's assume milliseconds for now
    isMilliseconds = true;
  }
  
  if (timestamp == null) {
    return 'unknown';
  }
  
  // Convert timestamp to yyyyMMdd
  final date = isMilliseconds
      ? DateTime.fromMillisecondsSinceEpoch(timestamp)
      : DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  
  final year = date.year;
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  
  return '$year$month$day';
}

