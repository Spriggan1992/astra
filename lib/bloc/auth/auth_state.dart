part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  const AuthState(
      {required this.user,
      this.status = AuthStatus.unknown,
      this.password = ''});
  final UserData user;
  final String password;
  final AuthStatus status;

  factory AuthState.unknown() =>
      AuthState(user: UserData.emptyReff(), password: '');

  factory AuthState.authenticated(String password) {
    return AuthState(
        user: UserData.emptyReff(),
        status: AuthStatus.authenticated,
        password: password);
  }

  factory AuthState.unauthenticated() {
    return AuthState(
        user: UserData.emptyReff(), status: AuthStatus.unauthenticated);
  }

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [user, status];
}
