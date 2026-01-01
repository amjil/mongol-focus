import '../app_database.dart';

/// Transaction Bridge - Bridge layer for transaction operations
/// 
/// Provides ClojureDart-callable functions for database transactions.

/// Run a transaction
/// 
/// Executes the given function within a database transaction.
/// All operations within the transaction are atomic.
/// 
/// Note: Accepts dynamic function type to work with ClojureDart interop.
/// ClojureDart functions are passed as dynamic, but they return Future<T>.
Future<T> runTransaction<T>(AppDatabase db, dynamic action) {
  return db.transaction(() async {
    final result = action();
    // ClojureDart functions return Future, so we await and cast
    if (result is Future) {
      return await result as T;
    } else {
      return result as T;
    }
  });
}

