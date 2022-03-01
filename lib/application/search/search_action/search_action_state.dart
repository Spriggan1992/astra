part of 'search_action_bloc.dart';

/// Represent states for user actions.
@freezed
class SearchActionState with _$SearchActionState {
  const factory SearchActionState({
    /// Type of posted data, based on [SearchActionType].
    required SearchActionType searchActionType,

    /// Flag, responsible to showing loading indicator.
    required bool isLoading,

    /// Flag, responsible to showing error when no internet connection.
    required bool isNoInternetConnection,

    /// Flag, responsible to showing unexpected error.
    required bool isUnexpectedError,

    /// Flag responsible for successfully posted data to server.
    required bool isSuccess,
  }) = _SearchActionState;

  // Initial states loaded.
  factory SearchActionState.initial() => const SearchActionState(
        searchActionType: SearchActionType.unknown,
        isLoading: false,
        isNoInternetConnection: false,
        isUnexpectedError: false,
        isSuccess: false,
      );
}
