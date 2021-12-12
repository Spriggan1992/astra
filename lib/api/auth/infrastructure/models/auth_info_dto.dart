import 'package:astra_app/api/auth/domain/auth_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_info_dto.freezed.dart';
part 'auth_info_dto.g.dart';

/// Represent data transfer object.
@freezed
class AuthInfoDTO with _$AuthInfoDTO {
  const AuthInfoDTO._();
  const factory AuthInfoDTO({
    required String phoneNumber,
    required String password,
    // Temp property.
    required bool isSignIn,
  }) = _AuthInfoDTO;

  factory AuthInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthInfoDTOFromJson(json);

  factory AuthInfoDTO.fromDomain(AuthInfo _) {
    return AuthInfoDTO(
        phoneNumber: _.phoneNumber, password: _.password, isSignIn: _.isSignIn);
  }
  AuthInfo toDomain() => AuthInfo(
        phoneNumber: phoneNumber,
        password: password,
        isSignIn: isSignIn,
      );
}
