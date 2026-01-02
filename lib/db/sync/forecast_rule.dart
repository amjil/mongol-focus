/// ForecastRule - Core abstract class
/// 
/// Defines "under what conditions, at what time, generate what type of ForecastItem"
/// 
/// This is the most valuable abstraction in the entire system, making sync logic rule-driven rather than hard-coded.
class ForecastRule {
  /// Rule type, e.g.: task_due / task_defer / project_review
  final String type;

  /// Condition function: determine if entity satisfies this rule
  /// Returns true means should generate ForecastItem for this entity
  final bool Function(dynamic entity) when;

  /// Date function: returns the date for the ForecastItem to be generated
  /// Returns null means don't generate
  final DateTime? Function(dynamic entity) date;

  /// Priority function (optional): returns ForecastItem priority
  /// If not provided, use default priority
  final int Function(dynamic entity)? priority;

  const ForecastRule({
    required this.type,
    required this.when,
    required this.date,
    this.priority,
  });
}

