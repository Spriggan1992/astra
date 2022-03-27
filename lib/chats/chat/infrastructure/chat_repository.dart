import 'dart:async';
import 'package:astra_app/chats/chat/infrastructure/DTOs/message_dto.dart';
import 'package:astra_app/chats/chat/infrastructure/DTOs/message_to_server_dto.dart';
import 'package:astra_app/chats/chat/infrastructure/DTOs/pagination_chat_dto.dart';
import 'package:astra_app/chats/chat/domain/models/pagination_chat_model.dart';
import 'package:astra_app/chats/chat/domain/i_chat_repository.dart';
import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/domain/models/subscriptions/i_subscription_model.dart';
import 'package:astra_app/core/domain/models/subscriptions/subscription_chat_topic_model.dart';
import 'package:astra_app/core/domain/models/subscriptions/subscription_message_model.dart';
import 'package:astra_app/core/domain/models/subscriptions/subscription_status_online_model.dart';
import 'package:astra_app/core/infrastructure/DTOs/subscription_chat_topic.dart';
import 'package:astra_app/core/infrastructure/http/api_client.dart';
import 'package:astra_app/core/infrastructure/http/endpoints.dart';
import 'package:astra_app/core/infrastructure/services/subscription_service/subscription_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Represent chat repository.
@LazySingleton(as: IChatRepository)
class ChatRepository implements IChatRepository {
  // Api client for making request.
  final ApiClient _apiClient;

  // Service for subscription and listening signals from server.
  SubscriptionService? _subscriptionService;

  ChatRepository(this._apiClient);
  @override
  Future<Either<AstraFailure, PaginationChatModel>> getChatHistory(int chatId,
      [int offset = 0]) async {
    return _apiClient.get(
      Endpoints.chat.getMessages(chatId),
      queryParameters: {'limit': 20, 'offset': offset},
      responseParser: (response) =>
          PaginationChatDTO.fromJson(response.data).toDomain(),
    );
  }

  @override
  Stream<Either<AstraFailure, ISubscriptionModel>> subscribeToChatsUpdates(
      int chatId) async* {
    final response = await _getTopics(chatId);
    yield* response.fold(
      (failure) async* {
        left(failure);
      },
      (subscriptionChatTopic) async* {
        _subscriptionService =
            SubscriptionService([subscriptionChatTopic.topic]);
        await _subscriptionService!.init();
        yield* _subscriptionService!.subscription.map(
          (snapshot) {
            if (snapshot.payloadAsJson['chat_id'] != null) {
              return right(SubscriptionStatusOnlineModel(
                  topicName: snapshot.routingKey!,
                  isOnline: snapshot.payloadAsJson['is_online']));
            } else {
              return right(
                SubscriptionMessageModel(
                  topicName: snapshot.routingKey!,
                  messageModel: MessageDTO.fromJson(
                          snapshot.payloadAsJson as Map<String, dynamic>)
                      .toDomain(),
                ),
              );
            }
          },
        );
      },
    );
  }

  @override
  Future<Either<AstraFailure, Unit>> readMessage(int chatId) async {
    return _apiClient.post(Endpoints.chat.read(chatId),
        responseParser: (response) => unit);
  }

  Future<Either<AstraFailure, SubscriptionChatTopicModel>> _getTopics(
      int chatId) async {
    return _apiClient.post(
      Endpoints.signals.chat(chatId),
      responseParser: (response) =>
          SubscriptionChatTopicDTO.fromJson(response.data).toDomain(),
    );
  }

  @override
  Future<Either<AstraFailure, Unit>> sendMessage(
      int chatId, String message) async {
    return _apiClient.post(Endpoints.chat.sendMessage(chatId),
        data: MessageToServerDTO.fromDomain(message).toJson(),
        responseParser: (response) => unit);
  }

  @override
  Future<void> dispose() async {
    await _subscriptionService?.dispose();
  }
}
