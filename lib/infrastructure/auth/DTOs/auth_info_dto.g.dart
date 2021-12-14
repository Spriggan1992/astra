// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthInfoDTO _$$_AuthInfoDTOFromJson(Map<String, dynamic> json) =>
    _$_AuthInfoDTO(
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      isSignIn: json['isSignIn'] as bool,
    );

Map<String, dynamic> _$$_AuthInfoDTOToJson(_$_AuthInfoDTO instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'isSignIn': instance.isSignIn,
    };
