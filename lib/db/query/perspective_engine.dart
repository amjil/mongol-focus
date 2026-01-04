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
  print('[PerspectiveEngine] executePerspectiveRaw 开始执行');
  print('[PerspectiveEngine] 输入perspective类型: ${perspective.runtimeType}');
  print('[PerspectiveEngine] 输入perspective内容: $perspective');
  
  // Convert to PerspectiveQuery object if needed
  final persp = perspective is query.Perspective
      ? perspective
      : query.Perspective.fromMap(perspective as Map<String, dynamic>);
  
  print('[PerspectiveEngine] 转换后的Perspective对象:');
  print('[PerspectiveEngine]   - source: ${persp.source}');
  print('[PerspectiveEngine]   - filters数量: ${persp.filters.length}');
  print('[PerspectiveEngine]   - filters详情: ${persp.filters.map((f) => '${f.field} ${f.op} ${f.value}').join(", ")}');
  print('[PerspectiveEngine]   - sortBy: ${persp.sortBy}');
  print('[PerspectiveEngine]   - groupBy: ${persp.groupBy}');
  
  // Compile to QueryPlan
  final plan = query.compilePerspective(persp);
  
  print('[PerspectiveEngine] 编译后的QueryPlan:');
  print('[PerspectiveEngine]   - source: ${plan.source}');
  print('[PerspectiveEngine]   - wheres数量: ${plan.wheres.length}');
  print('[PerspectiveEngine]   - wheres详情: ${plan.wheres.map((w) => '${w.field} ${w.op} ${w.value}').join(", ")}');
  print('[PerspectiveEngine]   - sortBy: ${plan.sortBy}');
  
  // Execute query and return raw data
  final results = await runQuery(db, plan);
  
  print('[PerspectiveEngine] 查询执行完成 - 结果数量: ${results.length}');
  if (results.isEmpty) {
    print('[PerspectiveEngine] ⚠️ 警告: 查询结果为空!');
    print('[PerspectiveEngine] 可能的原因:');
    print('[PerspectiveEngine]   1. 数据库中没有匹配的数据');
    print('[PerspectiveEngine]   2. 过滤条件过于严格');
    print('[PerspectiveEngine]   3. 字段名或操作符不匹配');
  } else {
    print('[PerspectiveEngine] 查询成功，返回 ${results.length} 条记录');
  }
  
  return results;
}

