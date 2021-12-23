part of 'store_actor_bloc.dart';

/// Defines states for changing states in store screen.
@freezed
class StoreActorState with _$StoreActorState {
  const factory StoreActorState({
    required final List<Like> likes,
    required final Like like,
  }) = _StoreActorState;
  factory StoreActorState.initial() => StoreActorState(
        likes: [],
        like: Like.empty(),
      );
}
