import 'package:astra_app/domain/core/models/image_models.dart';
import 'package:astra_app/domain/profile/repositories/i_profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'full_screen_image_event.dart';
part 'full_screen_image_state.dart';
part 'full_screen_image_bloc.freezed.dart';

/// Defines states for FullScreenImage.
@injectable
class FullScreenImageBloc
    extends Bloc<FullScreenImageEvent, FullScreenImageState> {
  /// API request service to profile.
  final IProfileRepository _profileRepo;
  FullScreenImageBloc(this._profileRepo)
      : super(FullScreenImageState.initial()) {
    on<FullScreenImageEvent>(
      (event, emit) async {
        await event.map(
          initialized: (e) async {
            emit(state.copyWith(images: e.images));
          },
          imagesDeleted: (e) async {
            emit(state.copyWith(isLoading: true));
            final response = await _profileRepo
                .deletePhoto(state.images[state.currentImageIndex]);
            emit(
              response.fold(
                  (failure) => failure.map(
                      api: (_) => state.copyWith(isShowUnexpactedError: true),
                      noConnection: (_) => state.copyWith(
                          isShowNoInternetConnectionError: true)), (_) {
                final updatedImages = state.images
                    .where((element) =>
                        element.id != state.images[state.currentImageIndex].id)
                    .toList();
                return state.copyWith(
                    images: updatedImages,
                    currentImageIndex: _getCurrentIndex(
                        state.currentImageIndex, updatedImages.length));
              }),
            );
            emit(state.copyWith(isLoading: false));
          },
          curentImageIndexSet: (e) async {
            emit(state.copyWith(currentImageIndex: e.index));
          },
          appBarAndBottomBarHidden: (e) async {
            emit(state.copyWith(
                isHideAppbarAndBottomBar: !state.isHideAppbarAndBottomBar));
          },
        );
      },
    );
  }

  /// Get current index of images.
  int _getCurrentIndex(int deletedIndex, int imageLength) {
    if (imageLength == deletedIndex) {
      return deletedIndex - 1;
    } else {
      return deletedIndex;
    }
  }
}
