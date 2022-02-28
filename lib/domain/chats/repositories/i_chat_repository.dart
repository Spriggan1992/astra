import 'package:astra_app/domain/chats/models/pagination_chat_model.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/core/models/subscriptions/i_subscription_model.dart';
import 'package:astra_app/infrastructure/core/services/subscription_service/subscription_service.dart';
import 'package:dartz/dartz.dart';

/// Describe chat repository.
abstract class IChatRepository {
  /// Load chat history for the chat with [chatId].
  Future<Either<AstraFailure, PaginationChatModel>> getChatHistory(int chatId,
      [int offset]);

  /// Subscribes to update chats obtaining from server.
  Stream<Either<AstraFailure, ISubscriptionModel>> subscribeToChatsUpdates(
      int chatId);

  /// Read message when get message from server.
  Future<Either<AstraFailure, Unit>> readMessage(int chatId);

  /// Send message to the server.
  Future<Either<AstraFailure, Unit>> sendMessage(int chatId, String message);

  /// Dispose [SubscriptionService] if not use anymore.
  Future<void> dispose();
}
