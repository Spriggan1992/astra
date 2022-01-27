import 'package:astra_app/domain/core/models/image_models.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/search/repositories/i_search_repository.dart';
import 'package:injectable/injectable.dart';

/// Defines the implementation of the api service to list of applicants.
@LazySingleton(as: ISearchRepository)
class SearchRepository extends ISearchRepository {
  ///Dio client
  final Dio _dio;

  SearchRepository(this._dio);

  @override
  Future<Either<AstraFailure, List<Profile>>> getApplicants() async {
    try {
      final _applicants = getProfileList();
      return right(_applicants);
    } catch (e) {
      return left(const AstraFailure.api(100));
    }
  }

  static List<Profile> getProfileList() {
    return [
      const Profile(
        firstname: 'Мария',
        age: 25,
        city: 'Москва',
        country: 'Россия',
        id: 1,
        curatorId: 1,
        status: 'married',
        lastname: 'Мария',
        createdAt: '',
        curatorPhotos: [
          ImageModel(imageUrl: 'assets/girl.png'),
          ImageModel(imageUrl: 'assets/girl.png'),
        ],
        draft: true,
        gender: 'Женский',
        haveChild: true,
        height: 180,
        isActive: true,
        isHidden: false,
        phoneNumber: '',
        profileInfo:
            'На свете нет ни одного человека, который бы не мечтал. Я не стала исключением, в моей голове создавались образы прекрасного будущего.dsa..',
        savedAt: '',
        showInfo: true,
        isMutualLike: false,
        profilePhotos: [
          ImageModel(imageUrl: 'assets/girl.png'),
          ImageModel(imageUrl: 'assets/girl.png'),
          ImageModel(imageUrl: 'assets/girl.png'),
          ImageModel(imageUrl: 'assets/girl.png'),
          ImageModel(imageUrl: 'assets/girl.png'),
          ImageModel(imageUrl: 'assets/girl.png'),
        ],
      ),
      const Profile(
        firstname: 'Лена',
        age: 25,
        city: 'Москва',
        country: 'Россия',
        id: 1,
        curatorId: 1,
        status: 'married',
        lastname: 'Лена',
        createdAt: '',
        curatorPhotos: [
          ImageModel(imageUrl: 'assets/girl.png'),
          ImageModel(imageUrl: 'assets/girl.png'),
        ],
        draft: false,
        gender: 'Женский',
        haveChild: true,
        height: 180,
        isActive: true,
        isHidden: false,
        phoneNumber: '',
        profileInfo:
            'На свете нет ни одного человека, который бы не мечтал. Я не стала исключением, в моей голове создавались образы прекрасного будущего.dsa..',
        savedAt: '',
        showInfo: false,
        isMutualLike: false,
        profilePhotos: [
          ImageModel(imageUrl: 'assets/girl.png'),
          ImageModel(imageUrl: 'assets/girl.png'),
          ImageModel(imageUrl: 'assets/girl.png'),
          ImageModel(imageUrl: 'assets/girl.png'),
          ImageModel(imageUrl: 'assets/girl.png'),
          ImageModel(imageUrl: 'assets/girl.png'),
        ],
      ),
    ];
  }
}
