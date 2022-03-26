part of 'my_profile_bloc.dart';

/// MyProfile screen state change events.
@freezed
class MyProfileEvent with _$MyProfileEvent {
  /// My profile loaded state change event.
  const factory MyProfileEvent.profileLoaded() = _ProfileLoaded;
}
