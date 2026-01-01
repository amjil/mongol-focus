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

