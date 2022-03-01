import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/store/models/like.dart';
import 'package:astra_app/domain/store/models/wallet.dart';
import 'package:astra_app/domain/store/models/wallet_history.dart';
import 'package:dartz/dartz.dart';

/// Describe store api service.
abstract class IStoreRepository {
  /// Get like packages.
  Future<Either<AstraFailure, List<Like>>> getLikePackages();

  /// Get wallet information.
  Future<Either<AstraFailure, Wallet>> getMyWallet();

  /// Get top-up history.
  Future<Either<AstraFailure, WalletHistory>> getTopUpHistory();

  /// Top-up account.
  Future<Either<AstraFailure, Unit>> topUpAccount(String package);
}
