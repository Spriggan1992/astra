// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'base_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BaseResponseTearOff {
  const _$BaseResponseTearOff();

  _NoConnection<T> noConnection<T>() {
    return _NoConnection<T>();
  }

  _WithDate<T> withDate<T>(T data) {
    return _WithDate<T>(
      data,
    );
  }
}

/// @nodoc
const $BaseResponse = _$BaseResponseTearOff();

/// @nodoc
mixin _$BaseResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(T data) withDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? withDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? withDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_WithDate<T> value) withDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_WithDate<T> value)? withDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_WithDate<T> value)? withDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseResponseCopyWith<T, $Res> {
  factory $BaseResponseCopyWith(
          BaseResponse<T> value, $Res Function(BaseResponse<T>) then) =
      _$BaseResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$BaseResponseCopyWithImpl<T, $Res>
    implements $BaseResponseCopyWith<T, $Res> {
  _$BaseResponseCopyWithImpl(this._value, this._then);

  final BaseResponse<T> _value;
  // ignore: unused_field
  final $Res Function(BaseResponse<T>) _then;
}

/// @nodoc
abstract class _$NoConnectionCopyWith<T, $Res> {
  factory _$NoConnectionCopyWith(
          _NoConnection<T> value, $Res Function(_NoConnection<T>) then) =
      __$NoConnectionCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$NoConnectionCopyWithImpl<T, $Res>
    extends _$BaseResponseCopyWithImpl<T, $Res>
    implements _$NoConnectionCopyWith<T, $Res> {
  __$NoConnectionCopyWithImpl(
      _NoConnection<T> _value, $Res Function(_NoConnection<T>) _then)
      : super(_value, (v) => _then(v as _NoConnection<T>));

  @override
  _NoConnection<T> get _value => super._value as _NoConnection<T>;
}

/// @nodoc

class _$_NoConnection<T> extends _NoConnection<T> {
  const _$_NoConnection() : super._();

  @override
  String toString() {
    return 'BaseResponse<$T>.noConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NoConnection<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(T data) withDate,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? withDate,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? withDate,
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
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_WithDate<T> value) withDate,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_WithDate<T> value)? withDate,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_WithDate<T> value)? withDate,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class _NoConnection<T> extends BaseResponse<T> {
  const factory _NoConnection() = _$_NoConnection<T>;
  const _NoConnection._() : super._();
}

/// @nodoc
abstract class _$WithDateCopyWith<T, $Res> {
  factory _$WithDateCopyWith(
          _WithDate<T> value, $Res Function(_WithDate<T>) then) =
      __$WithDateCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$WithDateCopyWithImpl<T, $Res>
    extends _$BaseResponseCopyWithImpl<T, $Res>
    implements _$WithDateCopyWith<T, $Res> {
  __$WithDateCopyWithImpl(
      _WithDate<T> _value, $Res Function(_WithDate<T>) _then)
      : super(_value, (v) => _then(v as _WithDate<T>));

  @override
  _WithDate<T> get _value => super._value as _WithDate<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_WithDate<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_WithDate<T> extends _WithDate<T> {
  const _$_WithDate(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'BaseResponse<$T>.withDate(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WithDate<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$WithDateCopyWith<T, _WithDate<T>> get copyWith =>
      __$WithDateCopyWithImpl<T, _WithDate<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(T data) withDate,
  }) {
    return withDate(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? withDate,
  }) {
    return withDate?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? withDate,
    required TResult orElse(),
  }) {
    if (withDate != null) {
      return withDate(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_WithDate<T> value) withDate,
  }) {
    return withDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_WithDate<T> value)? withDate,
  }) {
    return withDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_WithDate<T> value)? withDate,
    required TResult orElse(),
  }) {
    if (withDate != null) {
      return withDate(this);
    }
    return orElse();
  }
}

abstract class _WithDate<T> extends BaseResponse<T> {
  const factory _WithDate(T data) = _$_WithDate<T>;
  const _WithDate._() : super._();

  T get data;
  @JsonKey(ignore: true)
  _$WithDateCopyWith<T, _WithDate<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
