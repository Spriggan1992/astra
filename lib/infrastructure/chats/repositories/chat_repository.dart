import 'dart:async';
import 'dart:developer';
import 'package:astra_app/domain/chats/i_chat_repository.dart';
import 'package:astra_app/domain/chats/message_model.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/core/models/subscription_model.dart';
import 'package:astra_app/domain/core/models/subscription_topics_model.dart';
import 'package:astra_app/infrastructure/chats/DTOs/message_dto.dart';
import 'package:astra_app/infrastructure/chats/DTOs/message_to_server_dto.dart';
import 'package:astra_app/infrastructure/core/DTOs/subscription_topics_dto.dart';
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
  Future<Either<AstraFailure, List<MessageModel>>> getChatHisory(
      int chatId) async {
    return await makeRequest<List<MessageModel>>(
      () async {
        final response = await _dio.get(Endpoints.chat.getMessages(chatId));
        return (response.data as List<dynamic>)
            .map((e) => MessageDTO.fromJson(e).toDomain())
            .toList()
            .reversed
            .toList();
      },
    );
  }

  @override
  Stream<Either<AstraFailure, SubscriptionModel<MessageModel>>>
      subscribeToChatsUpdates(int chatId) async* {
    _subscriptionService = SubscriptionService(['chat.$chatId.7']);
    await _subscriptionService!.init();
    yield* _subscriptionService!.subscribtion.map(
      (snapshot) {
        log(snapshot.payloadAsString, name: "SNAPSHOT");
        return right(
          SubscriptionModel<MessageModel>(
            topicName: snapshot.routingKey!,
            item: MessageDTO.fromJson(
                    snapshot.payloadAsJson as Map<String, dynamic>)
                .toDomain(),
          ),
        );
      },
    );
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
