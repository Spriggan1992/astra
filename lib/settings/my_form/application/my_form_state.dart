part of 'my_form_cubit.dart';

/// User application form state.
@freezed
class MyFormState with _$MyFormState {
  const factory MyFormState({
    /// User profile.
    required final ProfileModel profile,

    /// The first user's image.
    required final File? profileImage,

    /// The curator's image of the user.
    required final File? curatorImage,

    /// A flag is a success state.
    required bool isSuccess,

    /// A flag is an initial state.
    required bool isInitial,
  }) = _MyFormState;

  factory MyFormState.initial() => MyFormState(
        profile: ProfileModel.empty(),
        profileImage: null,
        curatorImage: null,
        isSuccess: false,
        isInitial: true,
      );
}
