import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_info.freezed.dart';

/// Represents information about a user.
@freezed
class AuthInfo with _$AuthInfo {
  const AuthInfo._();
  const factory AuthInfo({
    required String phoneNumber,
    required String password,
    // Temp property.
    required bool isSignIn,
  }) = _AuthInfo;
  factory AuthInfo.empty() => const AuthInfo(
        phoneNumber: "",
        password: "",
        isSignIn: false,
      );
}
