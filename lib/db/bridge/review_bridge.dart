import '../app_database.dart';
import 'dao_bridge.dart';

/// Review Bridge - Bridge layer for Review operations
/// 
/// Provides ClojureDart-callable functions for Review DAO operations.

/// Insert a new review
Future<void> insertReview(DaoBridge bridge, ReviewsCompanion review) {
  return bridge.reviewDao.insertReview(review);
}

/// Get review by ID
Future<Review?> getReview(DaoBridge bridge, String reviewId) {
  return bridge.reviewDao.getReview(reviewId);
}

/// Watch all reviews
Stream<List<Review>> watchAllReviews(DaoBridge bridge) {
  return bridge.reviewDao.watchAllReviews();
}

