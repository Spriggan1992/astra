import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/core/models/subscription_topics_model.dart';
import 'package:astra_app/domain/core/repositories/i_update_user_repository.dart';
import 'package:astra_app/infrastructure/core/DTOs/subscription_topics_dto.dart';
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
  SubscriptionService? _subscriptionService;

  @override
  Future<Either<AstraFailure, SubscriptionTopicsModel>> getTopicks() async {
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
    yield* _subscriptionService.subscribtion
        .map((event) => right(event.payloadAsString));
  }

  @override
  Future<void> dispose() async {
    await _subscriptionService!.dispose();
  }
}
