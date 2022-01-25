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
    on<SearchEvent>((event, emit) async {
      await event.map(loadData: (e) async {
        await Future.delayed(const Duration(seconds: 2)); 
        final responce = await _searchApi.getApplicants();
        responce.fold(
          (failure) => emit(
            state.copyWith(
              stateType: SearchStateType.failure,
              errorMessage: '$e',
            ),
          ),
          (r) => emit(
            state.copyWith(
                stateType: SearchStateType.success,
                applicants: r,
                errorMessage: ''),
          ),
        );
      });
    });
  }
}
