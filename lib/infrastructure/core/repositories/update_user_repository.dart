import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/core/models/subscriptions/subscription_topics_model.dart';
import 'package:astra_app/domain/core/models/user_online_status.model.dart';
import 'package:astra_app/domain/core/repositories/i_update_user_repository.dart';
import 'package:astra_app/infrastructure/core/DTOs/subscription_topics_dto.dart';
import 'package:astra_app/infrastructure/core/DTOs/user_online_status_dto.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';
import 'package:astra_app/infrastructure/core/services/subscription_service/subscription_service.dart';
import 'package:astra_app/infrastructure/core/utils/make_request.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Defines repository for updating user profile.
@LazySingleton(as: IUpdateUserRepository)
class UpdateUserRepository implements IUpdateUserRepository {
  UpdateUserRepository(this._dio);
  // Dio client.
  final Dio _dio;
  // Service for subscription and listening signals from server.
  late SubscriptionService _subscriptionService;

  @override
  Future<Either<AstraFailure, SubscriptionTopicsModel>> getTopics() async {
    return await makeRequest<SubscriptionTopicsModel>(() async {
      final response = await _dio.post(Endpoints.signals.users);
      return SubscriptionTopicsDTO.fromJson(response.data).toDomain();
    });
  }

  @override
  Stream<Either<AstraFailure, String>> subscribeToUserUpdate(
      List<String> topics) async* {
    final _subscriptionService = SubscriptionService(topics);
    await _subscriptionService.init();
    yield* _subscriptionService.subscription
        .map((event) => right(event.payloadAsString));
  }

  @override
  Future<Either<AstraFailure, UserOnlineStatusModel>> updatedUserOnlineStatus(
      UserOnlineStatusModel userOnlineStatus) async {
    return await makeRequest<UserOnlineStatusModel>(() async {
      final response = await _dio.post(Endpoints.user.online,
          data: UserOnlineStatusDTO.fromDomain(userOnlineStatus));
      return UserOnlineStatusDTO.fromJson(response.data).toDomain();
    });
  }

  @override
  Future<void> dispose() async {
    await _subscriptionService.dispose();
  }
}
