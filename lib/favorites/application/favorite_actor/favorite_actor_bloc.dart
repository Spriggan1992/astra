import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/domain/models/profile_model.dart';
import 'package:astra_app/favorites/domain/i_favorites_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favorite_actor_event.dart';
part 'favorite_actor_state.dart';
part 'favorite_actor_bloc.freezed.dart';

@injectable
class FavoriteActorBloc extends Bloc<FavoriteActorEvent, FavoriteActorState> {
  final IFavoritesRepository _favoritesRepository;
  FavoriteActorBloc(this._favoritesRepository)
      : super(FavoriteActorState.initial()) {
    on<FavoriteActorEvent>(
      (event, emit) async {
        await event.map(
          initialized: (e) async {
            emit(
              state.copyWith(
                profiles: e.profiles,
                selectedProfiles: [],
              ),
            );
          },
          removedFromStopList: (e) async {
            emit(state.copyWith(isLoading: true));
            final response = await _favoritesRepository.toThink(e.profile.id);
            response.fold(
              (failure) => emit(_mapFailure(failure, state)),
              (_) {
                List<ProfileModel> selectedList = [];
                selectedList.add(e.profile);
                emit(state.copyWith(selectedProfiles: selectedList));
              },
            );
            emit(state.copyWith(
                isNoInternetConnection: false, isUnexpectedError: false));
          },
          removedAllFromStopList: (e) async {
            emit(state.copyWith(isLoading: true));
            final response = await _favoritesRepository.removeAllFromStopList();
            response.fold(
              (failure) => emit(_mapFailure(failure, state)),
              (_) {
                List<ProfileModel> selectedList = state.profiles;
                emit(state.copyWith(selectedProfiles: selectedList));
              },
            );
          },
        );
      },
    );
  }
}

FavoriteActorState _mapFailure(AstraFailure failure, FavoriteActorState state) {
  return failure.map(
    api: (_) => state.copyWith(isUnexpectedError: true),
    noConnection: (_) => state.copyWith(isNoInternetConnection: true),
  );
}
