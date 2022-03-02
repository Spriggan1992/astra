import 'package:astra_app/domain/chats/models/chats_model.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/core/models/subscriptions/subscription_model.dart';
import 'package:astra_app/domain/core/models/subscriptions/subscription_topics_model.dart';
import 'package:dartz/dartz.dart';

/// Describes the request service to Chats.
abstract class IChatsRepository {
  /// Get chats for the current user
  Future<Either<AstraFailure, List<ChatModel>>> getChats();

  /// Subscribes to receive changes in chats.
  Stream<Either<AstraFailure, SubscriptionModel<Unit>>> subscribeToChatsUpdates(
      SubscriptionTopicsModel topicsModel);

  /// Deletes chat by [chatId].
  Future<Either<AstraFailure, Unit>> deleteChat(int chatId);

  /// Get topics for subscription.
  Future<Either<AstraFailure, SubscriptionTopicsModel>> getTopics();

  /// Dispose data if service don't use anymore.
  Future<void> dispose();
}
