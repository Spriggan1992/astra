import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/core/models/image_models.dart';
import 'package:astra_app/domain/profile/models/curator_model.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/domain/profile/models/profile_short_model.dart';
import 'package:dartz/dartz.dart';

/// Describe profile api.
abstract class IProfileRepository {
  /// Load profile information
  Future<Either<AstraFailure, Profile>> getProfile();

  /// Load short profile information
  Future<Either<AstraFailure, ProfileShortModel>> getProfileShort();

  /// Hide account.
  Future<Either<AstraFailure, bool>> hideAccount(bool isHideAccount);

  /// Show account info.
  Future<Either<AstraFailure, bool>> showAccountInfo(bool isHideInfo);

  /// Add photo.
  Future<Either<AstraFailure, bool>> addPhoto(List<ImageModel> images);

  // Future<Either<AstraFilure, dynamic>> updatePhoto();
  Future<Either<AstraFailure, bool>> deletePhoto(ImageModel image);

  /// Updte users short info.
  Future<Either<AstraFailure, bool>> updateShortInfo(String shortInfo);

  /// Get info about curator.
  Future<Either<AstraFailure, CuratorModel>> getCuratorInfo();
}
