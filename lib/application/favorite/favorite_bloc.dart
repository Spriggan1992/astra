import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/favorites/repositories/i_favorites_repository.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';
part 'favorite_bloc.freezed.dart';

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final IFavoritesRepository _favoritesApi;
  FavoriteBloc(this._favoritesApi) : super(FavoriteState.initial()) {
    on<FavoriteEvent>((event, emit) async {
      await event.map(
        initialized: (e) async {
          emit(state.copyWith(
              isLoading: true,
              isNoInternetConnection: false,
              isUnexpectedError: false));
          await Future.delayed(const Duration(milliseconds: 500));
          final response = await _getResponseResult(e.favoriteType);
          emit(response.fold(
              (failure) => failure.map(
                  api: (_) => state.copyWith(isUnexpectedError: true),
                  noConnection: (_) =>
                      state.copyWith(isNoInternetConnection: true)),
              (profile) => state.copyWith(isSuccess: true, profiles: profile)));
          emit(state.copyWith(isLoading: false));
        },
      );
    });
  }

  Future<Either<AstraFailure, List<Profile>>> _getResponseResult(
      FavoriteScreenType favoiteType) async {
    if (favoiteType == FavoriteScreenType.likesForYou) {
      return await _favoritesApi.getWhoLikes();
    } else if (favoiteType == FavoriteScreenType.yourLikes) {
      return await _favoritesApi.getLikes();
    } else if (favoiteType == FavoriteScreenType.think) {
      return await _favoritesApi.getThink();
    } else {
      return await _favoritesApi.getNope();
    }
  }
}
