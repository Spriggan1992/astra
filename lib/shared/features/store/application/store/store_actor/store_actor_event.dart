part of 'store_actor_bloc.dart';

/// Store actor state change events.
@freezed
class StoreActorEvent with _$StoreActorEvent {
  /// Screen initialization event.
  const factory StoreActorEvent.initialized(List<Like> likes) = _Initialized;

  /// Like package select change event.
  const factory StoreActorEvent.likePackageSelected(Like like) =
      _LikePackageSelected;
}
