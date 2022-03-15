import 'dart:developer';

import 'package:astra_app/domain/chats/models/chats_model.dart';
import 'package:astra_app/domain/chats/repositories/i_chats_repository.dart';
import 'package:astra_app/domain/core/models/subscriptions/subscription_model.dart';
import 'package:astra_app/domain/core/models/subscriptions/subscription_topics_model.dart';
import 'package:astra_app/infrastructure/chats/DTOs/chat_dto.dart';
import 'package:astra_app/infrastructure/core/DTOs/subscription_topics_dto.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';
import 'package:astra_app/infrastructure/core/services/subscription_service/subscription_service.dart';
import 'package:astra_app/infrastructure/core/utils/make_request.dart';
import 'package:dartz/dartz.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Represent repository for chats.
@LazySingleton(as: IChatsRepository)
class ChatsRepository implements IChatsRepository {
  /// Dio client.
  final Dio _dio;
  // Service for subscription and listening signals from server.
  SubscriptionService? _subscriptionService;

  ChatsRepository(this._dio);
  @override
  Future<Either<AstraFailure, List<ChatModel>>> getChats() async {
    return await makeRequest<List<ChatModel>>(() async {
      final response = await _dio.get(Endpoints.chat.chats);
      return (response.data as List<dynamic>)
          .map((e) => ChatDTO.fromJson(e).toDomain())
          .toList();
    });
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
    return await makeRequest<Unit>(() async {
      await _dio.delete(Endpoints.chat.deleteChat(chatId));
      return unit;
    });
  }

  @override
  Future<Either<AstraFailure, SubscriptionTopicsModel>> getTopics() async {
    return await makeRequest<SubscriptionTopicsModel>(() async {
      final response = await _dio.post(Endpoints.signals.chats);
      return SubscriptionTopicsDTO.fromJson(response.data).toDomain();
    });
  }

  @override
  Future<Either<AstraFailure, ChatModel>> openChat(int userId) async {
    return await makeRequest<ChatModel>(() async {
      final response = await _dio.post(Endpoints.chat.openChat(userId));
      return ChatDTO.fromJson(response.data).toDomain();
    });
  }

  @override
  Future<void> dispose() async {
    await _subscriptionService?.dispose();
  }
}
