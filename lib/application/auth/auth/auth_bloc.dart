import 'package:astra_app/domain/auth/repositories/i_auth_api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthApiService _apiService;
  AuthBloc(this._apiService) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        authCheckRequested: (e) async {
          await Future.delayed(const Duration(milliseconds: 500), () => true);
          final result = await _apiService.isSignIn();
          emit(
            result
                ? const AuthState.authenticated()
                : const AuthState.unauthenticated(),
          );
        },
        signedOut: (e) async {
          await _apiService.signOut();
          emit(const AuthState.unauthenticated());
        },
      );
    });
  }
}
