part of 'application_cubit.dart';

/// User application form state.
@freezed
class ApplicationState with _$ApplicationState {
  const factory ApplicationState({
    /// User profile.
    required final Profile profile,

    /// The first user's image.
    required final File? profileImage,

    /// The curator's image of the user.
    required final File? curatorImage,

    /// A flag is a success state.
    required bool isSuccess,

    /// A flag is an initial state.
    required bool isInitial,
  }) = _ApplicationState;

  factory ApplicationState.initial() => ApplicationState(
        profile: Profile.empty(),
        profileImage: null,
        curatorImage: null,
        isSuccess: false,
        isInitial: true,
      );
}
