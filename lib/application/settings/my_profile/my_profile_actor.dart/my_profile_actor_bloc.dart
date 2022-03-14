import 'dart:io';

import 'package:astra_app/domain/core/models/cached_file_image_model.dart';
import 'package:astra_app/domain/core/models/image_models.dart';
import 'package:astra_app/domain/image_picker/i_image_picker.dart';
import 'package:astra_app/domain/profile/models/curator_model.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/domain/profile/repositories/i_profile_repository.dart';
import 'package:astra_app/domain/store/models/wallet.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'my_profile_actor_state.dart';
part 'my_profile_actor_event.dart';
part 'my_profile_actor_bloc.freezed.dart';

@injectable
class MyProfileActorBloc
    extends Bloc<MyProfileActorEvent, MyProfileActorState> {
  final IProfileRepository _profileRepository;
  final IImagePickerRepository _imagePicker;
  MyProfileActorBloc(
    this._profileRepository,
    this._imagePicker,
  ) : super(MyProfileActorState.initial()) {
    on<MyProfileActorEvent>(
     (event, emit) async {
        await event.map(initialized: (e) async {
          emit(state.copyWith(isLoading: true));
          emit(state.copyWith(
              profile: e.profile,
              walletInfo: e.walletInfo,
              isLoading: false,
              uploadImageLimited: false));
        }, descriptionChanged: (e) async {
          emit(
            state.copyWith(
              profile: state.profile.copyWith(profileInfo: e.description),
            ),
          );
        }, accountInfoDisplayingToggled: (e) async {
          await _accountInfoDisplayingToggled(event, emit);
        }, accountVisibilityToggled: (e) async {
          await _accountVisibilityToggled(event, emit);
        }, editModeToggled: (e) async {
          emit(state.copyWith(isEditMode: !state.isEditMode));
        }, changesSubmitted: (e) async {
          await _changesSubmitted(e, emit);
        }, imagesAdded: (e) async {
          await _imagesAdded(event, emit);
        }, imagesDeleted: (e) async {
          await _imagesDeleted(event as _ImagesDeleted, emit);
        }, editingModeCanceled: (e) async {
          emit(state.copyWith(
              isEditMode: false, selectedImages: [], profile: state.profile));
        });
      },
    );
  }

  /// Handling delete image event.
  Future<void> _imagesDeleted(
      _ImagesDeleted event, Emitter<MyProfileActorState> emit) async {
    final response = await _profileRepository.deletePhoto(event.image);
    emit(response.fold(
        (failure) => failure.map(
            api: (_) => state.copyWith(isShowUnexpactedError: true),
            noConnection: (_) =>
                state.copyWith(isShowNoInternetConnectionError: true)),
        (success) {
      final updatedImages = state.profile.profilePhotos
          .toList()
          .where((item) => item.id != event.image.id)
          .toList();
      return state.copyWith(
          profile: state.profile.copyWith(profilePhotos: updatedImages));
    }));
    emit(state.copyWith(
        isShowNoInternetConnectionError: false, isShowUnexpactedError: false));
  }

  /// Handling  add images event.
  Future<void> _imagesAdded(
      MyProfileActorEvent event, Emitter<MyProfileActorState> emit) async {
    emit(state.copyWith(uploadImageLimited: false));
    if (state.profile.profilePhotos.length >= 7) {
      emit(state.copyWith(uploadImageLimited: true));
    } else {
      final imagesResult = await _imagePicker.getImgs();
      if (imagesResult != null) {
        final images = imagesResult
            .map(
              (e) => ImageModel(fileImage: File(e.path), imageUrl: ""),
            )
            .toList();
        if (images.length + state.profile.profilePhotos.length >= 7) {
          emit(state.copyWith(uploadImageLimited: true));
        } else {
          emit(state.copyWith(selectedImages: images));
        }
      }
    }
  }

  /// Handling account visiblity toggle event.
  Future<void> _accountVisibilityToggled(
      MyProfileActorEvent event, Emitter<MyProfileActorState> emit) async {
    final response =
        await _profileRepository.hideAccount(!state.profile.isHidden);
    emit(
      response.fold(
        (failure) => failure.map(
          api: (_) => state.copyWith(isShowUnexpactedError: true),
          noConnection: (_) =>
              state.copyWith(isShowNoInternetConnectionError: true),
        ),
        (sucess) => state.copyWith(
          profile: state.profile.copyWith(isHidden: !state.profile.isHidden),
        ),
      ),
    );
    emit(state.copyWith(isShowNoInternetConnectionError: false));
  }

  /// Handling account info displaying toggle event.
  Future<void> _accountInfoDisplayingToggled(
      MyProfileActorEvent event, Emitter<MyProfileActorState> emit) async {
    final response =
        await _profileRepository.showAccountInfo(!state.profile.showInfo);
    emit(
      response.fold(
        (failure) => failure.map(
          api: (_) => state.copyWith(isShowUnexpactedError: true),
          noConnection: (_) =>
              state.copyWith(isShowNoInternetConnectionError: true),
        ),
        (sucess) => state.copyWith(
          profile: state.profile.copyWith(showInfo: !state.profile.showInfo),
        ),
      ),
    );
    emit(state.copyWith(isShowNoInternetConnectionError: false));
  }

  /// Handling account changes submitted event.
  Future<void> _changesSubmitted(
      MyProfileActorEvent event, Emitter<MyProfileActorState> emit) async {
    // Setup isLoading state to true.
    if (state.selectedImages.isNotEmpty) {
      final response = await _profileRepository.addPhoto(state.selectedImages);
      emit(
        response.fold(
          (failure) => failure.map(
              api: (_) => state.copyWith(isShowUnexpactedError: true),
              noConnection: (_) =>
                  state.copyWith(isShowNoInternetConnectionError: true)),
          (success) {
            return state.copyWith(
              isSuccessfullySubmitted: success,
              selectedImages: [],
            );
          },
        ),
      );
    }
    // Update short user information and get response as Either with left(failure) and right(success).
    final response =
        await _profileRepository.updateShortInfo(state.profile.profileInfo);
    // Here we fold our response, if we get left(failure response) -> mapping state -> if we get AstraFailure.
    // no connection, setup  flag ///isShowNoInternetConnectionError to true for displaying snackbar with message that
    // no innternet connection, if we get AstraFailure.api (rest dio exception), show coresponding error in UI.
    // if response is success -> setup flag isSuccessfullySubmitted to true.
    emit(
      response.fold(
        (failure) => failure.map(
            noConnection: (_) =>
                state.copyWith(isShowNoInternetConnectionError: true),
            api: (_) => state.copyWith(isShowUnexpactedError: true)),
        (success) => state.copyWith(),
      ),
    );
    emit(
      state.copyWith(
        isShowNoInternetConnectionError: false,
      ),
    );
  }
}
