import 'dart:async';

import 'package:astra_app/application/user/user_bloc.dart';
import 'package:astra_app/domain/auth/repositories/i_auth_api_service.dart';
import 'package:astra_app/domain/core/services/i_curator_info_service.dart';
import 'package:astra_app/domain/core/services/i_cache_user_service.dart';
import 'package:astra_app/domain/profile/repositories/i_profile_repository.dart';
import 'package:astra_app/injection.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ICacheUserService _userService;
  final ICuratorInfoService _curatorService;
  final IProfileRepository _profileRepository;
  final IAuthApiService _apiService;
  UserBloc _userBloc = getIt<UserBloc>();
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
                  (profile) {
                    _userService.setUserProfile(profile);
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
            emit(const AuthState.unauthenticated());
            await _apiService.signOut();
          },
        );
      },
    );
  }
}
