import 'package:drift/drift.dart';

/// Helper functions to create typed Value objects for ClojureDart
/// 
/// These functions ensure correct type inference when creating Value objects
/// from ClojureDart, which may not properly infer generic types.

/// Create Value<String> for string values
Value<String> valueString(String v) => Value(v);

/// Create Value<int> for int values
Value<int> valueInt(int v) => Value(v);

/// Create Value<String?> for nullable string values
Value<String?> valueStringNullable(String? v) => v == null ? const Value.absent() : Value(v);

/// Create Value<int?> for nullable int values
Value<int?> valueIntNullable(int? v) => v == null ? const Value.absent() : Value(v);

/// Create Value<bool> for boolean values
Value<bool> valueBool(bool v) => Value(v);

/// Create Value<bool> that is absent (for optional boolean fields)
Value<bool> valueBoolAbsent() {
  return const Value<bool>.absent();
}

/// Create Value<int> that is absent (for optional int fields)
Value<int> valueIntAbsent() {
  return const Value<int>.absent();
}

/// Create Value<double> for double values
Value<double> valueDouble(double v) => Value(v);

/// Create Value<double> that is absent (for optional double fields)
Value<double> valueDoubleAbsent() {
  return const Value<double>.absent();
}

/// Create Value<double> for nullable double values (returns absent if null)
Value<double> valueDoubleNullable(double? v) => v == null ? const Value<double>.absent() : Value(v);

