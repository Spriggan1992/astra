import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

/// Represent union of authorization filures.
@freezed
class AuthFailure with _$AuthFailure {
  const AuthFailure._();
  const factory AuthFailure.server([String? message]) = _Server;
  const factory AuthFailure.failAuthorization() = _FailAuthorization;
  const factory AuthFailure.userNotExist() = _UserNotExist;
}
