part of 'favorite_bloc.dart';

/// Represent states for favorites screen.
@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    /// Users profiles.
    required List<ProfileModel> profiles,

    /// Type of favorite screen.
    required FavoriteScreenType favoriteType,

    /// Flag, responsible to showing loading indicator.
    required bool isLoading,

    /// Flag, responsible to showing error when no internet connection.
    required bool isNoInternetConnection,

    /// Flag, responsible to showing unexpected error.
    required bool isUnexpectedError,

    /// Flag responsible for successfully loaded data from server.
    required bool isSuccess,

    /// Whether the user has likes on account.
    required bool isEmptyBalance,

    /// Whether the current is hidden.
    required bool isHiddenProfile,
  }) = _FavoriteState;

  /// Initial states loaded.
  factory FavoriteState.initial() => const FavoriteState(
        profiles: [],
        favoriteType: FavoriteScreenType.likesForYou,
        isLoading: false,
        isNoInternetConnection: false,
        isUnexpectedError: false,
        isSuccess: false,
        isEmptyBalance: false,
        isHiddenProfile: false,
      );
}
