// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WalletTearOff {
  const _$WalletTearOff();

  _Wallet call({required int id, required int amount, required int profielId}) {
    return _Wallet(
      id: id,
      amount: amount,
      profielId: profielId,
    );
  }
}

/// @nodoc
const $Wallet = _$WalletTearOff();

/// @nodoc
mixin _$Wallet {
  /// Wallet identifier.
  int get id => throw _privateConstructorUsedError;

  /// Amount of likes on the account.
  int get amount => throw _privateConstructorUsedError;

  /// Profile identifier.
  int get profielId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res>;
  $Res call({int id, int amount, int profielId});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res> implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  final Wallet _value;
  // ignore: unused_field
  final $Res Function(Wallet) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? profielId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      profielId: profielId == freezed
          ? _value.profielId
          : profielId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$WalletCopyWith(_Wallet value, $Res Function(_Wallet) then) =
      __$WalletCopyWithImpl<$Res>;
  @override
  $Res call({int id, int amount, int profielId});
}

/// @nodoc
class __$WalletCopyWithImpl<$Res> extends _$WalletCopyWithImpl<$Res>
    implements _$WalletCopyWith<$Res> {
  __$WalletCopyWithImpl(_Wallet _value, $Res Function(_Wallet) _then)
      : super(_value, (v) => _then(v as _Wallet));

  @override
  _Wallet get _value => super._value as _Wallet;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? profielId = freezed,
  }) {
    return _then(_Wallet(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      profielId: profielId == freezed
          ? _value.profielId
          : profielId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Wallet extends _Wallet {
  const _$_Wallet(
      {required this.id, required this.amount, required this.profielId})
      : super._();

  @override

  /// Wallet identifier.
  final int id;
  @override

  /// Amount of likes on the account.
  final int amount;
  @override

  /// Profile identifier.
  final int profielId;

  @override
  String toString() {
    return 'Wallet(id: $id, amount: $amount, profielId: $profielId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Wallet &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.profielId, profielId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(profielId));

  @JsonKey(ignore: true)
  @override
  _$WalletCopyWith<_Wallet> get copyWith =>
      __$WalletCopyWithImpl<_Wallet>(this, _$identity);
}

abstract class _Wallet extends Wallet {
  const factory _Wallet(
      {required int id,
      required int amount,
      required int profielId}) = _$_Wallet;
  const _Wallet._() : super._();

  @override

  /// Wallet identifier.
  int get id;
  @override

  /// Amount of likes on the account.
  int get amount;
  @override

  /// Profile identifier.
  int get profielId;
  @override
  @JsonKey(ignore: true)
  _$WalletCopyWith<_Wallet> get copyWith => throw _privateConstructorUsedError;
}
