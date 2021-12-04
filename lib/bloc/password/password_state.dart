part of 'password_cubit.dart';

enum PasswordStatus { initial, error, success, succsessPassword }

class PasswordState extends Equatable {
  final String password;

  final Failure failure;
  final PasswordStatus status;
  const PasswordState({
    required this.password,
    required this.failure,
    required this.status,
  });

  factory PasswordState.initial() {
    return const PasswordState(
        password: '', failure: Failure(), status: PasswordStatus.initial);
  }

  PasswordState copyWith({
    String? password,
    Failure? failure,
    PasswordStatus? status,
  }) {
    return PasswordState(
      password: password ?? this.password,
      failure: failure ?? this.failure,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [password, failure, status];
}
