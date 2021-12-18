// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthInfoDTO _$AuthInfoDTOFromJson(Map<String, dynamic> json) {
  return _AuthInfoDTO.fromJson(json);
}

/// @nodoc
class _$AuthInfoDTOTearOff {
  const _$AuthInfoDTOTearOff();

  _AuthInfoDTO call(
      {@JsonKey(name: 'phone_number') required String phoneNumber,
      @JsonKey(name: 'password') required String password}) {
    return _AuthInfoDTO(
      phoneNumber: phoneNumber,
      password: password,
    );
  }

  AuthInfoDTO fromJson(Map<String, Object?> json) {
    return AuthInfoDTO.fromJson(json);
  }
}

/// @nodoc
const $AuthInfoDTO = _$AuthInfoDTOTearOff();

/// @nodoc
mixin _$AuthInfoDTO {
  /// Phone numberfor sending to server.
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Password for sending to server.
  @JsonKey(name: 'password')
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthInfoDTOCopyWith<AuthInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthInfoDTOCopyWith<$Res> {
  factory $AuthInfoDTOCopyWith(
          AuthInfoDTO value, $Res Function(AuthInfoDTO) then) =
      _$AuthInfoDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'phone_number') String phoneNumber,
      @JsonKey(name: 'password') String password});
}

/// @nodoc
class _$AuthInfoDTOCopyWithImpl<$Res> implements $AuthInfoDTOCopyWith<$Res> {
  _$AuthInfoDTOCopyWithImpl(this._value, this._then);

  final AuthInfoDTO _value;
  // ignore: unused_field
  final $Res Function(AuthInfoDTO) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AuthInfoDTOCopyWith<$Res>
    implements $AuthInfoDTOCopyWith<$Res> {
  factory _$AuthInfoDTOCopyWith(
          _AuthInfoDTO value, $Res Function(_AuthInfoDTO) then) =
      __$AuthInfoDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'phone_number') String phoneNumber,
      @JsonKey(name: 'password') String password});
}

/// @nodoc
class __$AuthInfoDTOCopyWithImpl<$Res> extends _$AuthInfoDTOCopyWithImpl<$Res>
    implements _$AuthInfoDTOCopyWith<$Res> {
  __$AuthInfoDTOCopyWithImpl(
      _AuthInfoDTO _value, $Res Function(_AuthInfoDTO) _then)
      : super(_value, (v) => _then(v as _AuthInfoDTO));

  @override
  _AuthInfoDTO get _value => super._value as _AuthInfoDTO;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? password = freezed,
  }) {
    return _then(_AuthInfoDTO(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthInfoDTO extends _AuthInfoDTO {
  const _$_AuthInfoDTO(
      {@JsonKey(name: 'phone_number') required this.phoneNumber,
      @JsonKey(name: 'password') required this.password})
      : super._();

  factory _$_AuthInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AuthInfoDTOFromJson(json);

  @override

  /// Phone numberfor sending to server.
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override

  /// Password for sending to server.
  @JsonKey(name: 'password')
  final String password;

  @override
  String toString() {
    return 'AuthInfoDTO(phoneNumber: $phoneNumber, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthInfoDTO &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$AuthInfoDTOCopyWith<_AuthInfoDTO> get copyWith =>
      __$AuthInfoDTOCopyWithImpl<_AuthInfoDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthInfoDTOToJson(this);
  }
}

abstract class _AuthInfoDTO extends AuthInfoDTO {
  const factory _AuthInfoDTO(
      {@JsonKey(name: 'phone_number') required String phoneNumber,
      @JsonKey(name: 'password') required String password}) = _$_AuthInfoDTO;
  const _AuthInfoDTO._() : super._();

  factory _AuthInfoDTO.fromJson(Map<String, dynamic> json) =
      _$_AuthInfoDTO.fromJson;

  @override

  /// Phone numberfor sending to server.
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override

  /// Password for sending to server.
  @JsonKey(name: 'password')
  String get password;
  @override
  @JsonKey(ignore: true)
  _$AuthInfoDTOCopyWith<_AuthInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
