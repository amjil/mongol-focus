import '../app_database.dart';
import '../query/perspective_engine.dart' as engine;
import '../query/perspective_compiler.dart' as query;
import '../tables/tasks.dart';
import '../tables/forecasts.dart';

/// Perspective Query Bridge - Bridge layer for Perspective query operations
/// 
/// Provides ClojureDart-callable functions for querying entities by perspective.

class PerspectiveQueryBridge {
  final AppDatabase db;

  PerspectiveQueryBridge(this.db);

  /// Convert ClojureDart map to Dart Map<String, dynamic>
  /// 
  /// Recursively converts PersistentHashMap and other Clojure types to Dart types
  Map<String, dynamic> _convertToDartMap(dynamic value) {
    if (value == null) return {};
    
    // If it's already a Dart Map, return as-is
    if (value is Map<String, dynamic>) {
      return value;
    }
    
    // If it's a Clojure map (PersistentHashMap or other Map-like object)
    if (value is Map) {
      final result = <String, dynamic>{};
      value.forEach((key, val) {
        final keyStr = key.toString();
        result[keyStr] = _convertToDartValue(val);
      });
      return result;
    }
    
    // Try to convert using toString and reflection
    // This handles PersistentHashMap and other Clojure types
    try {
      final result = <String, dynamic>{};
      // Use dynamic access to iterate over map entries
      final entries = (value as dynamic).entries;
      for (final entry in entries) {
        final key = entry.key.toString();
        result[key] = _convertToDartValue(entry.value);
      }
      return result;
    } catch (e) {
      return {};
    }
  }
  
  /// Convert ClojureDart value to Dart value
  dynamic _convertToDartValue(dynamic value) {
    if (value == null) return null;
    
    // If it's a Map, convert recursively
    if (value is Map) {
      return _convertToDartMap(value);
    }
    
    // If it's a List, convert each element
    if (value is List) {
      return value.map((item) => _convertToDartValue(item)).toList();
    }
    
    // For primitive types, return as-is
    return value;
  }

  /// Query entities by perspective
  /// 
  /// Parameters:
  /// - perspective: Map with entity, filters, orderBy, limit
  /// 
  /// Returns: List of entity maps
  Future<List<Map<String, dynamic>>> queryByPerspective(dynamic perspective) async {
    // Convert Clojure map to Dart map
    final dartPerspective = _convertToDartMap(perspective);
    
    final entity = dartPerspective['entity'] as String?;
    if (entity == null) {
      throw ArgumentError('perspective["entity"] cannot be null');
    }
    
    // Convert entity to source format
    final source = entity == 'task' ? 'tasks' : entity == 'forecast' ? 'forecasts' : entity;
    
    // Convert filters list - ensure each filter is a Dart map
    final filtersList = dartPerspective['filters'] as List<dynamic>? ?? [];
    final convertedFilters = filtersList.map((f) {
      if (f is Map<String, dynamic>) {
        return f;
      } else {
        return _convertToDartMap(f);
      }
    }).toList();
    
    // Convert perspective format to Perspective format
    final perspMap = <String, dynamic>{
      'source': source,
      'filters': convertedFilters,
    };
    
    // Convert orderBy to sortBy format
    final orderByList = dartPerspective['orderBy'] as List<dynamic>?;
    if (orderByList != null && orderByList.isNotEmpty) {
      final firstOrderRaw = orderByList[0];
      final firstOrder = firstOrderRaw is Map<String, dynamic>
          ? firstOrderRaw
          : _convertToDartMap(firstOrderRaw);
      final field = firstOrder['field'] as String?;
      final dir = firstOrder['dir'] as String?;
      if (field != null && dir != null) {
        perspMap['sortBy'] = '$field:$dir';
      }
    }
    
    // Execute query using perspective engine
    final rawResults = await engine.executePerspectiveRaw(db, perspMap);
    
    // Convert results to map format
    
    if (entity == 'task') {
      final converted = rawResults.map((task) {
        final t = task as Task;
        return {
          'id': t.id,
          'title': t.title,
          'projectId': t.projectId,
          'perspectives': t.perspectives,
          'completed': t.completed,
          'createdAt': t.createdAt,
          'priority': t.priority,
          'postponeCount': t.postponeCount,
          'abandoned': t.abandoned,
          'dueAt': t.dueAt,
          'deferAt': t.deferAt,
        };
      }).toList();
      
      return converted;
    } else if (entity == 'forecast') {
      final converted = rawResults.map((forecast) {
        final f = forecast as Forecast;
        return {
          'id': f.id,
          'taskId': f.taskId,
          'scheduledDate': f.scheduledDate,
          'done': f.done,
          'skipped': f.skipped,
          'confidence': f.confidence,
          'source': f.source,
          'createdAt': f.createdAt,
        };
      }).toList();
      
      return converted;
    } else {
      throw ArgumentError('Unsupported entity type: $entity');
    }
  }
}

