part of 'full_screen_image_bloc.dart';

/// Defines states for FullScreenImage.
@freezed
class FullScreenImageState with _$FullScreenImageState {
  const factory FullScreenImageState({
    /// State of images.
    required List<ImageModel> images,

    /// State of loading data.
    required bool isLoading,

    /// State of current image index.
    required int currentImageIndex,

    /// A flag responsible for hide or show top and bottom bars.
    required bool isHideAppbarAndBottomBar,

    /// A flag responsible  for showing or hiding error, when there is no internet connection.
    required bool isShowNoInternetConnectionError,

    /// A flag responsible for showing or hiding error, when get unexpected exception.
    required bool isShowUnexpectedError,
    required bool isSuccessfullyDeletePhoto,
  }) = _FullScreenImageState;
  factory FullScreenImageState.initial() => const FullScreenImageState(
        images: [],
        isLoading: false,
        currentImageIndex: 0,
        isShowNoInternetConnectionError: false,
        isShowUnexpectedError: false,
        isHideAppbarAndBottomBar: false,
        isSuccessfullyDeletePhoto: false,
      );
}
