// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'code_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CodeEventTearOff {
  const _$CodeEventTearOff();

  _Initialized initialized(String phoneNumber) {
    return _Initialized(
      phoneNumber,
    );
  }

  _ChangeCodeValue changeCodeValue(String code) {
    return _ChangeCodeValue(
      code,
    );
  }

  _OnSubmitCode onSubmitCode(String code) {
    return _OnSubmitCode(
      code,
    );
  }
}

/// @nodoc
const $CodeEvent = _$CodeEventTearOff();

/// @nodoc
mixin _$CodeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) initialized,
    required TResult Function(String code) changeCodeValue,
    required TResult Function(String code) onSubmitCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? initialized,
    TResult Function(String code)? changeCodeValue,
    TResult Function(String code)? onSubmitCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? initialized,
    TResult Function(String code)? changeCodeValue,
    TResult Function(String code)? onSubmitCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ChangeCodeValue value) changeCodeValue,
    required TResult Function(_OnSubmitCode value) onSubmitCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangeCodeValue value)? changeCodeValue,
    TResult Function(_OnSubmitCode value)? onSubmitCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangeCodeValue value)? changeCodeValue,
    TResult Function(_OnSubmitCode value)? onSubmitCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeEventCopyWith<$Res> {
  factory $CodeEventCopyWith(CodeEvent value, $Res Function(CodeEvent) then) =
      _$CodeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CodeEventCopyWithImpl<$Res> implements $CodeEventCopyWith<$Res> {
  _$CodeEventCopyWithImpl(this._value, this._then);

  final CodeEvent _value;
  // ignore: unused_field
  final $Res Function(CodeEvent) _then;
}

/// @nodoc
abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(
          _Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
  $Res call({String phoneNumber});
}

/// @nodoc
class __$InitializedCopyWithImpl<$Res> extends _$CodeEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(
      _Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_Initialized(
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'CodeEvent.initialized(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initialized &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(phoneNumber));

  @JsonKey(ignore: true)
  @override
  _$InitializedCopyWith<_Initialized> get copyWith =>
      __$InitializedCopyWithImpl<_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) initialized,
    required TResult Function(String code) changeCodeValue,
    required TResult Function(String code) onSubmitCode,
  }) {
    return initialized(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? initialized,
    TResult Function(String code)? changeCodeValue,
    TResult Function(String code)? onSubmitCode,
  }) {
    return initialized?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? initialized,
    TResult Function(String code)? changeCodeValue,
    TResult Function(String code)? onSubmitCode,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ChangeCodeValue value) changeCodeValue,
    required TResult Function(_OnSubmitCode value) onSubmitCode,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangeCodeValue value)? changeCodeValue,
    TResult Function(_OnSubmitCode value)? onSubmitCode,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangeCodeValue value)? changeCodeValue,
    TResult Function(_OnSubmitCode value)? onSubmitCode,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements CodeEvent {
  const factory _Initialized(String phoneNumber) = _$_Initialized;

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$InitializedCopyWith<_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ChangeCodeValueCopyWith<$Res> {
  factory _$ChangeCodeValueCopyWith(
          _ChangeCodeValue value, $Res Function(_ChangeCodeValue) then) =
      __$ChangeCodeValueCopyWithImpl<$Res>;
  $Res call({String code});
}

/// @nodoc
class __$ChangeCodeValueCopyWithImpl<$Res> extends _$CodeEventCopyWithImpl<$Res>
    implements _$ChangeCodeValueCopyWith<$Res> {
  __$ChangeCodeValueCopyWithImpl(
      _ChangeCodeValue _value, $Res Function(_ChangeCodeValue) _then)
      : super(_value, (v) => _then(v as _ChangeCodeValue));

  @override
  _ChangeCodeValue get _value => super._value as _ChangeCodeValue;

  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_ChangeCodeValue(
      code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeCodeValue implements _ChangeCodeValue {
  const _$_ChangeCodeValue(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'CodeEvent.changeCodeValue(code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeCodeValue &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$ChangeCodeValueCopyWith<_ChangeCodeValue> get copyWith =>
      __$ChangeCodeValueCopyWithImpl<_ChangeCodeValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) initialized,
    required TResult Function(String code) changeCodeValue,
    required TResult Function(String code) onSubmitCode,
  }) {
    return changeCodeValue(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? initialized,
    TResult Function(String code)? changeCodeValue,
    TResult Function(String code)? onSubmitCode,
  }) {
    return changeCodeValue?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? initialized,
    TResult Function(String code)? changeCodeValue,
    TResult Function(String code)? onSubmitCode,
    required TResult orElse(),
  }) {
    if (changeCodeValue != null) {
      return changeCodeValue(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ChangeCodeValue value) changeCodeValue,
    required TResult Function(_OnSubmitCode value) onSubmitCode,
  }) {
    return changeCodeValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangeCodeValue value)? changeCodeValue,
    TResult Function(_OnSubmitCode value)? onSubmitCode,
  }) {
    return changeCodeValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangeCodeValue value)? changeCodeValue,
    TResult Function(_OnSubmitCode value)? onSubmitCode,
    required TResult orElse(),
  }) {
    if (changeCodeValue != null) {
      return changeCodeValue(this);
    }
    return orElse();
  }
}

abstract class _ChangeCodeValue implements CodeEvent {
  const factory _ChangeCodeValue(String code) = _$_ChangeCodeValue;

  String get code;
  @JsonKey(ignore: true)
  _$ChangeCodeValueCopyWith<_ChangeCodeValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnSubmitCodeCopyWith<$Res> {
  factory _$OnSubmitCodeCopyWith(
          _OnSubmitCode value, $Res Function(_OnSubmitCode) then) =
      __$OnSubmitCodeCopyWithImpl<$Res>;
  $Res call({String code});
}

/// @nodoc
class __$OnSubmitCodeCopyWithImpl<$Res> extends _$CodeEventCopyWithImpl<$Res>
    implements _$OnSubmitCodeCopyWith<$Res> {
  __$OnSubmitCodeCopyWithImpl(
      _OnSubmitCode _value, $Res Function(_OnSubmitCode) _then)
      : super(_value, (v) => _then(v as _OnSubmitCode));

  @override
  _OnSubmitCode get _value => super._value as _OnSubmitCode;

  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_OnSubmitCode(
      code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnSubmitCode implements _OnSubmitCode {
  const _$_OnSubmitCode(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'CodeEvent.onSubmitCode(code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnSubmitCode &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$OnSubmitCodeCopyWith<_OnSubmitCode> get copyWith =>
      __$OnSubmitCodeCopyWithImpl<_OnSubmitCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) initialized,
    required TResult Function(String code) changeCodeValue,
    required TResult Function(String code) onSubmitCode,
  }) {
    return onSubmitCode(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? initialized,
    TResult Function(String code)? changeCodeValue,
    TResult Function(String code)? onSubmitCode,
  }) {
    return onSubmitCode?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? initialized,
    TResult Function(String code)? changeCodeValue,
    TResult Function(String code)? onSubmitCode,
    required TResult orElse(),
  }) {
    if (onSubmitCode != null) {
      return onSubmitCode(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ChangeCodeValue value) changeCodeValue,
    required TResult Function(_OnSubmitCode value) onSubmitCode,
  }) {
    return onSubmitCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangeCodeValue value)? changeCodeValue,
    TResult Function(_OnSubmitCode value)? onSubmitCode,
  }) {
    return onSubmitCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ChangeCodeValue value)? changeCodeValue,
    TResult Function(_OnSubmitCode value)? onSubmitCode,
    required TResult orElse(),
  }) {
    if (onSubmitCode != null) {
      return onSubmitCode(this);
    }
    return orElse();
  }
}

abstract class _OnSubmitCode implements CodeEvent {
  const factory _OnSubmitCode(String code) = _$_OnSubmitCode;

  String get code;
  @JsonKey(ignore: true)
  _$OnSubmitCodeCopyWith<_OnSubmitCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CodeStateTearOff {
  const _$CodeStateTearOff();

  _CodeState call(
      {required String phoneNumber,
      required String code,
      required String validatedCode,
      required bool isShowErrorMessage,
      required bool isEnableBtn,
      required bool isValid}) {
    return _CodeState(
      phoneNumber: phoneNumber,
      code: code,
      validatedCode: validatedCode,
      isShowErrorMessage: isShowErrorMessage,
      isEnableBtn: isEnableBtn,
      isValid: isValid,
    );
  }
}

/// @nodoc
const $CodeState = _$CodeStateTearOff();

/// @nodoc
mixin _$CodeState {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get validatedCode => throw _privateConstructorUsedError;
  bool get isShowErrorMessage => throw _privateConstructorUsedError;
  bool get isEnableBtn => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CodeStateCopyWith<CodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeStateCopyWith<$Res> {
  factory $CodeStateCopyWith(CodeState value, $Res Function(CodeState) then) =
      _$CodeStateCopyWithImpl<$Res>;
  $Res call(
      {String phoneNumber,
      String code,
      String validatedCode,
      bool isShowErrorMessage,
      bool isEnableBtn,
      bool isValid});
}

/// @nodoc
class _$CodeStateCopyWithImpl<$Res> implements $CodeStateCopyWith<$Res> {
  _$CodeStateCopyWithImpl(this._value, this._then);

  final CodeState _value;
  // ignore: unused_field
  final $Res Function(CodeState) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? code = freezed,
    Object? validatedCode = freezed,
    Object? isShowErrorMessage = freezed,
    Object? isEnableBtn = freezed,
    Object? isValid = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      validatedCode: validatedCode == freezed
          ? _value.validatedCode
          : validatedCode // ignore: cast_nullable_to_non_nullable
              as String,
      isShowErrorMessage: isShowErrorMessage == freezed
          ? _value.isShowErrorMessage
          : isShowErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnableBtn: isEnableBtn == freezed
          ? _value.isEnableBtn
          : isEnableBtn // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CodeStateCopyWith<$Res> implements $CodeStateCopyWith<$Res> {
  factory _$CodeStateCopyWith(
          _CodeState value, $Res Function(_CodeState) then) =
      __$CodeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String phoneNumber,
      String code,
      String validatedCode,
      bool isShowErrorMessage,
      bool isEnableBtn,
      bool isValid});
}

/// @nodoc
class __$CodeStateCopyWithImpl<$Res> extends _$CodeStateCopyWithImpl<$Res>
    implements _$CodeStateCopyWith<$Res> {
  __$CodeStateCopyWithImpl(_CodeState _value, $Res Function(_CodeState) _then)
      : super(_value, (v) => _then(v as _CodeState));

  @override
  _CodeState get _value => super._value as _CodeState;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? code = freezed,
    Object? validatedCode = freezed,
    Object? isShowErrorMessage = freezed,
    Object? isEnableBtn = freezed,
    Object? isValid = freezed,
  }) {
    return _then(_CodeState(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      validatedCode: validatedCode == freezed
          ? _value.validatedCode
          : validatedCode // ignore: cast_nullable_to_non_nullable
              as String,
      isShowErrorMessage: isShowErrorMessage == freezed
          ? _value.isShowErrorMessage
          : isShowErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnableBtn: isEnableBtn == freezed
          ? _value.isEnableBtn
          : isEnableBtn // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CodeState implements _CodeState {
  const _$_CodeState(
      {required this.phoneNumber,
      required this.code,
      required this.validatedCode,
      required this.isShowErrorMessage,
      required this.isEnableBtn,
      required this.isValid});

  @override
  final String phoneNumber;
  @override
  final String code;
  @override
  final String validatedCode;
  @override
  final bool isShowErrorMessage;
  @override
  final bool isEnableBtn;
  @override
  final bool isValid;

  @override
  String toString() {
    return 'CodeState(phoneNumber: $phoneNumber, code: $code, validatedCode: $validatedCode, isShowErrorMessage: $isShowErrorMessage, isEnableBtn: $isEnableBtn, isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CodeState &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.validatedCode, validatedCode) &&
            const DeepCollectionEquality()
                .equals(other.isShowErrorMessage, isShowErrorMessage) &&
            const DeepCollectionEquality()
                .equals(other.isEnableBtn, isEnableBtn) &&
            const DeepCollectionEquality().equals(other.isValid, isValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(validatedCode),
      const DeepCollectionEquality().hash(isShowErrorMessage),
      const DeepCollectionEquality().hash(isEnableBtn),
      const DeepCollectionEquality().hash(isValid));

  @JsonKey(ignore: true)
  @override
  _$CodeStateCopyWith<_CodeState> get copyWith =>
      __$CodeStateCopyWithImpl<_CodeState>(this, _$identity);
}

abstract class _CodeState implements CodeState {
  const factory _CodeState(
      {required String phoneNumber,
      required String code,
      required String validatedCode,
      required bool isShowErrorMessage,
      required bool isEnableBtn,
      required bool isValid}) = _$_CodeState;

  @override
  String get phoneNumber;
  @override
  String get code;
  @override
  String get validatedCode;
  @override
  bool get isShowErrorMessage;
  @override
  bool get isEnableBtn;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$CodeStateCopyWith<_CodeState> get copyWith =>
      throw _privateConstructorUsedError;
}
