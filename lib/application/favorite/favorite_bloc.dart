import 'dart:async';

import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/core/services/i_cache_user_service.dart';
import 'package:astra_app/domain/favorites/i_favorites_repository.dart';
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
  final IFavoritesRepository _favoritesRepository;
  final ICacheUserService _user;
  FavoriteBloc(
    this._favoritesRepository,
    this._user,
  ) : super(FavoriteState.initial()) {
    on<FavoriteEvent>(
      (event, emit) async {
        await event.map(
          loadedData: (e) async {
            emit(
              state.copyWith(
                isLoading: true,
                favoriteType: e.favoriteType ?? FavoriteScreenType.likesForYou,
                isNoInternetConnection: false,
                isUnexpectedError: false,
              ),
            );
            await Future.delayed(const Duration(milliseconds: 500));
            await _foldResponse(e.favoriteType, emit);
            emit(state.copyWith(isLoading: false));
          },
          usersUpdated: (e) async {
            await _foldResponse(e.favoriteType, emit);
          },
        );
      },
    );
  }

  Future<void> _foldResponse(
    FavoriteScreenType? favoriteType,
    Emitter<FavoriteState> emit,
  ) async {
    bool _isHiddenProfile = _user.userProfile.isHidden;
    bool _isEmptyBalance = _user.userProfile.likeAmount < 1;
    final response = await _getResponseResult(
      favoriteType ?? FavoriteScreenType.likesForYou,
    );
    emit(
      response.fold(
        (failure) => failure.map(
            api: (_) => state.copyWith(isUnexpectedError: true),
            noConnection: (_) => state.copyWith(isNoInternetConnection: true)),
        (profile) => state.copyWith(
          isSuccess: true,
          profiles: profile,
          isHiddenProfile: _isHiddenProfile,
          isEmptyBalance: _isEmptyBalance,
        ),
      ),
    );
  }

  Future<Either<AstraFailure, List<Profile>>> _getResponseResult(
      FavoriteScreenType favoriteType) async {
    if (favoriteType == FavoriteScreenType.likesForYou) {
      return await _favoritesRepository.getWhoLikes();
    } else if (favoriteType == FavoriteScreenType.yoursLikes) {
      return await _favoritesRepository.getLikes();
    } else if (favoriteType == FavoriteScreenType.think) {
      return await _favoritesRepository.getThink();
    } else if (favoriteType == FavoriteScreenType.match) {
      return await _favoritesRepository.getMatch();
    } else {
      return await _favoritesRepository.getNope();
    }
  }

  @override
  Future<void> close() async {
    return super.close();
  }
}
