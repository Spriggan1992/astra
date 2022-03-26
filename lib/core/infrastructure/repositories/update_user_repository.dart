import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/domain/models/subscriptions/subscription_topics_model.dart';
import 'package:astra_app/core/domain/models/user_online_status.model.dart';
import 'package:astra_app/core/domain/repositories/i_update_user_repository.dart';
import 'package:astra_app/core/infrastructure/DTOs/subscription_topics_dto.dart';
import 'package:astra_app/core/infrastructure/DTOs/user_online_status_dto.dart';
import 'package:astra_app/core/infrastructure/http/api_client.dart';
import 'package:astra_app/core/infrastructure/http/endpoints.dart';
import 'package:astra_app/core/infrastructure/services/subscription_service/subscription_service.dart';
import 'package:astra_app/core/infrastructure/utils/make_request.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Defines repository for updating user profile.
@LazySingleton(as: IUpdateUserRepository)
class UpdateUserRepository implements IUpdateUserRepository {
  /// Api client for making request.
  final ApiClient _apiClient;
  // Service for subscription and listening signals from server.
  late SubscriptionService _subscriptionService;

  UpdateUserRepository(this._apiClient);

  @override
  Future<Either<AstraFailure, SubscriptionTopicsModel>> getTopics() async {
    return _apiClient.post(
      Endpoints.signals.users,
      responseParser: (response) =>
          SubscriptionTopicsDTO.fromJson(response.data).toDomain(),
    );
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
    return _apiClient.post(
      Endpoints.user.online,
      data: UserOnlineStatusDTO.fromDomain(userOnlineStatus),
      responseParser: (response) =>
          UserOnlineStatusDTO.fromJson(response.data).toDomain(),
    );
  }

  @override
  Future<void> dispose() async {
    await _subscriptionService.dispose();
  }
}
