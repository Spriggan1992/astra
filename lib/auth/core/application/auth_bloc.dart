import 'package:astra_app/auth/core/domain/i_auth_api_service.dart';
import 'package:astra_app/core/domain/repositories/i_first_auth_repository.dart';
import 'package:astra_app/core/domain/services/i_cache_user_service.dart';
import 'package:astra_app/core/domain/services/i_curator_info_service.dart';
import 'package:astra_app/settings/my_profile/domain/repositories/i_profile_repository.dart';
import 'package:astra_app/shared/features/store/domain/repositories/i_store_reposytory.dart';
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
  final IFirstAuthRepository _firstAuthRepository;
  final IStoreRepository _storeRepository;

  AuthBloc(
    this._apiService,
    this._profileRepository,
    this._userService,
    this._curatorService,
    this._firstAuthRepository,
    this._storeRepository,
  ) : super(const AuthState.initial()) {
    on<AuthEvent>(
      (event, emit) async {
        await event.map(
          authCheckRequested: (e) async {
            final result = await _apiService.isSignIn();
            if (result) {
              final profileResponse = await _profileRepository.getProfile();
              final curatorResponse = await _profileRepository.getCuratorInfo();
              profileResponse
                  .fold((failure) => emit(const AuthState.unauthenticated()),
                      (profile) {
                _userService.setUserProfile(profile);
                curatorResponse.fold(
                  (failure) => emit(const AuthState.unauthenticated()),
                  (curator) => _curatorService.setCuratorProfile(curator),
                );
                add(const AuthEvent.balanceChecked());
              });
            } else {
              emit(const AuthState.unauthenticated());
            }
          },
          balanceChecked: (e) async {
            final response = await _storeRepository.getMyWallet();
            response.fold(
              (_) => emit(const AuthState.unauthenticated()),
              (wallet) => add(AuthEvent.firstAuthChecked(wallet.amount > 0)),
            );
          },
          firstAuthChecked: (e) async {
            final isFirstAuth = await _firstAuthRepository.isFirstAuth();
            emit(AuthState.authenticated(e.hasLikes, isFirstAuth));
          },
          firstAuthSet: (e) async {
            final isFirstAuth = await _firstAuthRepository.isFirstAuth();
            if (!isFirstAuth) {
              await _firstAuthRepository.setFirstAuth(true);
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
