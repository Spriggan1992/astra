import 'package:astra_app/domain/core/services/i_cache_user_service.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:astra_app/application/core/enums/search_state_type.dart';
import 'package:astra_app/domain/search/repositories/i_search_repository.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ISearchRepository _searchApi;
  final ICacheUserService _user;
  SearchBloc(
    this._searchApi,
    this._user,
  ) : super(SearchState.initial()) {
    on<SearchEvent>(
      (event, emit) async {
        await event.map(
          loadData: (e) async {
            bool _hidenProfile = _user.userProfile.isHidden;

            emit(
              state.copyWith(
                stateType: SearchStateType.initial,
                applicants: [],
                isHidenProfile: false,
              ),
            );

            final response = await _searchApi.getApplicants();
            response.fold(
              (failure) => failure.map(
                api: (_) => emit(
                  state.copyWith(
                    stateType: SearchStateType.failure,
                    isUnexpectedError: true,
                    isHidenProfile: _hidenProfile,
                  ),
                ),
                noConnection: (_) => emit(
                  state.copyWith(
                    stateType: SearchStateType.failure,
                    isNoInternetConnection: true,
                    isHidenProfile: _hidenProfile,
                  ),
                ),
              ),
              (r) => emit(
                state.copyWith(
                  stateType: SearchStateType.success,
                  applicants: r,
                  isHidenProfile: _hidenProfile,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
