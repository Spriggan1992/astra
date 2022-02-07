import 'package:astra_app/domain/auth/repositories/i_auth_api_service.dart';
import 'package:astra_app/domain/core/services/i_user_unfo_service.dart';
import 'package:astra_app/domain/profile/repositories/i_profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IUserInfoService _userService;
  final IProfileRepository _profileRepository;
  final IAuthApiService _apiService;
  AuthBloc(this._apiService, this._profileRepository, this._userService)
      : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        authCheckRequested: (e) async {
          await Future.delayed(const Duration(milliseconds: 500), () => true);
          // final result = await _profileRepository.getProfile();
          final result = await _apiService.isSignIn();
          if (result) {
            // emit(const AuthState.loading());
            final profileResponse = await _profileRepository.getProfile();
            emit(
              profileResponse.fold(
                (failure) => const AuthState.unauthenticated(),
                (proifile) {
                  _userService.setUserProfile(proifile);
                  return const AuthState.authenticated();
                },
              ),
            );
          } else {
            emit(const AuthState.unauthenticated());
          }
        },
        signedOut: (e) async {
          await _apiService.signOut();
          emit(const AuthState.unauthenticated());
        },
      );
    });
  }
}
