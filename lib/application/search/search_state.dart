part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    /// Initial state, success state, and error states
    required SearchStateType stateType,

    /// Flag, responsible to showing error when no internet connection.
    required bool isHiddenProfile,

    /// Flag, responsible to showing error when no internet connection.
    required bool isNoInternetConnection,

    /// Flag, responsible to showing unexpected error.
    required bool isUnexpectedError,

    /// List of applicants
    required List<Profile> applicants,

    /// Whether the user has empty balance.
    required bool isEmptyBalance,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
        applicants: [],
        stateType: SearchStateType.initial,
        isNoInternetConnection: false,
        isUnexpectedError: false,
        isHiddenProfile: false,
        isEmptyBalance: false,
      );
}
