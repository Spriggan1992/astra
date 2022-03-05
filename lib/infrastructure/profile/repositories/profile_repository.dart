import 'package:astra_app/domain/core/models/image_models.dart';
import 'package:astra_app/domain/profile/models/curator_model.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/profile/models/profile_short_model.dart';
import 'package:astra_app/domain/profile/repositories/i_profile_repository.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';
import 'package:astra_app/infrastructure/core/services/images/i_chache_image_service.dart';
import 'package:astra_app/infrastructure/core/utils/make_request.dart';
import 'package:astra_app/infrastructure/profile/DTOs/dto_curator.dart';
import 'package:astra_app/infrastructure/profile/DTOs/profile_dto.dart';
import 'package:astra_app/infrastructure/profile/DTOs/profile_short.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

const _images = 'images';
const _astraImages = 'astraImages';

@LazySingleton(as: IProfileRepository)

/// Profile api.
class ProfileRepository implements IProfileRepository {
  /// Dio client.
  final Dio _dio;

  /// Service for caching network images.
  final ICacheImageService _cacheImageService;

  ProfileRepository(this._dio, this._cacheImageService);

  @override
  Future<Either<AstraFailure, Profile>> getProfile() async {
    final result = await makeRequest<Profile>(() async {
      final response = await _dio.get(Endpoints.user.account);
      final profile = ProfileDTO.fromJson(response.data).toDomain();
      final imageModels = await _getImageModels(profile.profilePhotos);
      final curatorPhotos = await _getImageModels(profile.curatorPhotos);
      final updatedProfile = profile.copyWith(
          profilePhotos: imageModels, curatorPhotos: curatorPhotos);
      return updatedProfile;
    });
    return result.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<AstraFailure, ProfileShortModel>> getProfileShort() async {
    final result = await makeRequest<ProfileShortModel>(() async {
      final response = await _dio.get(Endpoints.user.accountShort);
      final profileShort = ProfileShortDTO.fromJson(response.data).toDomain();
      final image = await _getImageModel(profileShort.avatar);
      final updatedProfile = profileShort.copyWith(avatar: image);
      return updatedProfile;
    });
    return result.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<AstraFailure, bool>> updateShortInfo(String shortInfo) async {
    final result = await makeRequest<bool>(() async {
      final dto = {"info": shortInfo};
      final response =
          await _dio.post(Endpoints.user.updateShortInfo, data: dto);
      return response.statusCode == 200;
    });
    return result.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<AstraFailure, bool>> showAccountInfo(bool isShowInfo) async {
    final result = await makeRequest<bool>(() async {
      final response = await _dio.post(
        isShowInfo
            ? Endpoints.user.showAccountInfo
            : Endpoints.user.hideAccountInfo,
      );
      return response.statusCode == 200;
    });
    return result.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<AstraFailure, bool>> hideAccount(bool isHideAccount) async {
    final result = await makeRequest<bool>(() async {
      final response = await _dio.post(
        isHideAccount ? Endpoints.user.hideAccount : Endpoints.user.showAccount,
      );
      return response.statusCode == 200;
    });
    return result.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<AstraFailure, bool>> addPhoto(List<ImageModel> images) async {
    final result = await makeRequest<bool>(() async {
      final formData = await _createFormData(images);
      final response = await _dio.post(Endpoints.user.addPhoto, data: formData);
      return response.statusCode == 200;
    });
    return result.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<AstraFailure, bool>> deletePhoto(ImageModel image) async {
    final result = await makeRequest<bool>(() async {
      final response = await _dio
          .delete(Endpoints.user.deletePhoto, data: {'image_id': image.id});
      return response.statusCode == 200;
    });
    return result.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<AstraFailure, CuratorModel>> getCuratorInfo() async {
    final result = await makeRequest<CuratorModel>(() async {
      final response = await _dio.get(Endpoints.user.getCurator);
      final curator = CuratorDTO.fromJson(response.data).toDomain();
      final curatorPhoto =
          await _cacheImageService.getFileImage(curator.profilePhoto.imageUrl);
      final updatedCurator = curator.copyWith(
          profilePhoto: ImageModel(
              imageUrl: curator.profilePhoto.imageUrl,
              fileImage: curatorPhoto));
      return updatedCurator;
    });
    return result.fold((l) => left(l), (r) => right(r));
  }

  Future<FormData> _createFormData(List<ImageModel> images) async {
    FormData data = FormData.fromMap({
      _images: _astraImages,
    });
    for (var e in images) {
      data.files.add(MapEntry(
          _images,
          await MultipartFile.fromFile(
            e.fileImage!.path,
            filename: e.fileImage!.path,
          )));
    }
    return data;
  }

  Future<List<ImageModel>> _getImageModels(List<ImageModel> value) async {
    List<ImageModel> images = [];
    for (var e in value) {
      final imageFile = await _cacheImageService.getFileImage(e.imageUrl);
      images.add(
          ImageModel(imageUrl: e.imageUrl, id: e.id, fileImage: imageFile));
    }
    return images;
  }

  Future<ImageModel> _getImageModel(ImageModel value) async {
    final imageFile = await _cacheImageService.getFileImage(value.imageUrl);
    final image = value.copyWith(
      id: value.id,
      imageUrl: value.imageUrl,
      fileImage: imageFile,
    );
    return image;
  }
}
