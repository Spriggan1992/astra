import 'package:astra_app/domain/favorites/repositories/i_favorites_repository.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favorite_actor_event.dart';
part 'favorite_actor_state.dart';
part 'favorite_actor_bloc.freezed.dart';

@injectable
class FavoriteActorBloc extends Bloc<FavoriteActorEvent, FavoriteActorState> {
  final IFavoritesRepository _favoritesApi;
  FavoriteActorBloc(this._favoritesApi) : super(FavoriteActorState.initial()) {
    on<FavoriteActorEvent>((event, emit) async {
      await event.map(
        removedFromStopList: (e) async {
          emit(state.copyWith(isLoading: true));
          final response = await _favoritesApi.toThink(e.profile.id);
          emit(response.fold(
              (failure) => failure.map(
                  api: (_) => state.copyWith(isUnexpectedError: true),
                  noConnection: (_) =>
                      state.copyWith(isNoInternetConnection: true)),
              (_) => state.copyWith(isRemovedFromStopList: true)));
        },
      );
    });
  }
}
