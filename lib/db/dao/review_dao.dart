import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/reviews.dart';

part 'review_dao.g.dart';

/// Review DAO - Thin layer for review data access
/// 
/// Only provides basic CRUD operations, no business logic.
@DriftAccessor(tables: [Reviews])
class ReviewDao extends DatabaseAccessor with _$ReviewDaoMixin {
  ReviewDao(super.attachedDatabase);

  /// Insert a new review
  Future<void> insertReview(ReviewsCompanion review) async {
    await into(reviews).insert(review);
  }

  /// Get review by ID
  Future<Review?> getReview(String reviewId) async {
    return await (select(reviews)..where((r) => r.id.equals(reviewId))).getSingleOrNull();
  }

  /// Watch all reviews
  Stream<List<Review>> watchAllReviews() {
    return (select(reviews)
          ..orderBy([(r) => OrderingTerm.desc(r.createdAt)]))
        .watch();
  }
}

