import '../app_database.dart';
import 'perspective_compiler.dart' as query;
import 'query_executor.dart';
import 'result_builder.dart';

/// Execute perspective query and return grouped result
/// 
/// This is the main entry point for perspective queries.
/// 
/// [perspective] can be a PerspectiveQuery object or a Map (for ClojureDart interop)
/// 
/// Returns PerspectiveResult with grouped data.
Future<PerspectiveResult> executePerspective(
  AppDatabase db,
  dynamic perspective,
) async {
  // Convert to PerspectiveQuery object if needed
  final persp = perspective is query.Perspective
      ? perspective
      : query.Perspective.fromMap(perspective as Map<String, dynamic>);
  
  // Compile to QueryPlan
  final plan = query.compilePerspective(persp);
  
  // Execute query
  final rawData = await runQuery(db, plan);
  
  // Build result with grouping
  return buildResult(rawData, persp);
}

/// Execute perspective query and return raw data (no grouping)
/// 
/// This is useful when you only need the filtered/sorted data without grouping.
/// 
/// [perspective] can be a PerspectiveQuery object or a Map (for ClojureDart interop)
/// 
/// Returns List<dynamic> with raw data.
Future<List<dynamic>> executePerspectiveRaw(
  AppDatabase db,
  dynamic perspective,
) async {
  // Convert to PerspectiveQuery object if needed
  final persp = perspective is query.Perspective
      ? perspective
      : query.Perspective.fromMap(perspective as Map<String, dynamic>);
  
  // Compile to QueryPlan
  final plan = query.compilePerspective(persp);
  
  // Execute query and return raw data
  return await runQuery(db, plan);
}

