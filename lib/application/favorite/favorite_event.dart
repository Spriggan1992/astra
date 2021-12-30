part of 'favorite_bloc.dart';

@freezed
class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.initialized(FavoriteScreenType favoriteType) =
      _Started;
}
