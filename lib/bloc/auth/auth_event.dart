part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  bool? get stringify => true;
  @override
  List<Object> get props => [];
}

class AuthAppStartEvent extends AuthEvent {}

class AuthLogoutEvent extends AuthEvent {}

class AuthTokenChanged extends AuthEvent {
  final String apiToken;
  final String apiDate;

  const AuthTokenChanged({required this.apiToken, required this.apiDate});
  @override
  bool? get stringify => true;
  @override
  List<Object> get props => [apiToken, apiDate];
}

class AuthSignInWithPhoneEvent extends AuthEvent {}
