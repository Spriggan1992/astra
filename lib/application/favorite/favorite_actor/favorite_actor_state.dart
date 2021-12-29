part of 'favorite_actor_bloc.dart';

@freezed
class FavoriteActorState with _$FavoriteActorState {
  const factory FavoriteActorState({
    required bool isLoading,
    required bool isRemovedFromStopList,
    required bool isUnexpectedError,
    required bool isNoInternetConnection,
  }) = _FavoriteActorState;
  factory FavoriteActorState.initial() => const FavoriteActorState(
        isLoading: false,
        isRemovedFromStopList: false,
        isUnexpectedError: false,
        isNoInternetConnection: false,
      );
}
