part of 'my_profile_actor_bloc.dart';

/// Defines states for my profile  screen.
@freezed
class MyProfileActorState with _$MyProfileActorState {
  const factory MyProfileActorState({
    /// User profile information.
    required Profile profile,

    /// A flag respnosible for showing or hiding edit mode.
    required bool isEditMode,

    /// A flag respnosible for showing or hiding error, when there no internet connection.
    required bool isShowNoInternetConnectionError,

    /// A flag respnosible for showing or hiding error, when get unexpected exception.
    required bool isShowUnexpactedError,

    /// A flag responsible for successfully or unsuccessfully submitted changed settings.
    required bool isSuccessfullySubmitted,

    /// Selected images from gallery on device.
    required List<ImageModel> selectedImages,

    /// Wallet info to display.
    required Wallet walletInfo,

    /// State of curator information.
    required CuratorModel curatorInfo,
  }) = _MyProfileActorState;
  factory MyProfileActorState.initial() => MyProfileActorState(
        profile: Profile.empty(),
        isEditMode: false,
        // isLoading: false,
        isShowNoInternetConnectionError: false,
        isShowUnexpactedError: false,
        isSuccessfullySubmitted: false,
        selectedImages: [],
        walletInfo: Wallet.empty(),
        curatorInfo: CuratorModel.empty(),
      );
}
