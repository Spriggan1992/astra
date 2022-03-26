import 'dart:developer';

import 'package:astra_app/chats/domain/models/chats_model.dart';
import 'package:astra_app/chats/domain/repositories/i_chats_repository.dart';
import 'package:astra_app/chats/infrastructure/DTOs/chat_dto.dart';
import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/domain/models/subscriptions/subscription_model.dart';
import 'package:astra_app/core/domain/models/subscriptions/subscription_topics_model.dart';
import 'package:astra_app/core/infrastructure/DTOs/subscription_topics_dto.dart';
import 'package:astra_app/core/infrastructure/http/api_client.dart';
import 'package:astra_app/core/infrastructure/http/endpoints.dart';
import 'package:astra_app/core/infrastructure/services/subscription_service/subscription_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Represent repository for chats.
@LazySingleton(as: IChatsRepository)
class ChatsRepository implements IChatsRepository {
  // Api client for making request.
  final ApiClient _apiClient;

  // Service for subscription and listening signals from server.
  SubscriptionService? _subscriptionService;

  ChatsRepository(this._apiClient);
  @override
  Future<Either<AstraFailure, List<ChatModel>>> getChats() async {
    return _apiClient.get(
      Endpoints.chat.chats,
      responseParser: (response) => (response.data as List<dynamic>)
          .map((e) => ChatDTO.fromJson(e).toDomain())
          .toList(),
    );
  }

  @override
  Stream<Either<AstraFailure, SubscriptionModel<Unit>>> subscribeToChatsUpdates(
      SubscriptionTopicsModel topicsModel) async* {
    _subscriptionService = SubscriptionService(topicsModel.topics);
    await _subscriptionService!.init();
    yield* _subscriptionService!.subscription.map((snapshot) {
      log(snapshot.payloadAsString, name: 'SNAPSHOT');
      return right(SubscriptionModel<Unit>(topicName: snapshot.routingKey!));
    });
  }

  @override
  Future<Either<AstraFailure, Unit>> deleteChat(int chatId) async {
    return _apiClient.delete(
      Endpoints.chat.deleteChat(chatId),
      responseParser: (response) => unit,
    );
  }

  @override
  Future<Either<AstraFailure, SubscriptionTopicsModel>> getTopics() async {
    return _apiClient.post(
      Endpoints.signals.chats,
      responseParser: (response) =>
          SubscriptionTopicsDTO.fromJson(response.data).toDomain(),
    );
  }

  @override
  Future<Either<AstraFailure, ChatModel>> openChat(int userId) async {
    return _apiClient.post(
      Endpoints.chat.openChat(userId),
      responseParser: (response) => ChatDTO.fromJson(response.data).toDomain(),
    );
  }

  @override
  Future<void> dispose() async {
    await _subscriptionService?.dispose();
  }
}
