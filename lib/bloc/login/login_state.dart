part of 'login_cubit.dart';

enum LoginStatus { initial, error, success }

class LoginState extends Equatable {
  final String phoneNumber;
  final String smsCode;
  final Failure failure;
  final LoginStatus status;

  const LoginState({
    required this.phoneNumber,
    required this.failure,
    required this.status,
    required this.smsCode,
  });

  factory LoginState.initial() {
    return const LoginState(
      phoneNumber: '',
      smsCode: '',
      failure: Failure(),
      status: LoginStatus.initial,
    );
  }

  LoginState copyWith({
    String? phoneNumber,
    String? smsCode,
    Failure? failure,
    LoginStatus? status,
  }) {
    return LoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      smsCode: smsCode ?? this.smsCode,
      failure: failure ?? this.failure,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [phoneNumber, smsCode, failure, status];
}
