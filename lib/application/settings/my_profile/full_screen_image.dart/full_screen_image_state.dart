part of 'full_screen_image_bloc.dart';

/// Defines states for FullScreenimage.
@freezed
class FullScreenImageState with _$FullScreenImageState {
  const factory FullScreenImageState({
    /// State of images.
    required List<ImageModel> images,

    /// State of loading data.
    required bool isLoading,

    /// State of current image index.
    required int currentImageIndex,

    /// A flaf responsible for hide or show top and botom bars.
    required bool isHideAppbarAndBottomBar,

    /// A flag responsible  for showing or hiding error, when there is no internet connection.
    required bool isShowNoInternetConnectionError,

    /// A flag respnosible for showing or hiding error, when get unexpected exception.
    required bool isShowUnexpactedError,
  }) = _FullScreenImageState;
  factory FullScreenImageState.initial() => const FullScreenImageState(
        images: [],
        isLoading: false,
        currentImageIndex: 0,
        isShowNoInternetConnectionError: false,
        isShowUnexpactedError: false,
        isHideAppbarAndBottomBar: false,
      );
}
