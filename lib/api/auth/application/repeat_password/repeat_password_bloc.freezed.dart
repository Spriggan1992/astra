// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repeat_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RepeatPasswordEventTearOff {
  const _$RepeatPasswordEventTearOff();

  _Initialized initialized(String phoneNumber, String confirmePassword) {
    return _Initialized(
      phoneNumber,
      confirmePassword,
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
const $RepeatPasswordEvent = _$RepeatPasswordEventTearOff();

/// @nodoc
mixin _$RepeatPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String confirmePassword)
        initialized,
    required TResult Function(String password) changedPassword,
    required TResult Function(String password) submittedPassword,
    required TResult Function() pressedButn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber, String confirmePassword)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String confirmePassword)? initialized,
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
abstract class $RepeatPasswordEventCopyWith<$Res> {
  factory $RepeatPasswordEventCopyWith(
          RepeatPasswordEvent value, $Res Function(RepeatPasswordEvent) then) =
      _$RepeatPasswordEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RepeatPasswordEventCopyWithImpl<$Res>
    implements $RepeatPasswordEventCopyWith<$Res> {
  _$RepeatPasswordEventCopyWithImpl(this._value, this._then);

  final RepeatPasswordEvent _value;
  // ignore: unused_field
  final $Res Function(RepeatPasswordEvent) _then;
}

/// @nodoc
abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(
          _Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
  $Res call({String phoneNumber, String confirmePassword});
}

/// @nodoc
class __$InitializedCopyWithImpl<$Res>
    extends _$RepeatPasswordEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(
      _Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? confirmePassword = freezed,
  }) {
    return _then(_Initialized(
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      confirmePassword == freezed
          ? _value.confirmePassword
          : confirmePassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(this.phoneNumber, this.confirmePassword);

  @override
  final String phoneNumber;
  @override
  final String confirmePassword;

  @override
  String toString() {
    return 'RepeatPasswordEvent.initialized(phoneNumber: $phoneNumber, confirmePassword: $confirmePassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initialized &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.confirmePassword, confirmePassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(confirmePassword));

  @JsonKey(ignore: true)
  @override
  _$InitializedCopyWith<_Initialized> get copyWith =>
      __$InitializedCopyWithImpl<_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String confirmePassword)
        initialized,
    required TResult Function(String password) changedPassword,
    required TResult Function(String password) submittedPassword,
    required TResult Function() pressedButn,
  }) {
    return initialized(phoneNumber, confirmePassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber, String confirmePassword)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
  }) {
    return initialized?.call(phoneNumber, confirmePassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String confirmePassword)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(phoneNumber, confirmePassword);
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

abstract class _Initialized implements RepeatPasswordEvent {
  const factory _Initialized(String phoneNumber, String confirmePassword) =
      _$_Initialized;

  String get phoneNumber;
  String get confirmePassword;
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
    extends _$RepeatPasswordEventCopyWithImpl<$Res>
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
    return 'RepeatPasswordEvent.changedPassword(password: $password)';
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
    required TResult Function(String phoneNumber, String confirmePassword)
        initialized,
    required TResult Function(String password) changedPassword,
    required TResult Function(String password) submittedPassword,
    required TResult Function() pressedButn,
  }) {
    return changedPassword(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber, String confirmePassword)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
  }) {
    return changedPassword?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String confirmePassword)? initialized,
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

abstract class _ChangedPassword implements RepeatPasswordEvent {
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
    extends _$RepeatPasswordEventCopyWithImpl<$Res>
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
    return 'RepeatPasswordEvent.submittedPassword(password: $password)';
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
    required TResult Function(String phoneNumber, String confirmePassword)
        initialized,
    required TResult Function(String password) changedPassword,
    required TResult Function(String password) submittedPassword,
    required TResult Function() pressedButn,
  }) {
    return submittedPassword(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber, String confirmePassword)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
  }) {
    return submittedPassword?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String confirmePassword)? initialized,
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

abstract class _SubmittedPassword implements RepeatPasswordEvent {
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
class __$PressedButnCopyWithImpl<$Res>
    extends _$RepeatPasswordEventCopyWithImpl<$Res>
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
    return 'RepeatPasswordEvent.pressedButn()';
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
    required TResult Function(String phoneNumber, String confirmePassword)
        initialized,
    required TResult Function(String password) changedPassword,
    required TResult Function(String password) submittedPassword,
    required TResult Function() pressedButn,
  }) {
    return pressedButn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber, String confirmePassword)? initialized,
    TResult Function(String password)? changedPassword,
    TResult Function(String password)? submittedPassword,
    TResult Function()? pressedButn,
  }) {
    return pressedButn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String confirmePassword)? initialized,
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

abstract class _PressedButn implements RepeatPasswordEvent {
  const factory _PressedButn() = _$_PressedButn;
}

/// @nodoc
class _$RepeatPasswordStateTearOff {
  const _$RepeatPasswordStateTearOff();

  _RepeatPasswordState call(
      {required String phoneNumber,
      required String confirmePassword,
      required bool isEnableBtn,
      required bool isShowError,
      required bool isSuccessfullySubmitted}) {
    return _RepeatPasswordState(
      phoneNumber: phoneNumber,
      confirmePassword: confirmePassword,
      isEnableBtn: isEnableBtn,
      isShowError: isShowError,
      isSuccessfullySubmitted: isSuccessfullySubmitted,
    );
  }
}

/// @nodoc
const $RepeatPasswordState = _$RepeatPasswordStateTearOff();

/// @nodoc
mixin _$RepeatPasswordState {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get confirmePassword => throw _privateConstructorUsedError;
  bool get isEnableBtn => throw _privateConstructorUsedError;
  bool get isShowError => throw _privateConstructorUsedError;
  bool get isSuccessfullySubmitted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepeatPasswordStateCopyWith<RepeatPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepeatPasswordStateCopyWith<$Res> {
  factory $RepeatPasswordStateCopyWith(
          RepeatPasswordState value, $Res Function(RepeatPasswordState) then) =
      _$RepeatPasswordStateCopyWithImpl<$Res>;
  $Res call(
      {String phoneNumber,
      String confirmePassword,
      bool isEnableBtn,
      bool isShowError,
      bool isSuccessfullySubmitted});
}

/// @nodoc
class _$RepeatPasswordStateCopyWithImpl<$Res>
    implements $RepeatPasswordStateCopyWith<$Res> {
  _$RepeatPasswordStateCopyWithImpl(this._value, this._then);

  final RepeatPasswordState _value;
  // ignore: unused_field
  final $Res Function(RepeatPasswordState) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? confirmePassword = freezed,
    Object? isEnableBtn = freezed,
    Object? isShowError = freezed,
    Object? isSuccessfullySubmitted = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      confirmePassword: confirmePassword == freezed
          ? _value.confirmePassword
          : confirmePassword // ignore: cast_nullable_to_non_nullable
              as String,
      isEnableBtn: isEnableBtn == freezed
          ? _value.isEnableBtn
          : isEnableBtn // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowError: isShowError == freezed
          ? _value.isShowError
          : isShowError // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessfullySubmitted: isSuccessfullySubmitted == freezed
          ? _value.isSuccessfullySubmitted
          : isSuccessfullySubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RepeatPasswordStateCopyWith<$Res>
    implements $RepeatPasswordStateCopyWith<$Res> {
  factory _$RepeatPasswordStateCopyWith(_RepeatPasswordState value,
          $Res Function(_RepeatPasswordState) then) =
      __$RepeatPasswordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String phoneNumber,
      String confirmePassword,
      bool isEnableBtn,
      bool isShowError,
      bool isSuccessfullySubmitted});
}

/// @nodoc
class __$RepeatPasswordStateCopyWithImpl<$Res>
    extends _$RepeatPasswordStateCopyWithImpl<$Res>
    implements _$RepeatPasswordStateCopyWith<$Res> {
  __$RepeatPasswordStateCopyWithImpl(
      _RepeatPasswordState _value, $Res Function(_RepeatPasswordState) _then)
      : super(_value, (v) => _then(v as _RepeatPasswordState));

  @override
  _RepeatPasswordState get _value => super._value as _RepeatPasswordState;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? confirmePassword = freezed,
    Object? isEnableBtn = freezed,
    Object? isShowError = freezed,
    Object? isSuccessfullySubmitted = freezed,
  }) {
    return _then(_RepeatPasswordState(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      confirmePassword: confirmePassword == freezed
          ? _value.confirmePassword
          : confirmePassword // ignore: cast_nullable_to_non_nullable
              as String,
      isEnableBtn: isEnableBtn == freezed
          ? _value.isEnableBtn
          : isEnableBtn // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowError: isShowError == freezed
          ? _value.isShowError
          : isShowError // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessfullySubmitted: isSuccessfullySubmitted == freezed
          ? _value.isSuccessfullySubmitted
          : isSuccessfullySubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RepeatPasswordState implements _RepeatPasswordState {
  const _$_RepeatPasswordState(
      {required this.phoneNumber,
      required this.confirmePassword,
      required this.isEnableBtn,
      required this.isShowError,
      required this.isSuccessfullySubmitted});

  @override
  final String phoneNumber;
  @override
  final String confirmePassword;
  @override
  final bool isEnableBtn;
  @override
  final bool isShowError;
  @override
  final bool isSuccessfullySubmitted;

  @override
  String toString() {
    return 'RepeatPasswordState(phoneNumber: $phoneNumber, confirmePassword: $confirmePassword, isEnableBtn: $isEnableBtn, isShowError: $isShowError, isSuccessfullySubmitted: $isSuccessfullySubmitted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeatPasswordState &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.confirmePassword, confirmePassword) &&
            const DeepCollectionEquality()
                .equals(other.isEnableBtn, isEnableBtn) &&
            const DeepCollectionEquality()
                .equals(other.isShowError, isShowError) &&
            const DeepCollectionEquality().equals(
                other.isSuccessfullySubmitted, isSuccessfullySubmitted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(confirmePassword),
      const DeepCollectionEquality().hash(isEnableBtn),
      const DeepCollectionEquality().hash(isShowError),
      const DeepCollectionEquality().hash(isSuccessfullySubmitted));

  @JsonKey(ignore: true)
  @override
  _$RepeatPasswordStateCopyWith<_RepeatPasswordState> get copyWith =>
      __$RepeatPasswordStateCopyWithImpl<_RepeatPasswordState>(
          this, _$identity);
}

abstract class _RepeatPasswordState implements RepeatPasswordState {
  const factory _RepeatPasswordState(
      {required String phoneNumber,
      required String confirmePassword,
      required bool isEnableBtn,
      required bool isShowError,
      required bool isSuccessfullySubmitted}) = _$_RepeatPasswordState;

  @override
  String get phoneNumber;
  @override
  String get confirmePassword;
  @override
  bool get isEnableBtn;
  @override
  bool get isShowError;
  @override
  bool get isSuccessfullySubmitted;
  @override
  @JsonKey(ignore: true)
  _$RepeatPasswordStateCopyWith<_RepeatPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
