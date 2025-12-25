import 'package:drift/drift.dart';

/// InboxItems table definition
/// 
/// Inbox = Capture area, not todo area
/// - Only responsible for temporarily storing "things not yet thought through"
/// - Must satisfy: fast to write, rarely viewed, must be cleared
class InboxItems extends Table {
  TextColumn get id => text()();
  TextColumn get content => text()();
  TextColumn get source => text().nullable()(); // 'quick' | 'share' | 'voice'
  BoolColumn get processed => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()(); // timestamp in seconds

  @override
  Set<Column> get primaryKey => {id};
}

