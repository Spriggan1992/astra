import 'dart:io';

import 'package:astra_app/domain/core/services/i_cache_user_service.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'application_state.dart';
part 'application_cubit.freezed.dart';

/// User application form cubit.
@injectable
class ApplicationCubit extends Cubit<ApplicationState> {
  final ICacheUserService profile;
  ApplicationCubit(this.profile) : super(ApplicationState.initial());

  /// The method to get profile with images from [ICacheUserService].
  void getProfileWithImages() {
    File? profileImage;
    File? curatorImage;

    profileImage = profile.userProfile.profilePhotos.isEmpty
        ? null
        : profile.userProfile.profilePhotos.first.fileImage;
    curatorImage = profile.userProfile.curatorPhotos.isEmpty
        ? null
        : profile.userProfile.curatorPhotos.first.fileImage;

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
