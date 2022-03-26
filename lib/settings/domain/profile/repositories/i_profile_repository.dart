import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/domain/models/image_models.dart';
import 'package:astra_app/settings/domain/profile/models/curator_model.dart';
import 'package:astra_app/settings/domain/profile/models/profile_model.dart';
import 'package:astra_app/settings/domain/profile/models/profile_short_model.dart';
import 'package:dartz/dartz.dart';

/// Describe profile api.
abstract class IProfileRepository {
  /// Load profile information
  Future<Either<AstraFailure, ProfileModel>> getProfile();

  /// Load short profile information
  Future<Either<AstraFailure, ProfileShortModel>> getProfileShort();

  /// Hide account.
  Future<Either<AstraFailure, bool>> hideAccount(bool isHideAccount);

  /// Show account info.
  Future<Either<AstraFailure, bool>> showAccountInfo(bool isHideInfo);

  /// Add photo.
  Future<Either<AstraFailure, bool>> addPhoto(List<ImageModel> images);

  // Future<Either<AstraFailure, dynamic>> updatePhoto();
  Future<Either<AstraFailure, bool>> deletePhoto(ImageModel image);

  /// Update users short info.
  Future<Either<AstraFailure, bool>> updateShortInfo(String shortInfo);

  /// Get info about curator.
  Future<Either<AstraFailure, CuratorModel>> getCuratorInfo();
}
