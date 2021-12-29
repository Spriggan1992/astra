part of 'favorite_actor_bloc.dart';

@freezed
class FavoriteActorEvent with _$FavoriteActorEvent {
  const factory FavoriteActorEvent.removedFromStopList(Profile profile) =
      _RemovedFromStopList;
}
