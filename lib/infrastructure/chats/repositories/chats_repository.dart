import 'dart:developer';

import 'package:astra_app/domain/chats/chats_model.dart';
import 'package:astra_app/domain/chats/i_chats_repository.dart';
import 'package:astra_app/domain/core/models/subscription_model.dart';
import 'package:astra_app/domain/core/models/subscription_topics_model.dart';
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
    final result = await makeRequest<List<ChatModel>>(() async {
      final response = await _dio.get(Endpoints.chat.chats);
      return (response.data as List<dynamic>)
          .map((e) => ChatDTO.fromJson(e).toDomain())
          .toList();
    });
    return result.fold((failure) => left(failure), (profile) => right(profile));
  }

  @override
  Stream<Either<AstraFailure, dynamic>> subscribeToChatsUpdates() async* {
    final topicks = await _getTopicks();
    yield* topicks.fold((failure) async* {
      left(failure);
    }, (subscriptionTopicsModel) async* {
      _subscriptionService =
          SubscriptionService(subscriptionTopicsModel.topics);
      await _subscriptionService!.init();
      yield* _subscriptionService!.subscribtion.map((snapshot) {
        return right(SubscriptionModel<Unit>(topicName: snapshot.routingKey!));
      });
    });
  }

  Future<Either<AstraFailure, SubscriptionTopicsModel>> _getTopicks() async {
    return await makeRequest<SubscriptionTopicsModel>(() async {
      final response = await _dio.post(Endpoints.signals.chats);
      return SubscriptionTopicsDTO.fromJson(response.data).toDomain();
    });
  }

  @override
  Future<void> dispose() async {
    await _subscriptionService?.dispose();
  }
}
