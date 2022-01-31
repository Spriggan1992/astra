import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:astra_app/application/search/search_state_type.dart';
import 'package:astra_app/domain/search/repositories/i_search_repository.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ISearchRepository _searchApi;

  SearchBloc(this._searchApi) : super(SearchState.initial()) {
    on<SearchEvent>(
      (event, emit) async {
        await event.map(
          loadData: (e) async {
            final response = await _searchApi.getApplicants();
            response.fold(
              (failure) => failure.map(
                api: (_) =>
                    state.copyWith(stateType: SearchStateType.unexpectedError),
                noConnection: (_) => state.copyWith(
                    stateType: SearchStateType.noInternetConnection),
              ),
              (r) => emit(
                state.copyWith(
                  stateType: SearchStateType.success,
                  applicants: r,
                  errorMessage: '',
                ),
              ),
            );
          },
          block: (e) async {
            final response = await _searchApi.toBlock(e.id);
            response.fold(
              (failure) => failure.map(
                api: (_) =>
                    state.copyWith(stateType: SearchStateType.unexpectedError),
                noConnection: (_) => state.copyWith(
                    stateType: SearchStateType.noInternetConnection),
              ),
              (r) {
                emit(
                  state.copyWith(
                    stateType: SearchStateType.successBlock,
                  ),
                );
              },
            );
          },
          like: (e) async {
            final response = await _searchApi.toLike(e.id);
            response.fold(
              (failure) => failure.map(
                api: (_) =>
                    state.copyWith(stateType: SearchStateType.unexpectedError),
                noConnection: (_) => state.copyWith(
                    stateType: SearchStateType.noInternetConnection),
              ),
              (r) {
                emit(
                  state.copyWith(
                    stateType: SearchStateType.successBlock,
                  ),
                );
              },
            );
          },
          reject: (e) async {
            final response = await _searchApi.toReject(e.id);
            response.fold(
              (failure) => failure.map(
                api: (_) =>
                    state.copyWith(stateType: SearchStateType.unexpectedError),
                noConnection: (_) => state.copyWith(
                    stateType: SearchStateType.noInternetConnection),
              ),
              (r) {
                emit(
                  state.copyWith(
                    stateType: SearchStateType.successBlock,
                  ),
                );
              },
            );
          },
          think: (e) async {
            final response = await _searchApi.toThink(e.id);
            response.fold(
              (failure) => failure.map(
                api: (_) =>
                    state.copyWith(stateType: SearchStateType.unexpectedError),
                noConnection: (_) => state.copyWith(
                    stateType: SearchStateType.noInternetConnection),
              ),
              (r) {
                emit(
                  state.copyWith(
                    stateType: SearchStateType.successBlock,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
