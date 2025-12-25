import '../app_database.dart';

/// Transaction Bridge - Bridge layer for transaction operations
/// 
/// Provides ClojureDart-callable functions for database transactions.

/// Run a transaction
/// 
/// Executes the given function within a database transaction.
/// All operations within the transaction are atomic.
Future<T> runTransaction<T>(AppDatabase db, Future<T> Function() action) {
  return db.transaction(action);
}

