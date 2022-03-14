import 'dart:async';
import 'package:astra_app/domain/chats/models/pagination_chat_model.dart';
import 'package:astra_app/domain/chats/repositories/i_chat_repository.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/core/models/subscriptions/i_subscription_model.dart';
import 'package:astra_app/domain/core/models/subscriptions/subscription_chat_topic_model.dart';
import 'package:astra_app/domain/core/models/subscriptions/subscription_message_model.dart';
import 'package:astra_app/domain/core/models/subscriptions/subscription_status_online_model.dart';
import 'package:astra_app/infrastructure/chats/DTOs/message_dto.dart';
import 'package:astra_app/infrastructure/chats/DTOs/message_to_server_dto.dart';
import 'package:astra_app/infrastructure/chats/DTOs/pagination_chat_dto.dart';
import 'package:astra_app/infrastructure/core/DTOs/subscription_chat_topic.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';
import 'package:astra_app/infrastructure/core/services/subscription_service/subscription_service.dart';
import 'package:astra_app/infrastructure/core/utils/make_request.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Represent chat repository.
@LazySingleton(as: IChatRepository)
class ChatRepository implements IChatRepository {
  // Dio client.
  final Dio _dio;

  // Service for subscription and listening signals from server.
  SubscriptionService? _subscriptionService;

  ChatRepository(this._dio);
  @override
  Future<Either<AstraFailure, PaginationChatModel>> getChatHistory(int chatId,
      [int offset = 0]) async {
    return await makeRequest<PaginationChatModel>(
      () async {
        final response = await _dio.get(Endpoints.chat.getMessages(chatId),
            queryParameters: {'limit': 20, 'offset': offset});
        return PaginationChatDTO.fromJson(response.data).toDomain();
      },
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
    return await makeRequest<Unit>(() async {
      await _dio.post(Endpoints.chat.read(chatId));
      return unit;
    });
  }

  Future<Either<AstraFailure, SubscriptionChatTopicModel>> _getTopics(
      int chatId) async {
    return await makeRequest<SubscriptionChatTopicModel>(() async {
      final response = await _dio.post(Endpoints.signals.chat(chatId));
      return SubscriptionChatTopicDTO.fromJson(response.data).toDomain();
    });
  }

  @override
  Future<Either<AstraFailure, Unit>> sendMessage(
      int chatId, String message) async {
    return await makeRequest<Unit>(
      () async {
        await _dio.post(
          Endpoints.chat.sendMessage(chatId),
          data: MessageToServerDTO.fromDomain(message).toJson(),
        );
        return unit;
      },
    );
  }

  @override
  Future<void> dispose() async {
    await _subscriptionService?.dispose();
  }
}
