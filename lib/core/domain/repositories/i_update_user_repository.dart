import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/domain/models/subscriptions/subscription_topics_model.dart';
import 'package:astra_app/core/domain/models/user_online_status.model.dart';
import 'package:dartz/dartz.dart';

/// Describe the repository for updating the user profile.
abstract class IUpdateUserRepository {
  /// Gets topics for listening signals.
  Future<Either<AstraFailure, SubscriptionTopicsModel>> getTopics();

  /// Subscribes to receive changes in the user profile.
  ///
  /// The [topics] for listening.
  Stream<Either<AstraFailure, String>> subscribeToUserUpdate(
      List<String> topics);

  /// Update user online status.
  Future<Either<AstraFailure, UserOnlineStatusModel>> updatedUserOnlineStatus(
      UserOnlineStatusModel userOnlineStatus);

  /// Dispose data if service don't use anymore.
  Future<void> dispose();
}
