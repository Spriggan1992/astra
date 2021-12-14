// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthInfoTearOff {
  const _$AuthInfoTearOff();

  _AuthInfo call(
      {required String phoneNumber,
      required String password,
      required bool isSignIn}) {
    return _AuthInfo(
      phoneNumber: phoneNumber,
      password: password,
      isSignIn: isSignIn,
    );
  }
}

/// @nodoc
const $AuthInfo = _$AuthInfoTearOff();

/// @nodoc
mixin _$AuthInfo {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError; // Temp property.
  bool get isSignIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthInfoCopyWith<AuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthInfoCopyWith<$Res> {
  factory $AuthInfoCopyWith(AuthInfo value, $Res Function(AuthInfo) then) =
      _$AuthInfoCopyWithImpl<$Res>;
  $Res call({String phoneNumber, String password, bool isSignIn});
}

/// @nodoc
class _$AuthInfoCopyWithImpl<$Res> implements $AuthInfoCopyWith<$Res> {
  _$AuthInfoCopyWithImpl(this._value, this._then);

  final AuthInfo _value;
  // ignore: unused_field
  final $Res Function(AuthInfo) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? isSignIn = freezed,
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
      isSignIn: isSignIn == freezed
          ? _value.isSignIn
          : isSignIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AuthInfoCopyWith<$Res> implements $AuthInfoCopyWith<$Res> {
  factory _$AuthInfoCopyWith(_AuthInfo value, $Res Function(_AuthInfo) then) =
      __$AuthInfoCopyWithImpl<$Res>;
  @override
  $Res call({String phoneNumber, String password, bool isSignIn});
}

/// @nodoc
class __$AuthInfoCopyWithImpl<$Res> extends _$AuthInfoCopyWithImpl<$Res>
    implements _$AuthInfoCopyWith<$Res> {
  __$AuthInfoCopyWithImpl(_AuthInfo _value, $Res Function(_AuthInfo) _then)
      : super(_value, (v) => _then(v as _AuthInfo));

  @override
  _AuthInfo get _value => super._value as _AuthInfo;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? isSignIn = freezed,
  }) {
    return _then(_AuthInfo(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isSignIn: isSignIn == freezed
          ? _value.isSignIn
          : isSignIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthInfo extends _AuthInfo {
  const _$_AuthInfo(
      {required this.phoneNumber,
      required this.password,
      required this.isSignIn})
      : super._();

  @override
  final String phoneNumber;
  @override
  final String password;
  @override // Temp property.
  final bool isSignIn;

  @override
  String toString() {
    return 'AuthInfo(phoneNumber: $phoneNumber, password: $password, isSignIn: $isSignIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthInfo &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.isSignIn, isSignIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(isSignIn));

  @JsonKey(ignore: true)
  @override
  _$AuthInfoCopyWith<_AuthInfo> get copyWith =>
      __$AuthInfoCopyWithImpl<_AuthInfo>(this, _$identity);
}

abstract class _AuthInfo extends AuthInfo {
  const factory _AuthInfo(
      {required String phoneNumber,
      required String password,
      required bool isSignIn}) = _$_AuthInfo;
  const _AuthInfo._() : super._();

  @override
  String get phoneNumber;
  @override
  String get password;
  @override // Temp property.
  bool get isSignIn;
  @override
  @JsonKey(ignore: true)
  _$AuthInfoCopyWith<_AuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
