part of 'favorite_bloc.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    required List<Profile> profiles,
    required FavoriteScreenType favoriteType,
    required bool isLoading,
    required bool isNoInternetConnection,
    required bool isUnexpectedError,
    required bool isSuccess,
  }) = _FavoritState;

  /// Initial states loaded.
  factory FavoriteState.initial() => const FavoriteState(
        profiles: [],
        favoriteType: FavoriteScreenType.likesForYou,
        isLoading: false,
        isNoInternetConnection: false,
        isUnexpectedError: false,
        isSuccess: false,
      );
}
