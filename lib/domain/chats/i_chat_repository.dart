import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/core/models/subscription_model.dart';
import 'package:astra_app/infrastructure/core/services/subscription_service/subscription_service.dart';
import 'package:dartz/dartz.dart';

import 'message_model.dart';

/// Describe chat repository.
abstract class IChatRepository {
  /// Load chat hisoty for the chat with [chatId].
  Future<Either<AstraFailure, List<MessageModel>>> getChatHisory(int chatId);

  /// Subscribes to update chats obtaining from server.
  Stream<Either<AstraFailure, SubscriptionModel<MessageModel>>>
      subscribeToChatsUpdates(int chatId);

  /// Send message to the server.
  Future<Either<AstraFailure, Unit>> sendMessage(int chatId, String message);

  /// Dispose [SubscriptionService] if not use anymore.
  Future<void> dispose();
}
