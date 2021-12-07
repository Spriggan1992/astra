import 'dart:async';
import 'package:astra_app/models/models.dart';
import 'package:astra_app/repositories/auth_repository.dart';
import 'package:astra_app/repositories/local_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final LocalRepository _localRepository;

  AuthBloc(
      {required AuthRepository authRepository,
      required LocalRepository localRepository})
      : _authRepository = authRepository,
        _localRepository = localRepository,
        super(AuthState.unknown()) {
    on<AuthTokenChanged>((event, emit) => _mapAuthTokenChangedToState);
    on<AuthAppStartEvent>((event, emit) async {
      await _localRepository.initialize();

      final _password = await _localRepository.get(LocalRepository.keyPassword);

      if (_password != null) {
        if (_password.isEmpty) {
          emit(AuthState.unauthenticated());
        } else {
          emit(AuthState.authenticated(_password));
        }
      } else {
        emit(AuthState.unauthenticated());
      }
    });
    on<AuthLogoutEvent>((event, emit) => _mapAuthLogoutEventToState);
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthTokenChanged) {
      yield* _mapAuthTokenChangedToState(event);
    } else if (event is AuthAppStartEvent) {
      yield* _mapAuthAppStartEventToState(event);
    } else if (event is AuthLogoutEvent) {
      yield* _mapAuthLogoutEventToState(event);
    }
  }

  Stream<AuthState> _mapAuthLogoutEventToState(AuthLogoutEvent event) async* {
    await _localRepository.initialize();
    yield AuthState.unauthenticated();
  }

  Stream<AuthState> _mapAuthAppStartEventToState(
      AuthAppStartEvent event) async* {
    try {
      print('auth: unauthenticated');
      yield AuthState.unauthenticated();
    } on Failure catch (err) {
      print('auth unauthenticated: $err');
      yield AuthState.unauthenticated();
    }
  }

  Stream<AuthState> _mapAuthTokenChangedToState(AuthTokenChanged event) async* {
    yield AuthState.unauthenticated();
  }
}
