/// ForecastRule - 核心抽象类
/// 
/// 定义了"什么条件下，在什么时候，生成什么类型的 ForecastItem"
/// 
/// 这是整个系统最值钱的抽象，使得同步逻辑规则驱动而非硬编码。
class ForecastRule {
  /// 规则类型，如：task_due / task_defer / project_review
  final String type;

  /// 条件函数：判断实体是否满足此规则
  /// 返回 true 表示应该为此实体生成 ForecastItem
  final bool Function(dynamic entity) when;

  /// 日期函数：返回应该生成的 ForecastItem 的日期
  /// 返回 null 表示不生成
  final DateTime? Function(dynamic entity) date;

  /// 优先级函数（可选）：返回 ForecastItem 的优先级
  /// 如果不提供，使用默认优先级
  final int Function(dynamic entity)? priority;

  const ForecastRule({
    required this.type,
    required this.when,
    required this.date,
    this.priority,
  });
}

