part of 'favorite_bloc.dart';

@freezed
class FavoriteEvent with _$FavoriteEvent {
  /// Loaded data event.
  ///
  /// Loaded date based on [FavoriteScreenType].
  const factory FavoriteEvent.loadedData({FavoriteScreenType? favoriteType}) =
      _Started;
}
