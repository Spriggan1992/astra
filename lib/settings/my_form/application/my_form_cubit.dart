import 'dart:io';

import 'package:astra_app/core/domain/services/i_cache_user_service.dart';
import 'package:astra_app/core/domain/models/profile_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'my_form_state.dart';
part 'my_form_cubit.freezed.dart';

/// User application form cubit.
@injectable
class MyFormCubit extends Cubit<MyFormState> {
  final ICacheUserService profile;
  MyFormCubit(this.profile) : super(MyFormState.initial());

  /// The method to get profile with images from [ICacheUserService].
  void getProfileWithImages() {
    File? profileImage;
    File? curatorImage;

    profileImage = profile.userProfile.profilePhotos.isEmpty
        ? null
        : profile.userProfile.profilePhotos.first.cachedImage!.fullImage;
    curatorImage = profile.userProfile.curatorPhotos.isEmpty
        ? null
        : profile.userProfile.curatorPhotos.first.cachedImage!.thumbnailImage;

    emit(
      state.copyWith(
        isSuccess: true,
        isInitial: false,
        profile: profile.userProfile,
        profileImage: profileImage,
        curatorImage: curatorImage,
      ),
    );
  }
}
