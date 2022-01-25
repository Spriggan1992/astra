part of 'my_profile_actor_bloc.dart';

/// MyProfileScreen state change events.
@freezed
class MyProfileActorEvent with _$MyProfileActorEvent {
  /// Screen initialoization event.
  const factory MyProfileActorEvent.initialized(
          Profile profile, Wallet walletInfo, CuratorModel curatorInfo) =
      _Initialized;

  /// Profile descriptyion change event.
  const factory MyProfileActorEvent.descriptionChanged(String description) =
      _DescriptionChanged;

  /// Hiding or showing profile account info event.
  const factory MyProfileActorEvent.accountInfoDisplayingToggled() =
      _AccountInfoToggled;

  /// Hiding or showing account event.
  const factory MyProfileActorEvent.accountVisibilityToggled() =
      _AccountToggled;

  /// Toggle edititing mode.
  const factory MyProfileActorEvent.editModeToggled() = _EditModeToggled;

  /// Submite changes event.
  const factory MyProfileActorEvent.changesSubmitted() = _ChanchesSubmitted;

  /// Images add event.
  const factory MyProfileActorEvent.imagesAdded() = _ImagesSelected;

  /// Images delete event.
  const factory MyProfileActorEvent.imagesDeleted(ImageModel image) =
      _ImagesDeleted;

  const factory MyProfileActorEvent.editingModeCanceled() =
      _EditingModeCanceled;
}