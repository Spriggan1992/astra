part of 'favorite_bloc.dart';

@freezed
class FavoriteState with _$FavoriteState {
  // /// Initial states loaded.
  // const factory FavoriteState.initial() = _Initial;

  // /// Progress loading states.
  // const factory FavoriteState.loadInProgress() = _LoadInProgress;

  // /// Successfule loaded data state.
  // ///
  // /// Keep state of [Profile] if loaded successfully.
  // const factory FavoriteState.loadSuccess(List<Profile> profiles) =
  //     _LoadSuccess;

  // /// Unsuccessfully loaded data state.
  // const factory FavoriteState.loadFailure() = _LoadFailure;

  // const factory FavoriteState.noInternetConnection() = _NoInternetConnection;

  /// Progress loading states.
  const factory FavoriteState({
    required List<Profile> profiles,
    required bool isLoading,
    required bool isNoInternetConnection,
    required bool isUnexpectedError,
    required bool isSuccess,
  }) = _FavoritState;

  /// Initial states loaded.
  factory FavoriteState.initial() => const FavoriteState(
        profiles: [],
        isLoading: false,
        isNoInternetConnection: false,
        isUnexpectedError: false,
        isSuccess: false,
      );
}
