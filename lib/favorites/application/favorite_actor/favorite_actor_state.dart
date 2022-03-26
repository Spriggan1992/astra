part of 'favorite_actor_bloc.dart';

/// Defines states for favorite screen.
@freezed
class FavoriteActorState with _$FavoriteActorState {
  const factory FavoriteActorState({
    /// Flag, responsible for showing loading indicator.
    required bool isLoading,

    /// Flag, responsible for removing user from stop list to the think category.
    required bool isRemovedFromStopList,

    /// Flag, responsible for showing unexpected error.
    required bool isUnexpectedError,

    /// Flag, responsible showing error when no internet connection.
    required bool isNoInternetConnection,

    /// Users profiles.
    required List<ProfileModel> profiles,

    /// List of selected profiles.
    required List<ProfileModel> selectedProfiles,
  }) = _FavoriteActorState;

  /// Initial states loaded.
  factory FavoriteActorState.initial() => const FavoriteActorState(
        isLoading: false,
        isRemovedFromStopList: false,
        isUnexpectedError: false,
        isNoInternetConnection: false,
        profiles: [],
        selectedProfiles: [],
      );
}
