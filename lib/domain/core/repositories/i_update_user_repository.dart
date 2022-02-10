import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/core/models/subscription_topics_model.dart';
import 'package:dartz/dartz.dart';

/// Describe the reposytory for updating the user profile.
abstract class IUpdateUserRepository {
  /// Gets topics for listening signals.
  Future<Either<AstraFailure, SubscriptionTopicsModel>> getTopicks();

  /// Subscribes to receive changes in the user profile.
  ///
  /// The [topics] for listening.
  Stream<Either<AstraFailure, String>> subscribeToUserUpdate(
      List<String> topics);

  /// Dispose data if service don't use anymore.
  Future<void> dispose();
}
