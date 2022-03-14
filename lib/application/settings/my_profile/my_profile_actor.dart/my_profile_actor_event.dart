part of 'my_profile_actor_bloc.dart';

/// MyProfileScreen state change events.
@freezed
class MyProfileActorEvent with _$MyProfileActorEvent {
  /// Screen initialization event.
  const factory MyProfileActorEvent.initialized(
    Profile profile,
    // CuratorModel curatorInfo,
  ) = _Initialized;

  /// Profile description change event.
  const factory MyProfileActorEvent.descriptionChanged(String description) =
      _DescriptionChanged;

  /// Hiding or showing profile account info event.
  const factory MyProfileActorEvent.accountInfoDisplayingToggled() =
      _AccountInfoToggled;

  /// Hiding or showing account event.
  const factory MyProfileActorEvent.accountVisibilityToggled() =
      _AccountToggled;

  /// Toggle editing mode.
  const factory MyProfileActorEvent.editModeToggled() = _EditModeToggled;

  /// Submits changes event.
  const factory MyProfileActorEvent.changesSubmitted() = _ChanchesSubmitted;

  /// Images add event.
  const factory MyProfileActorEvent.imagesAdded() = _ImagesSelected;

  /// Images delete event.
  const factory MyProfileActorEvent.imagesDeleted(ImageModel image) =
      _ImagesDeleted;

  const factory MyProfileActorEvent.editingModeCanceled() =
      _EditingModeCanceled;
}
