import 'dart:developer';

import 'package:astra_app/domain/image_picker/models/image.dart';
import 'package:astra_app/domain/profile/models/curator_model.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/profile/repositories/i_profile_repository.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';
import 'package:astra_app/infrastructure/core/utils/make_request.dart';
import 'package:astra_app/infrastructure/profile/DTOs/dto_curator.dart';
import 'package:astra_app/infrastructure/profile/DTOs/profile_dto.dart';
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

  ProfileRepository(this._dio);
  @override
  Future<Either<AstraFailure, Profile>> getProfile() async {
    final result = await makeRequest<Profile>(() async {
      final response = await _dio.get(Endpoints.user.account);
      return ProfileDTO.fromJson(response.data).toDomain();
    });
    log(result.toString());
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
      return CuratorDTO.fromJson(response.data).toDomain();
    });
    return result.fold((l) => left(l), (r) => right(r));
  }

  Future<FormData> _createFormData(List<ImageModel> images) async {
    FormData data = FormData.fromMap({
      _images: _astraImages,
    });
    images.forEach((e) async {
      data.files.add(MapEntry(_images,
          await MultipartFile.fromFile(e.imagePath, filename: e.imagePath)));
    });
    return data;
  }
}
