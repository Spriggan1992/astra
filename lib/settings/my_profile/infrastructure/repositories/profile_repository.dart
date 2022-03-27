import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/domain/models/curator_model.dart';
import 'package:astra_app/core/domain/models/image_models.dart';
import 'package:astra_app/core/infrastructure/DTOs/dto_curator.dart';
import 'package:astra_app/core/infrastructure/DTOs/profile_dto.dart';
import 'package:astra_app/core/infrastructure/http/api_client.dart';
import 'package:astra_app/core/infrastructure/http/endpoints.dart';
import 'package:astra_app/core/infrastructure/services/images/i_cache_image_service.dart';
import 'package:astra_app/core/domain/models/profile_model.dart';
import 'package:astra_app/settings/my_profile/domain/models/profile_short_model.dart';
import 'package:astra_app/settings/my_profile/domain/repositories/i_profile_repository.dart';
import 'package:astra_app/settings/my_profile/infrastructure/DTOs/profile_short.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

const _images = 'images';
const _astraImages = 'astraImages';

@LazySingleton(as: IProfileRepository)

/// Profile api.
class ProfileRepository implements IProfileRepository {
  /// Api client for making request.
  final ApiClient _apiClient;

  /// Service for caching network images.
  final ICacheImageService _cacheImageService;

  ProfileRepository(this._apiClient, this._cacheImageService);

  @override
  Future<Either<AstraFailure, ProfileModel>> getProfile() async {
    final result = await _apiClient.get(Endpoints.user.account,
        responseParser: (response) =>
            ProfileDTO.fromJson(response.data).toDomain());
    return result.fold(
      (failure) => left(failure),
      (profile) async {
        final imageModels = await _getImageModels(profile.profilePhotos);
        final curatorPhotos = await _getImageModels(profile.curatorPhotos);
        final updatedProfile = profile.copyWith(
            profilePhotos: imageModels, curatorPhotos: curatorPhotos);
        return right(updatedProfile);
      },
    );
  }

  @override
  Future<Either<AstraFailure, ProfileShortModel>> getProfileShort() async {
    final result = await _apiClient.get(
      Endpoints.user.accountShort,
      responseParser: (response) =>
          ProfileShortDTO.fromJson(response.data).toDomain(),
    );
    return result.fold((failure) => left(failure), (model) async {
      final image = await _getImageModel(model.avatar);
      final updatedProfile = model.copyWith(avatar: image);
      return right(updatedProfile);
    });
  }

  @override
  Future<Either<AstraFailure, bool>> updateShortInfo(String shortInfo) async {
    final dto = {"info": shortInfo};
    return _apiClient.post(
      Endpoints.user.updateShortInfo,
      data: dto,
      responseParser: (response) => response.statusCode == 200,
    );
  }

  @override
  Future<Either<AstraFailure, bool>> showAccountInfo(bool isShowInfo) async {
    return _apiClient.post(
      isShowInfo
          ? Endpoints.user.showAccountInfo
          : Endpoints.user.hideAccountInfo,
      responseParser: (response) => response.statusCode == 200,
    );
  }

  @override
  Future<Either<AstraFailure, bool>> hideAccount(bool isHideAccount) async {
    return _apiClient.post(
      isHideAccount ? Endpoints.user.hideAccount : Endpoints.user.showAccount,
      responseParser: (response) => response.statusCode == 200,
    );
  }

  @override
  Future<Either<AstraFailure, bool>> addPhoto(List<ImageModel> images) async {
    final formData = await _createFormData(images);
    return _apiClient.post(
      Endpoints.user.addPhoto,
      data: formData,
      responseParser: (response) => response.statusCode == 200,
    );
  }

  @override
  Future<Either<AstraFailure, bool>> deletePhoto(ImageModel image) async {
    return _apiClient.delete(
      Endpoints.user.deletePhoto,
      data: {'image_id': image.id},
      responseParser: (response) => response.statusCode == 200,
    );
  }

  @override
  Future<Either<AstraFailure, CuratorModel>> getCuratorInfo() async {
    final result = await _apiClient.get(
      Endpoints.user.getCurator,
      responseParser: (response) =>
          CuratorDTO.fromJson(response.data).toDomain(),
    );
    return result.fold((failure) => left(failure), (model) async {
      final curatorPhoto =
          await _cacheImageService.getFileImage(model.profilePhoto.imageUrl);
      final updatedCurator = model.copyWith(
        profilePhoto: ImageModel(
          imageUrl: model.profilePhoto.imageUrl,
          cachedImage: curatorPhoto.toDomain(),
        ),
      );
      return right(updatedCurator);
    });
  }

  Future<FormData> _createFormData(List<ImageModel> images) async {
    FormData data = FormData();
    for (var e in images) {
      data.files.add(MapEntry(
          _images,
          await MultipartFile.fromFile(
            e.cachedImage!.fullImage!.path,
            filename: e.cachedImage!.fullImage!.path,
          )));
    }
    return data;
  }

  Future<List<ImageModel>> _getImageModels(List<ImageModel> value) async {
    List<ImageModel> images = [];
    for (var e in value) {
      final imageFile = await _cacheImageService.getFileImage(e.imageUrl);
      images.add(ImageModel(
          imageUrl: e.imageUrl, id: e.id, cachedImage: imageFile.toDomain()));
    }
    return images;
  }

  Future<ImageModel> _getImageModel(ImageModel value) async {
    final imageFile = await _cacheImageService.getFileImage(value.imageUrl);
    final image = value.copyWith(
      id: value.id,
      imageUrl: value.imageUrl,
      cachedImage: imageFile.toDomain(),
    );
    return image;
  }
}

mixin Profile {}
