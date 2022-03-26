import 'package:astra_app/core/application/enums/search_state_type.dart';
import 'package:astra_app/settings/domain/profile/models/profile_properties.dart';
import 'package:astra_app/settings/domain/profile/repositories/i_profile_properties_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_properties_event.dart';
part 'profile_properties_state.dart';
part 'profile_properties_bloc.freezed.dart';

/// Profile properties bloc for managing [ProfilePropertiesState] states.
@injectable
class ProfilePropertiesBloc
    extends Bloc<ProfilePropertiesEvent, ProfilePropertiesState> {
  // Repository for profile properties.
  final IProfilePropertiesRepository _api;
  ProfilePropertiesBloc(this._api) : super(ProfilePropertiesState.initial()) {
    on<ProfilePropertiesEvent>(
      (event, emit) async {
        await event.map(
          load: (e) async {
            emit(
              state.copyWith(
                stateType: SearchStateType.initial,
              ),
            );
            final response = await _api.getProfileProperties(e.id);
            response.fold(
              (failure) => failure.map(
                api: (_) => emit(
                  state.copyWith(
                    stateType: SearchStateType.failure,
                    isUnexpectedError: true,
                  ),
                ),
                noConnection: (_) => emit(
                  state.copyWith(
                    stateType: SearchStateType.failure,
                    isNoInternetConnection: true,
                  ),
                ),
              ),
              (profile) => emit(
                state.copyWith(
                  stateType: SearchStateType.success,
                  profileProperties: profile,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
