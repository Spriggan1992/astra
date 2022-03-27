part of 'profile_properties_bloc.dart';

/// Profile properties state
@freezed
class ProfilePropertiesState with _$ProfilePropertiesState {
  const factory ProfilePropertiesState({
    /// Initial state, success state, and error states
    required SearchStateType stateType,

    /// Flag, responsible to showing error when no internet connection.
    required bool isNoInternetConnection,

    /// Flag, responsible to showing unexpected error.
    required bool isUnexpectedError,

    /// List of applicants
    required List<ProfileProperties> profileProperties,
  }) = _ProfilePropertiesState;

  factory ProfilePropertiesState.initial() => const ProfilePropertiesState(
        profileProperties: [],
        stateType: SearchStateType.initial,
        isNoInternetConnection: false,
        isUnexpectedError: false,
      );
}
