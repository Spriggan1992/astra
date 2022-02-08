import 'dart:async';

import 'package:astra_app/domain/auth/repositories/i_auth_api_service.dart';
import 'package:astra_app/domain/core/services/i_curator_info_service.dart';
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
  final ICuratorInfoService _curatorService;
  final IProfileRepository _profileRepository;
  final IAuthApiService _apiService;
  AuthBloc(
    this._apiService,
    this._profileRepository,
    this._userService,
    this._curatorService,
  ) : super(
          const AuthState.initial(),
        ) {
    on<AuthEvent>(
      (event, emit) async {
        await event.map(
          authCheckRequested: (e) async {
            await Future.delayed(const Duration(milliseconds: 500), () => true);
            final result = await _apiService.isSignIn();
            if (result) {
              final profileResponse = await _profileRepository.getProfile();
              final curatorResponse = await _profileRepository.getCuratorInfo();
              emit(
                profileResponse.fold(
                  (failure) => const AuthState.unauthenticated(),
                  (proifile) {
                    _userService.setUserProfile(proifile);
                    curatorResponse.fold(
                      (failure) => const AuthState.unauthenticated(),
                      (curator) => _curatorService.setCuratorProfile(curator),
                    );
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
      },
    );
  }
}
