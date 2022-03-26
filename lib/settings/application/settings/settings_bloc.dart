import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/settings/domain/profile/models/profile_short_model.dart';
import 'package:astra_app/settings/domain/profile/repositories/i_profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final IProfileRepository _profileRepo;
  SettingsBloc(this._profileRepo) : super(const SettingsState.initial()) {
    on<SettingsEvent>(
      (event, emit) async {
        await event.map(
          profileLoaded: (e) async {
            emit(const SettingsState.loadInProgress());
            final response = await _profileRepo.getProfileShort();
            emit(
              response.fold(
                (failure) => SettingsState.loadFailure(failure),
                (success) {
                  return SettingsState.loadSuccess(success);
                },
              ),
            );
          },
        );
      },
    );
  }
}
