part of 'full_screen_image_bloc.dart';

@freezed
class FullScreenImageEvent with _$FullScreenImageEvent {
  const factory FullScreenImageEvent.initialized(List<ImageModel> images) =
      _Initialized;

  /// Images delete event.
  const factory FullScreenImageEvent.imagesDeleted() = _ImagesDeleted;

  /// Images delete event.
  const factory FullScreenImageEvent.curentImageIndexSet(int index) =
      _CurentImageIndexSet;

  /// Appbar and bottombar hide event.
  const factory FullScreenImageEvent.appBarAndBottomBarHidden() =
      _AppBarAndBottomBarHidden;
}
