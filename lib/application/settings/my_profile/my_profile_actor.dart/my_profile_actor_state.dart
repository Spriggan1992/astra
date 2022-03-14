part of 'my_profile_actor_bloc.dart';

/// Defines states for my profile  screen.
@freezed
class MyProfileActorState with _$MyProfileActorState {
  const factory MyProfileActorState({
    /// Whether to show progress loading data indicator.
    required bool isLoading,

    /// User profile information.
    required Profile profile,

    /// A flag responsible for showing or hiding edit mode.
    required bool isEditMode,

    /// A flag responsible for showing or hiding error, when there no internet connection.
    required bool isShowNoInternetConnectionError,

    /// A flag responsible for showing or hiding error, when get unexpected exception.
    required bool isShowUnexpectedError,

    /// A flag responsible for successfully or unsuccessfully submitted changed settings.
    required bool isSuccessfullySubmitted,

    /// A flag is showing dialog is count of upload images more than limit.
    required bool uploadImageLimited,

    /// Selected images from gallery on device.
    required List<ImageModel> selectedImages,
  }) = _MyProfileActorState;
  factory MyProfileActorState.initial() => MyProfileActorState(
        isLoading: false,
        profile: Profile.empty(),
        isEditMode: false,
        isShowNoInternetConnectionError: false,
        isShowUnexpectedError: false,
        isSuccessfullySubmitted: false,
        selectedImages: [],
        uploadImageLimited: false,
      );
}
