part of 'favorite_actor_bloc.dart';

@freezed
class FavoriteActorEvent with _$FavoriteActorEvent {
  /// Screen initialoization event.
  const factory FavoriteActorEvent.initialized(List<Profile> profiles) =
      _Initialized;

  /// Removes user from stop list to the think category event.
  const factory FavoriteActorEvent.removedFromStopList(Profile profile) =
      _RemovedFromStopList;
}
