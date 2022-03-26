import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/infrastructure/http/api_client.dart';
import 'package:astra_app/core/infrastructure/http/endpoints.dart';
import 'package:astra_app/shared/features/store/domain/models/like.dart';
import 'package:astra_app/shared/features/store/domain/models/wallet.dart';
import 'package:astra_app/shared/features/store/domain/models/wallet_history.dart';
import 'package:astra_app/shared/features/store/domain/repositories/i_store_reposytory.dart';
import 'package:astra_app/shared/features/store/infrastructure/DTOs/like_dto.dart';
import 'package:astra_app/shared/features/store/infrastructure/DTOs/walet_history_dto.dart';
import 'package:astra_app/shared/features/store/infrastructure/DTOs/wallet_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Defines store repository.
@LazySingleton(as: IStoreRepository)
class StoreRepository implements IStoreRepository {
  /// Api client for making request.
  final ApiClient _apiClient;

  StoreRepository(this._apiClient);
  @override
  Future<Either<AstraFailure, List<Like>>> getLikePackages() async {
    return _apiClient.get(
      Endpoints.shop.purchaseItems,
      responseParser: (response) => (response.data as List<dynamic>)
          .map((e) => LikeDTO.fromJson(e).toDomain())
          .toList(),
    );
  }

  @override
  Future<Either<AstraFailure, Wallet>> getMyWallet() async {
    return _apiClient.get(
      Endpoints.shop.userWallet,
      responseParser: (response) =>
          WalletDTO.fromJson(response.data).toDomain(),
    );
  }

  @override
  Future<Either<AstraFailure, WalletHistory>> getTopUpHistory() async {
    return _apiClient.get(
      Endpoints.shop.walletHistory,
      responseParser: (response) =>
          WalletHistoryDTO.fromJson(response.data).toDomain(),
    );
  }

  @override
  Future<Either<AstraFailure, Unit>> topUpAccount(String package) async {
    return _apiClient.post(
      Endpoints.shop.walletAppend,
      data: {"package": package},
      responseParser: (_) => unit,
    );
  }
}
