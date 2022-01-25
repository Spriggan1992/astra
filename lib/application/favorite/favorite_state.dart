part of 'favorite_bloc.dart';

/// Represent states for favorites screen.
@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    /// Users profiles.
    required List<Profile> profiles,

    /// Type of favorite screen.
    required FavoriteScreenType favoriteType,

    /// Flag, responsible for showing loading indicator.
    required bool isLoading,

    /// Flag, responsible showing error when no internet connection.
    required bool isNoInternetConnection,

    /// Flag, responsible showing unexpected error.
    required bool isUnexpectedError,

    /// Flag responsible for successfuly loaded data from server.
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
