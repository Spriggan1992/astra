// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'astra_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AstraFailureTearOff {
  const _$AstraFailureTearOff();

  _Api api({int? errorCode, String? errorMessage}) {
    return _Api(
      errorCode: errorCode,
      errorMessage: errorMessage,
    );
  }

  _NoConnection noConnection() {
    return const _NoConnection();
  }
}

/// @nodoc
const $AstraFailure = _$AstraFailureTearOff();

/// @nodoc
mixin _$AstraFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? errorCode, String? errorMessage) api,
    required TResult Function() noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? errorCode, String? errorMessage)? api,
    TResult Function()? noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? errorCode, String? errorMessage)? api,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Api value) api,
    required TResult Function(_NoConnection value) noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Api value)? api,
    TResult Function(_NoConnection value)? noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Api value)? api,
    TResult Function(_NoConnection value)? noConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AstraFailureCopyWith<$Res> {
  factory $AstraFailureCopyWith(
          AstraFailure value, $Res Function(AstraFailure) then) =
      _$AstraFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AstraFailureCopyWithImpl<$Res> implements $AstraFailureCopyWith<$Res> {
  _$AstraFailureCopyWithImpl(this._value, this._then);

  final AstraFailure _value;
  // ignore: unused_field
  final $Res Function(AstraFailure) _then;
}

/// @nodoc
abstract class _$ApiCopyWith<$Res> {
  factory _$ApiCopyWith(_Api value, $Res Function(_Api) then) =
      __$ApiCopyWithImpl<$Res>;
  $Res call({int? errorCode, String? errorMessage});
}

/// @nodoc
class __$ApiCopyWithImpl<$Res> extends _$AstraFailureCopyWithImpl<$Res>
    implements _$ApiCopyWith<$Res> {
  __$ApiCopyWithImpl(_Api _value, $Res Function(_Api) _then)
      : super(_value, (v) => _then(v as _Api));

  @override
  _Api get _value => super._value as _Api;

  @override
  $Res call({
    Object? errorCode = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_Api(
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Api extends _Api {
  const _$_Api({this.errorCode, this.errorMessage}) : super._();

  @override
  final int? errorCode;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AstraFailure.api(errorCode: $errorCode, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Api &&
            const DeepCollectionEquality().equals(other.errorCode, errorCode) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(errorCode),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$ApiCopyWith<_Api> get copyWith =>
      __$ApiCopyWithImpl<_Api>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? errorCode, String? errorMessage) api,
    required TResult Function() noConnection,
  }) {
    return api(errorCode, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? errorCode, String? errorMessage)? api,
    TResult Function()? noConnection,
  }) {
    return api?.call(errorCode, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? errorCode, String? errorMessage)? api,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(errorCode, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Api value) api,
    required TResult Function(_NoConnection value) noConnection,
  }) {
    return api(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Api value)? api,
    TResult Function(_NoConnection value)? noConnection,
  }) {
    return api?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Api value)? api,
    TResult Function(_NoConnection value)? noConnection,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(this);
    }
    return orElse();
  }
}

abstract class _Api extends AstraFailure {
  const factory _Api({int? errorCode, String? errorMessage}) = _$_Api;
  const _Api._() : super._();

  int? get errorCode;
  String? get errorMessage;
  @JsonKey(ignore: true)
  _$ApiCopyWith<_Api> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NoConnectionCopyWith<$Res> {
  factory _$NoConnectionCopyWith(
          _NoConnection value, $Res Function(_NoConnection) then) =
      __$NoConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class __$NoConnectionCopyWithImpl<$Res> extends _$AstraFailureCopyWithImpl<$Res>
    implements _$NoConnectionCopyWith<$Res> {
  __$NoConnectionCopyWithImpl(
      _NoConnection _value, $Res Function(_NoConnection) _then)
      : super(_value, (v) => _then(v as _NoConnection));

  @override
  _NoConnection get _value => super._value as _NoConnection;
}

/// @nodoc

class _$_NoConnection extends _NoConnection {
  const _$_NoConnection() : super._();

  @override
  String toString() {
    return 'AstraFailure.noConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NoConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? errorCode, String? errorMessage) api,
    required TResult Function() noConnection,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? errorCode, String? errorMessage)? api,
    TResult Function()? noConnection,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? errorCode, String? errorMessage)? api,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Api value) api,
    required TResult Function(_NoConnection value) noConnection,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Api value)? api,
    TResult Function(_NoConnection value)? noConnection,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Api value)? api,
    TResult Function(_NoConnection value)? noConnection,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class _NoConnection extends AstraFailure {
  const factory _NoConnection() = _$_NoConnection;
  const _NoConnection._() : super._();
}
