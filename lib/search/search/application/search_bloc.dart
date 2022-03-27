import 'package:astra_app/core/application/enums/search_state_type.dart';
import 'package:astra_app/core/domain/models/profile_model.dart';
import 'package:astra_app/core/domain/services/i_cache_user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:astra_app/search/search/domain/i_search_repository.dart';

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
            bool _hiddenProfile = _user.userProfile.isHidden;
            emit(
              state.copyWith(
                stateType: SearchStateType.initial,
                applicants: [],
                isHiddenProfile: false,
              ),
            );
            final response = await _searchApi.getApplicants();
            await Future.delayed(const Duration(milliseconds: 500));
            response.fold(
              (failure) => failure.map(
                api: (message) => emit(
                  state.copyWith(
                    stateType: message.errorMessage != null &&
                            message.errorMessage!.isNotEmpty
                        ? SearchStateType.emptyBalance
                        : SearchStateType.failure,
                    isUnexpectedError: true,
                    isHiddenProfile: _hiddenProfile,
                  ),
                ),
                noConnection: (_) => emit(
                  state.copyWith(
                    stateType: SearchStateType.failure,
                    isNoInternetConnection: true,
                    isHiddenProfile: _hiddenProfile,
                  ),
                ),
              ),
              (profiles) => emit(
                state.copyWith(
                  stateType: SearchStateType.success,
                  applicants: profiles,
                  isHiddenProfile: _hiddenProfile,
                  isEmptyBalance: false,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
