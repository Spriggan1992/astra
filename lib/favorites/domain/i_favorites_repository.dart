import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/domain/models/profile_model.dart';
import 'package:dartz/dartz.dart';

/// Describes the request service to Favorites.
abstract class IFavoritesRepository {
  /// Gets list of users who likes current user.
  Future<Either<AstraFailure, List<ProfileModel>>> getLikes();

  /// Gets a list of users that the current user liked
  Future<Either<AstraFailure, List<ProfileModel>>> getWhoLikes();

  /// Get a list of users the current user is thinking about.
  Future<Either<AstraFailure, List<ProfileModel>>> getThink();

  /// Get a list of users that the current user disliked.
  Future<Either<AstraFailure, List<ProfileModel>>> getNope();

  /// Get a list of match users.
  Future<Either<AstraFailure, List<ProfileModel>>> getMatch();

  /// To think about user.
  Future<Either<AstraFailure, Unit>> toThink(int id);

  /// Moved all users from `StopList` to `Think`.
  Future<Either<AstraFailure, Unit>> removeAllFromStopList();
}
