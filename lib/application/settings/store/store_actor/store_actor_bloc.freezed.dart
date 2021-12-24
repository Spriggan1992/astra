// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_actor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StoreActorEventTearOff {
  const _$StoreActorEventTearOff();

  _Initialized initialized(List<Like> likes) {
    return _Initialized(
      likes,
    );
  }

  _LikePackageSelected likePackageSelected(Like like) {
    return _LikePackageSelected(
      like,
    );
  }
}

/// @nodoc
const $StoreActorEvent = _$StoreActorEventTearOff();

/// @nodoc
mixin _$StoreActorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Like> likes) initialized,
    required TResult Function(Like like) likePackageSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Like> likes)? initialized,
    TResult Function(Like like)? likePackageSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Like> likes)? initialized,
    TResult Function(Like like)? likePackageSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_LikePackageSelected value) likePackageSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LikePackageSelected value)? likePackageSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LikePackageSelected value)? likePackageSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreActorEventCopyWith<$Res> {
  factory $StoreActorEventCopyWith(
          StoreActorEvent value, $Res Function(StoreActorEvent) then) =
      _$StoreActorEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$StoreActorEventCopyWithImpl<$Res>
    implements $StoreActorEventCopyWith<$Res> {
  _$StoreActorEventCopyWithImpl(this._value, this._then);

  final StoreActorEvent _value;
  // ignore: unused_field
  final $Res Function(StoreActorEvent) _then;
}

/// @nodoc
abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(
          _Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
  $Res call({List<Like> likes});
}

/// @nodoc
class __$InitializedCopyWithImpl<$Res>
    extends _$StoreActorEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(
      _Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;

  @override
  $Res call({
    Object? likes = freezed,
  }) {
    return _then(_Initialized(
      likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>,
    ));
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(this.likes);

  @override
  final List<Like> likes;

  @override
  String toString() {
    return 'StoreActorEvent.initialized(likes: $likes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initialized &&
            const DeepCollectionEquality().equals(other.likes, likes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(likes));

  @JsonKey(ignore: true)
  @override
  _$InitializedCopyWith<_Initialized> get copyWith =>
      __$InitializedCopyWithImpl<_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Like> likes) initialized,
    required TResult Function(Like like) likePackageSelected,
  }) {
    return initialized(likes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Like> likes)? initialized,
    TResult Function(Like like)? likePackageSelected,
  }) {
    return initialized?.call(likes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Like> likes)? initialized,
    TResult Function(Like like)? likePackageSelected,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(likes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_LikePackageSelected value) likePackageSelected,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LikePackageSelected value)? likePackageSelected,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LikePackageSelected value)? likePackageSelected,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements StoreActorEvent {
  const factory _Initialized(List<Like> likes) = _$_Initialized;

  List<Like> get likes;
  @JsonKey(ignore: true)
  _$InitializedCopyWith<_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LikePackageSelectedCopyWith<$Res> {
  factory _$LikePackageSelectedCopyWith(_LikePackageSelected value,
          $Res Function(_LikePackageSelected) then) =
      __$LikePackageSelectedCopyWithImpl<$Res>;
  $Res call({Like like});

  $LikeCopyWith<$Res> get like;
}

/// @nodoc
class __$LikePackageSelectedCopyWithImpl<$Res>
    extends _$StoreActorEventCopyWithImpl<$Res>
    implements _$LikePackageSelectedCopyWith<$Res> {
  __$LikePackageSelectedCopyWithImpl(
      _LikePackageSelected _value, $Res Function(_LikePackageSelected) _then)
      : super(_value, (v) => _then(v as _LikePackageSelected));

  @override
  _LikePackageSelected get _value => super._value as _LikePackageSelected;

  @override
  $Res call({
    Object? like = freezed,
  }) {
    return _then(_LikePackageSelected(
      like == freezed
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as Like,
    ));
  }

  @override
  $LikeCopyWith<$Res> get like {
    return $LikeCopyWith<$Res>(_value.like, (value) {
      return _then(_value.copyWith(like: value));
    });
  }
}

/// @nodoc

class _$_LikePackageSelected implements _LikePackageSelected {
  const _$_LikePackageSelected(this.like);

  @override
  final Like like;

  @override
  String toString() {
    return 'StoreActorEvent.likePackageSelected(like: $like)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LikePackageSelected &&
            const DeepCollectionEquality().equals(other.like, like));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(like));

  @JsonKey(ignore: true)
  @override
  _$LikePackageSelectedCopyWith<_LikePackageSelected> get copyWith =>
      __$LikePackageSelectedCopyWithImpl<_LikePackageSelected>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Like> likes) initialized,
    required TResult Function(Like like) likePackageSelected,
  }) {
    return likePackageSelected(like);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Like> likes)? initialized,
    TResult Function(Like like)? likePackageSelected,
  }) {
    return likePackageSelected?.call(like);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Like> likes)? initialized,
    TResult Function(Like like)? likePackageSelected,
    required TResult orElse(),
  }) {
    if (likePackageSelected != null) {
      return likePackageSelected(like);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_LikePackageSelected value) likePackageSelected,
  }) {
    return likePackageSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LikePackageSelected value)? likePackageSelected,
  }) {
    return likePackageSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LikePackageSelected value)? likePackageSelected,
    required TResult orElse(),
  }) {
    if (likePackageSelected != null) {
      return likePackageSelected(this);
    }
    return orElse();
  }
}

abstract class _LikePackageSelected implements StoreActorEvent {
  const factory _LikePackageSelected(Like like) = _$_LikePackageSelected;

  Like get like;
  @JsonKey(ignore: true)
  _$LikePackageSelectedCopyWith<_LikePackageSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$StoreActorStateTearOff {
  const _$StoreActorStateTearOff();

  _StoreActorState call({required List<Like> likes, required Like like}) {
    return _StoreActorState(
      likes: likes,
      like: like,
    );
  }
}

/// @nodoc
const $StoreActorState = _$StoreActorStateTearOff();

/// @nodoc
mixin _$StoreActorState {
  List<Like> get likes => throw _privateConstructorUsedError;
  Like get like => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoreActorStateCopyWith<StoreActorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreActorStateCopyWith<$Res> {
  factory $StoreActorStateCopyWith(
          StoreActorState value, $Res Function(StoreActorState) then) =
      _$StoreActorStateCopyWithImpl<$Res>;
  $Res call({List<Like> likes, Like like});

  $LikeCopyWith<$Res> get like;
}

/// @nodoc
class _$StoreActorStateCopyWithImpl<$Res>
    implements $StoreActorStateCopyWith<$Res> {
  _$StoreActorStateCopyWithImpl(this._value, this._then);

  final StoreActorState _value;
  // ignore: unused_field
  final $Res Function(StoreActorState) _then;

  @override
  $Res call({
    Object? likes = freezed,
    Object? like = freezed,
  }) {
    return _then(_value.copyWith(
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>,
      like: like == freezed
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as Like,
    ));
  }

  @override
  $LikeCopyWith<$Res> get like {
    return $LikeCopyWith<$Res>(_value.like, (value) {
      return _then(_value.copyWith(like: value));
    });
  }
}

/// @nodoc
abstract class _$StoreActorStateCopyWith<$Res>
    implements $StoreActorStateCopyWith<$Res> {
  factory _$StoreActorStateCopyWith(
          _StoreActorState value, $Res Function(_StoreActorState) then) =
      __$StoreActorStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Like> likes, Like like});

  @override
  $LikeCopyWith<$Res> get like;
}

/// @nodoc
class __$StoreActorStateCopyWithImpl<$Res>
    extends _$StoreActorStateCopyWithImpl<$Res>
    implements _$StoreActorStateCopyWith<$Res> {
  __$StoreActorStateCopyWithImpl(
      _StoreActorState _value, $Res Function(_StoreActorState) _then)
      : super(_value, (v) => _then(v as _StoreActorState));

  @override
  _StoreActorState get _value => super._value as _StoreActorState;

  @override
  $Res call({
    Object? likes = freezed,
    Object? like = freezed,
  }) {
    return _then(_StoreActorState(
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>,
      like: like == freezed
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as Like,
    ));
  }
}

/// @nodoc

class _$_StoreActorState implements _StoreActorState {
  const _$_StoreActorState({required this.likes, required this.like});

  @override
  final List<Like> likes;
  @override
  final Like like;

  @override
  String toString() {
    return 'StoreActorState(likes: $likes, like: $like)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StoreActorState &&
            const DeepCollectionEquality().equals(other.likes, likes) &&
            const DeepCollectionEquality().equals(other.like, like));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(likes),
      const DeepCollectionEquality().hash(like));

  @JsonKey(ignore: true)
  @override
  _$StoreActorStateCopyWith<_StoreActorState> get copyWith =>
      __$StoreActorStateCopyWithImpl<_StoreActorState>(this, _$identity);
}

abstract class _StoreActorState implements StoreActorState {
  const factory _StoreActorState(
      {required List<Like> likes, required Like like}) = _$_StoreActorState;

  @override
  List<Like> get likes;
  @override
  Like get like;
  @override
  @JsonKey(ignore: true)
  _$StoreActorStateCopyWith<_StoreActorState> get copyWith =>
      throw _privateConstructorUsedError;
}
