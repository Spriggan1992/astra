import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/domain/models/profile_model.dart';
import 'package:astra_app/settings/my_profile/domain/repositories/i_profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'my_profile_event.dart';
part 'my_profile_state.dart';
part 'my_profile_bloc.freezed.dart';

@injectable
class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  final IProfileRepository _profileRepo;
  MyProfileBloc(
    this._profileRepo,
  ) : super(const MyProfileState.initial()) {
    on<MyProfileEvent>(
      (event, emit) async {
        await event.map(
          profileLoaded: (e) async {
            emit(const MyProfileState.loadInProgress());
            final profileResponse = await _profileRepo.getProfile();
            profileResponse.fold(
              (failure) => emit(MyProfileState.loadFailure(failure)),
              (profile) => emit(MyProfileState.loadSuccess(profile)),
            );
          },
        );
      },
    );
  }
}
