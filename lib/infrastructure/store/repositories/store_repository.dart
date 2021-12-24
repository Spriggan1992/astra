import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/store/models/like.dart';
import 'package:astra_app/domain/store/models/wallet_history.dart';
import 'package:astra_app/domain/store/models/wallet.dart';
import 'package:astra_app/domain/store/repositories/i_store_reposytory.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';
import 'package:astra_app/infrastructure/core/utils/make_request.dart';
import 'package:astra_app/infrastructure/store/DTOs/like_dto.dart';
import 'package:astra_app/infrastructure/store/DTOs/walet_history_dto.dart';
import 'package:astra_app/infrastructure/store/DTOs/wallet_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Defines store reposytory.
@LazySingleton(as: IStoreReposytory)
class StoreRepository implements IStoreReposytory {
  /// Dio client.
  final Dio _dio;

  StoreRepository(this._dio);
  @override
  Future<Either<AstraFailure, List<Like>>> getLikePackages() async {
    final result = await makeRequest(() async {
      final response = await _dio.get(Endpoints.shop.purchaseItems);
      return (response.data as List<dynamic>)
          .map((e) => LikeDTO.fromJson(e).toDomain())
          .toList();
    });
    return result.fold((failure) => left(failure), (success) => right(success));
  }

  @override
  Future<Either<AstraFailure, Wallet>> getMyWallet() async {
    final result = await makeRequest<Wallet>(() async {
      final response = await _dio.get(Endpoints.shop.userWallet);
      return WalletDTO.fromJson(response.data).toDomain();
    });
    return result.fold((failure) => left(failure), (success) => right(success));
  }

  @override
  Future<Either<AstraFailure, WalletHistory>> getTopUpHistory() async {
    final result = await makeRequest<WalletHistory>(() async {
      final response = await _dio.get(Endpoints.shop.walletHistory);
      return WalletHistoryDTO.fromJson(response.data).toDomain();
    });
    return result.fold((failure) => left(failure), (success) => right(success));
  }

  @override
  Future<Either<AstraFailure, Unit>> topUpAccount(String package) async {
    final result = await makeRequest<Unit>(() async {
      await _dio.post(Endpoints.shop.walletAppend, data: {"package": package});
      return unit;
    });
    return result.fold((failure) => left(failure), (success) => right(success));
  }
}
