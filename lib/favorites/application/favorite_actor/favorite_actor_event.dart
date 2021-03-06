part of 'favorite_actor_bloc.dart';

@freezed
class FavoriteActorEvent with _$FavoriteActorEvent {
  /// Screen initialization event.
  const factory FavoriteActorEvent.initialized(List<ProfileModel> profiles) =
      _Initialized;

  /// Removes user from stop list to the think category event.
  const factory FavoriteActorEvent.removedFromStopList(ProfileModel profile) =
      _RemovedFromStopList;

  /// Removes all users from stop list to the think category event.
  const factory FavoriteActorEvent.removedAllFromStopList() =
      _RemovedAllFromStopList;
}
