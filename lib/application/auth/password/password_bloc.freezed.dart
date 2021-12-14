// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PasswordEventTearOff {
  const _$PasswordEventTearOff();

  _Initialized initialized(String phoneNumber, String? code) {
    return _Initialized(
      phoneNumber,
      code,
    );
  }

  _ChangedPassword changedPassword(String password) {
    return _ChangedPassword(
      password,
    );
  }

  _SubmittedPassword submittedPassword(String password) {
    return _SubmittedPassword(
      password,
    );
  }

  _PressedButn pressedButn() {
    return const _PressedButn();
  }
}

/// @nodoc
const $PasswordEvent = _$PasswordEventTearOff();

/// @nodoc
mixin _$PasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String? code) initialized,
    required TResult Function(String password) changedPassword,
    required TResult Function(String password) submittedPassword,
    required TResult Function() pressedButn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber, String? code)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String? code)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ChangedPassword value) changedPassword,
    required TResult Function(_SubmittedPassword value) submittedPassword,
    required TResult Function(_PressedButn value) pressedButn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangedPassword value)? changedPassword,
    TResult Function(_SubmittedPassword value)? submittedPassword,
    TResult Function(_PressedButn value)? pressedButn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangedPassword value)? changedPassword,
    TResult Function(_SubmittedPassword value)? submittedPassword,
    TResult Function(_PressedButn value)? pressedButn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordEventCopyWith<$Res> {
  factory $PasswordEventCopyWith(
          PasswordEvent value, $Res Function(PasswordEvent) then) =
      _$PasswordEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasswordEventCopyWithImpl<$Res>
    implements $PasswordEventCopyWith<$Res> {
  _$PasswordEventCopyWithImpl(this._value, this._then);

  final PasswordEvent _value;
  // ignore: unused_field
  final $Res Function(PasswordEvent) _then;
}

/// @nodoc
abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(
          _Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
  $Res call({String phoneNumber, String? code});
}

/// @nodoc
class __$InitializedCopyWithImpl<$Res> extends _$PasswordEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(
      _Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? code = freezed,
  }) {
    return _then(_Initialized(
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(this.phoneNumber, this.code);

  @override
  final String phoneNumber;
  @override
  final String? code;

  @override
  String toString() {
    return 'PasswordEvent.initialized(phoneNumber: $phoneNumber, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initialized &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$InitializedCopyWith<_Initialized> get copyWith =>
      __$InitializedCopyWithImpl<_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String? code) initialized,
    required TResult Function(String password) changedPassword,
    required TResult Function(String password) submittedPassword,
    required TResult Function() pressedButn,
  }) {
    return initialized(phoneNumber, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber, String? code)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
  }) {
    return initialized?.call(phoneNumber, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String? code)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(phoneNumber, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ChangedPassword value) changedPassword,
    required TResult Function(_SubmittedPassword value) submittedPassword,
    required TResult Function(_PressedButn value) pressedButn,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangedPassword value)? changedPassword,
    TResult Function(_SubmittedPassword value)? submittedPassword,
    TResult Function(_PressedButn value)? pressedButn,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangedPassword value)? changedPassword,
    TResult Function(_SubmittedPassword value)? submittedPassword,
    TResult Function(_PressedButn value)? pressedButn,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements PasswordEvent {
  const factory _Initialized(String phoneNumber, String? code) = _$_Initialized;

  String get phoneNumber;
  String? get code;
  @JsonKey(ignore: true)
  _$InitializedCopyWith<_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ChangedPasswordCopyWith<$Res> {
  factory _$ChangedPasswordCopyWith(
          _ChangedPassword value, $Res Function(_ChangedPassword) then) =
      __$ChangedPasswordCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class __$ChangedPasswordCopyWithImpl<$Res>
    extends _$PasswordEventCopyWithImpl<$Res>
    implements _$ChangedPasswordCopyWith<$Res> {
  __$ChangedPasswordCopyWithImpl(
      _ChangedPassword _value, $Res Function(_ChangedPassword) _then)
      : super(_value, (v) => _then(v as _ChangedPassword));

  @override
  _ChangedPassword get _value => super._value as _ChangedPassword;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(_ChangedPassword(
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangedPassword implements _ChangedPassword {
  const _$_ChangedPassword(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'PasswordEvent.changedPassword(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangedPassword &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$ChangedPasswordCopyWith<_ChangedPassword> get copyWith =>
      __$ChangedPasswordCopyWithImpl<_ChangedPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String? code) initialized,
    required TResult Function(String password) changedPassword,
    required TResult Function(String password) submittedPassword,
    required TResult Function() pressedButn,
  }) {
    return changedPassword(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber, String? code)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
  }) {
    return changedPassword?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String? code)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
    required TResult orElse(),
  }) {
    if (changedPassword != null) {
      return changedPassword(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ChangedPassword value) changedPassword,
    required TResult Function(_SubmittedPassword value) submittedPassword,
    required TResult Function(_PressedButn value) pressedButn,
  }) {
    return changedPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangedPassword value)? changedPassword,
    TResult Function(_SubmittedPassword value)? submittedPassword,
    TResult Function(_PressedButn value)? pressedButn,
  }) {
    return changedPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangedPassword value)? changedPassword,
    TResult Function(_SubmittedPassword value)? submittedPassword,
    TResult Function(_PressedButn value)? pressedButn,
    required TResult orElse(),
  }) {
    if (changedPassword != null) {
      return changedPassword(this);
    }
    return orElse();
  }
}

abstract class _ChangedPassword implements PasswordEvent {
  const factory _ChangedPassword(String password) = _$_ChangedPassword;

  String get password;
  @JsonKey(ignore: true)
  _$ChangedPasswordCopyWith<_ChangedPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SubmittedPasswordCopyWith<$Res> {
  factory _$SubmittedPasswordCopyWith(
          _SubmittedPassword value, $Res Function(_SubmittedPassword) then) =
      __$SubmittedPasswordCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class __$SubmittedPasswordCopyWithImpl<$Res>
    extends _$PasswordEventCopyWithImpl<$Res>
    implements _$SubmittedPasswordCopyWith<$Res> {
  __$SubmittedPasswordCopyWithImpl(
      _SubmittedPassword _value, $Res Function(_SubmittedPassword) _then)
      : super(_value, (v) => _then(v as _SubmittedPassword));

  @override
  _SubmittedPassword get _value => super._value as _SubmittedPassword;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(_SubmittedPassword(
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SubmittedPassword implements _SubmittedPassword {
  const _$_SubmittedPassword(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'PasswordEvent.submittedPassword(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubmittedPassword &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$SubmittedPasswordCopyWith<_SubmittedPassword> get copyWith =>
      __$SubmittedPasswordCopyWithImpl<_SubmittedPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String? code) initialized,
    required TResult Function(String password) changedPassword,
    required TResult Function(String password) submittedPassword,
    required TResult Function() pressedButn,
  }) {
    return submittedPassword(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber, String? code)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
  }) {
    return submittedPassword?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String? code)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
    required TResult orElse(),
  }) {
    if (submittedPassword != null) {
      return submittedPassword(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ChangedPassword value) changedPassword,
    required TResult Function(_SubmittedPassword value) submittedPassword,
    required TResult Function(_PressedButn value) pressedButn,
  }) {
    return submittedPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangedPassword value)? changedPassword,
    TResult Function(_SubmittedPassword value)? submittedPassword,
    TResult Function(_PressedButn value)? pressedButn,
  }) {
    return submittedPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangedPassword value)? changedPassword,
    TResult Function(_SubmittedPassword value)? submittedPassword,
    TResult Function(_PressedButn value)? pressedButn,
    required TResult orElse(),
  }) {
    if (submittedPassword != null) {
      return submittedPassword(this);
    }
    return orElse();
  }
}

abstract class _SubmittedPassword implements PasswordEvent {
  const factory _SubmittedPassword(String password) = _$_SubmittedPassword;

  String get password;
  @JsonKey(ignore: true)
  _$SubmittedPasswordCopyWith<_SubmittedPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PressedButnCopyWith<$Res> {
  factory _$PressedButnCopyWith(
          _PressedButn value, $Res Function(_PressedButn) then) =
      __$PressedButnCopyWithImpl<$Res>;
}

/// @nodoc
class __$PressedButnCopyWithImpl<$Res> extends _$PasswordEventCopyWithImpl<$Res>
    implements _$PressedButnCopyWith<$Res> {
  __$PressedButnCopyWithImpl(
      _PressedButn _value, $Res Function(_PressedButn) _then)
      : super(_value, (v) => _then(v as _PressedButn));

  @override
  _PressedButn get _value => super._value as _PressedButn;
}

/// @nodoc

class _$_PressedButn implements _PressedButn {
  const _$_PressedButn();

  @override
  String toString() {
    return 'PasswordEvent.pressedButn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PressedButn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String? code) initialized,
    required TResult Function(String password) changedPassword,
    required TResult Function(String password) submittedPassword,
    required TResult Function() pressedButn,
  }) {
    return pressedButn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber, String? code)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
  }) {
    return pressedButn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String? code)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
    required TResult orElse(),
  }) {
    if (pressedButn != null) {
      return pressedButn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ChangedPassword value) changedPassword,
    required TResult Function(_SubmittedPassword value) submittedPassword,
    required TResult Function(_PressedButn value) pressedButn,
  }) {
    return pressedButn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangedPassword value)? changedPassword,
    TResult Function(_SubmittedPassword value)? submittedPassword,
    TResult Function(_PressedButn value)? pressedButn,
  }) {
    return pressedButn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangedPassword value)? changedPassword,
    TResult Function(_SubmittedPassword value)? submittedPassword,
    TResult Function(_PressedButn value)? pressedButn,
    required TResult orElse(),
  }) {
    if (pressedButn != null) {
      return pressedButn(this);
    }
    return orElse();
  }
}

abstract class _PressedButn implements PasswordEvent {
  const factory _PressedButn() = _$_PressedButn;
}

/// @nodoc
class _$PasswordStateTearOff {
  const _$PasswordStateTearOff();

  _PasswordState call(
      {required String phoneNumber,
      required String password,
      required bool isEnableBtn,
      required bool isShowError,
      required bool isSignIn,
      required AuthInfo authInfo,
      required bool isSuseccfullySignIn,
      required bool redirectToConfirmePassword,
      String? code}) {
    return _PasswordState(
      phoneNumber: phoneNumber,
      password: password,
      isEnableBtn: isEnableBtn,
      isShowError: isShowError,
      isSignIn: isSignIn,
      authInfo: authInfo,
      isSuseccfullySignIn: isSuseccfullySignIn,
      redirectToConfirmePassword: redirectToConfirmePassword,
      code: code,
    );
  }
}

/// @nodoc
const $PasswordState = _$PasswordStateTearOff();

/// @nodoc
mixin _$PasswordState {
  /// Input phone number.
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Input password
  String get password => throw _privateConstructorUsedError;

  /// A flag that responsible for enable/disable button.
  bool get isEnableBtn => throw _privateConstructorUsedError;

  /// A flag that responsible for displaying error message.
  bool get isShowError => throw _privateConstructorUsedError;

  /// A flag responsible for condition if user already was signed in system or not.
  bool get isSignIn => throw _privateConstructorUsedError;

  /// Authorization information.
  AuthInfo get authInfo => throw _privateConstructorUsedError;

  /// A flag that responsible that user successfully signed in.
  bool get isSuseccfullySignIn => throw _privateConstructorUsedError;

  /// A flag that responsible for redirect to [ConfirmPasswordScreen].
  bool get redirectToConfirmePassword => throw _privateConstructorUsedError;

  /// Sms code.
  ///
  /// Can be [null], if the user already had been registered before.
  String? get code => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordStateCopyWith<PasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordStateCopyWith<$Res> {
  factory $PasswordStateCopyWith(
          PasswordState value, $Res Function(PasswordState) then) =
      _$PasswordStateCopyWithImpl<$Res>;
  $Res call(
      {String phoneNumber,
      String password,
      bool isEnableBtn,
      bool isShowError,
      bool isSignIn,
      AuthInfo authInfo,
      bool isSuseccfullySignIn,
      bool redirectToConfirmePassword,
      String? code});

  $AuthInfoCopyWith<$Res> get authInfo;
}

/// @nodoc
class _$PasswordStateCopyWithImpl<$Res>
    implements $PasswordStateCopyWith<$Res> {
  _$PasswordStateCopyWithImpl(this._value, this._then);

  final PasswordState _value;
  // ignore: unused_field
  final $Res Function(PasswordState) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? isEnableBtn = freezed,
    Object? isShowError = freezed,
    Object? isSignIn = freezed,
    Object? authInfo = freezed,
    Object? isSuseccfullySignIn = freezed,
    Object? redirectToConfirmePassword = freezed,
    Object? code = freezed,
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
      isEnableBtn: isEnableBtn == freezed
          ? _value.isEnableBtn
          : isEnableBtn // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowError: isShowError == freezed
          ? _value.isShowError
          : isShowError // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignIn: isSignIn == freezed
          ? _value.isSignIn
          : isSignIn // ignore: cast_nullable_to_non_nullable
              as bool,
      authInfo: authInfo == freezed
          ? _value.authInfo
          : authInfo // ignore: cast_nullable_to_non_nullable
              as AuthInfo,
      isSuseccfullySignIn: isSuseccfullySignIn == freezed
          ? _value.isSuseccfullySignIn
          : isSuseccfullySignIn // ignore: cast_nullable_to_non_nullable
              as bool,
      redirectToConfirmePassword: redirectToConfirmePassword == freezed
          ? _value.redirectToConfirmePassword
          : redirectToConfirmePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $AuthInfoCopyWith<$Res> get authInfo {
    return $AuthInfoCopyWith<$Res>(_value.authInfo, (value) {
      return _then(_value.copyWith(authInfo: value));
    });
  }
}

/// @nodoc
abstract class _$PasswordStateCopyWith<$Res>
    implements $PasswordStateCopyWith<$Res> {
  factory _$PasswordStateCopyWith(
          _PasswordState value, $Res Function(_PasswordState) then) =
      __$PasswordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String phoneNumber,
      String password,
      bool isEnableBtn,
      bool isShowError,
      bool isSignIn,
      AuthInfo authInfo,
      bool isSuseccfullySignIn,
      bool redirectToConfirmePassword,
      String? code});

  @override
  $AuthInfoCopyWith<$Res> get authInfo;
}

/// @nodoc
class __$PasswordStateCopyWithImpl<$Res>
    extends _$PasswordStateCopyWithImpl<$Res>
    implements _$PasswordStateCopyWith<$Res> {
  __$PasswordStateCopyWithImpl(
      _PasswordState _value, $Res Function(_PasswordState) _then)
      : super(_value, (v) => _then(v as _PasswordState));

  @override
  _PasswordState get _value => super._value as _PasswordState;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? isEnableBtn = freezed,
    Object? isShowError = freezed,
    Object? isSignIn = freezed,
    Object? authInfo = freezed,
    Object? isSuseccfullySignIn = freezed,
    Object? redirectToConfirmePassword = freezed,
    Object? code = freezed,
  }) {
    return _then(_PasswordState(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isEnableBtn: isEnableBtn == freezed
          ? _value.isEnableBtn
          : isEnableBtn // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowError: isShowError == freezed
          ? _value.isShowError
          : isShowError // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignIn: isSignIn == freezed
          ? _value.isSignIn
          : isSignIn // ignore: cast_nullable_to_non_nullable
              as bool,
      authInfo: authInfo == freezed
          ? _value.authInfo
          : authInfo // ignore: cast_nullable_to_non_nullable
              as AuthInfo,
      isSuseccfullySignIn: isSuseccfullySignIn == freezed
          ? _value.isSuseccfullySignIn
          : isSuseccfullySignIn // ignore: cast_nullable_to_non_nullable
              as bool,
      redirectToConfirmePassword: redirectToConfirmePassword == freezed
          ? _value.redirectToConfirmePassword
          : redirectToConfirmePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PasswordState implements _PasswordState {
  const _$_PasswordState(
      {required this.phoneNumber,
      required this.password,
      required this.isEnableBtn,
      required this.isShowError,
      required this.isSignIn,
      required this.authInfo,
      required this.isSuseccfullySignIn,
      required this.redirectToConfirmePassword,
      this.code});

  @override

  /// Input phone number.
  final String phoneNumber;
  @override

  /// Input password
  final String password;
  @override

  /// A flag that responsible for enable/disable button.
  final bool isEnableBtn;
  @override

  /// A flag that responsible for displaying error message.
  final bool isShowError;
  @override

  /// A flag responsible for condition if user already was signed in system or not.
  final bool isSignIn;
  @override

  /// Authorization information.
  final AuthInfo authInfo;
  @override

  /// A flag that responsible that user successfully signed in.
  final bool isSuseccfullySignIn;
  @override

  /// A flag that responsible for redirect to [ConfirmPasswordScreen].
  final bool redirectToConfirmePassword;
  @override

  /// Sms code.
  ///
  /// Can be [null], if the user already had been registered before.
  final String? code;

  @override
  String toString() {
    return 'PasswordState(phoneNumber: $phoneNumber, password: $password, isEnableBtn: $isEnableBtn, isShowError: $isShowError, isSignIn: $isSignIn, authInfo: $authInfo, isSuseccfullySignIn: $isSuseccfullySignIn, redirectToConfirmePassword: $redirectToConfirmePassword, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PasswordState &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.isEnableBtn, isEnableBtn) &&
            const DeepCollectionEquality()
                .equals(other.isShowError, isShowError) &&
            const DeepCollectionEquality().equals(other.isSignIn, isSignIn) &&
            const DeepCollectionEquality().equals(other.authInfo, authInfo) &&
            const DeepCollectionEquality()
                .equals(other.isSuseccfullySignIn, isSuseccfullySignIn) &&
            const DeepCollectionEquality().equals(
                other.redirectToConfirmePassword, redirectToConfirmePassword) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(isEnableBtn),
      const DeepCollectionEquality().hash(isShowError),
      const DeepCollectionEquality().hash(isSignIn),
      const DeepCollectionEquality().hash(authInfo),
      const DeepCollectionEquality().hash(isSuseccfullySignIn),
      const DeepCollectionEquality().hash(redirectToConfirmePassword),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$PasswordStateCopyWith<_PasswordState> get copyWith =>
      __$PasswordStateCopyWithImpl<_PasswordState>(this, _$identity);
}

abstract class _PasswordState implements PasswordState {
  const factory _PasswordState(
      {required String phoneNumber,
      required String password,
      required bool isEnableBtn,
      required bool isShowError,
      required bool isSignIn,
      required AuthInfo authInfo,
      required bool isSuseccfullySignIn,
      required bool redirectToConfirmePassword,
      String? code}) = _$_PasswordState;

  @override

  /// Input phone number.
  String get phoneNumber;
  @override

  /// Input password
  String get password;
  @override

  /// A flag that responsible for enable/disable button.
  bool get isEnableBtn;
  @override

  /// A flag that responsible for displaying error message.
  bool get isShowError;
  @override

  /// A flag responsible for condition if user already was signed in system or not.
  bool get isSignIn;
  @override

  /// Authorization information.
  AuthInfo get authInfo;
  @override

  /// A flag that responsible that user successfully signed in.
  bool get isSuseccfullySignIn;
  @override

  /// A flag that responsible for redirect to [ConfirmPasswordScreen].
  bool get redirectToConfirmePassword;
  @override

  /// Sms code.
  ///
  /// Can be [null], if the user already had been registered before.
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$PasswordStateCopyWith<_PasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
