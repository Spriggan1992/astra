import 'dart:io';

import 'package:astra_app/domain/core/models/image_models.dart';
import 'package:astra_app/domain/image_picker/reopositories/i_image_picker.dart';
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
              profile: e.profile, walletInfo: e.walletInfo, isLoading: false));
        }, descriptionChanged: (e) async {
          emit(
            state.copyWith(
              profile: state.profile.copyWith(profileInfo: e.description),
            ),
          );
        }, accountInfoDisplayingToggled: (e) async {
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
                profile:
                    state.profile.copyWith(showInfo: !state.profile.showInfo),
              ),
            ),
          );
          emit(state.copyWith(isShowNoInternetConnectionError: false));
        }, accountVisibilityToggled: (e) async {
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
                profile:
                    state.profile.copyWith(isHidden: !state.profile.isHidden),
              ),
            ),
          );
          emit(state.copyWith(isShowNoInternetConnectionError: false));
        }, editModeToggled: (e) async {
          emit(state.copyWith(isEditMode: !state.isEditMode));
        }, changesSubmitted: (e) async {
          // Setup isLoading state to true.
          if (state.selectedImages.isNotEmpty) {
            final response =
                await _profileRepository.addPhoto(state.selectedImages);
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
          final response = await _profileRepository
              .updateShortInfo(state.profile.profileInfo);
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
          emit(state.copyWith(
            isShowNoInternetConnectionError: false,
          ));
        }, imagesAdded: (e) async {
          final imagesResult = await _imagePicker.getImgs();
          if (imagesResult != null) {
            final images = imagesResult
                .map(
                  (e) => ImageModel(fileImage: File(e.path), imageUrl: ""),
                )
                .toList();
            emit(state.copyWith(selectedImages: images));
          }
        }, imagesDeleted: (e) async {
          final response = await _profileRepository.deletePhoto(e.image);
          emit(response.fold(
              (failure) => failure.map(
                  api: (_) => state.copyWith(isShowUnexpactedError: true),
                  noConnection: (_) =>
                      state.copyWith(isShowNoInternetConnectionError: true)),
              (success) {
            final updatedImages = state.profile.profilePhotos
                .toList()
                .where((item) => item.id != e.image.id)
                .toList();
            return state.copyWith(
                profile: state.profile.copyWith(profilePhotos: updatedImages));
          }));
          emit(state.copyWith(
              isShowNoInternetConnectionError: false,
              isShowUnexpactedError: false));
        }, editingModeCanceled: (e) async {
          emit(state.copyWith(
              isEditMode: false, selectedImages: [], profile: state.profile));
        });
      },
    );
  }
}
