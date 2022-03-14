import 'package:astra_app/application/core/enums/search_action_type.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/search/repositories/i_search_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_action_event.dart';
part 'search_action_state.dart';
part 'search_action_bloc.freezed.dart';

@injectable
class SearchActionBloc extends Bloc<SearchActionEvent, SearchActionState> {
  final ISearchRepository _searchApi;
  SearchActionBloc(this._searchApi) : super(SearchActionState.initial()) {
    on<SearchActionEvent>(
      (event, emit) async {
        await event.map(
          like: (e) async {
            final response = await _searchApi.toLike(e.id);
            final _state = _getSearchEvent(response, SearchActionType.liked);
            emit(_state);
          },
          block: (e) async {
            final response = await _searchApi.toBlock(e.id);
            final _state = _getSearchEvent(response, SearchActionType.blocked);
            emit(_state);
          },
          reject: (e) async {
            final response = await _searchApi.toReject(e.id);
            final _state = _getSearchEvent(response, SearchActionType.rejected);
            emit(_state);
          },
          think: (e) async {
            final response = await _searchApi.toThink(e.id);
            final _state = _getSearchEvent(response, SearchActionType.thought);
            emit(_state);
          },
          accountShown: (e) async {
            final response = await _searchApi.showAccount();
            emit(
              response.fold(
                (failure) => failure.map(
                  api: (_) => state.copyWith(
                    isUnexpectedError: true,
                  ),
                  noConnection: (_) => state.copyWith(
                    isNoInternetConnection: true,
                  ),
                ),
                (r) => state.copyWith(
                  canCloseDialog: r,
                ),
              ),
            );
            await Future.delayed(const Duration(milliseconds: 300));
            emit(state.copyWith(canCloseDialog: false));
          },
        );
      },
    );
  }

  SearchActionState _getSearchEvent(
      Either<AstraFailure, Unit> response, SearchActionType searchActionType) {
    return response.fold(
      (failure) => failure.map(
        api: (_) => state.copyWith(
          isUnexpectedError: true,
        ),
        noConnection: (_) => state.copyWith(
          isNoInternetConnection: true,
        ),
      ),
      (r) => state.copyWith(
        searchActionType: searchActionType,
        isSuccess: true,
      ),
    );
  }
}
