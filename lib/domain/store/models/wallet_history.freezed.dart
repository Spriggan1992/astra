// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wallet_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WalletHistoryTearOff {
  const _$WalletHistoryTearOff();

  _WalletHistory call(
      {required int id,
      required int amount,
      required String datetime,
      required String address}) {
    return _WalletHistory(
      id: id,
      amount: amount,
      datetime: datetime,
      address: address,
    );
  }
}

/// @nodoc
const $WalletHistory = _$WalletHistoryTearOff();

/// @nodoc
mixin _$WalletHistory {
  /// History identifier.
  int get id => throw _privateConstructorUsedError;

  /// Amount of added likes
  int get amount => throw _privateConstructorUsedError;

  /// Date and time of top-up account.
  String get datetime => throw _privateConstructorUsedError;

  /// Adress
  String get address => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletHistoryCopyWith<WalletHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletHistoryCopyWith<$Res> {
  factory $WalletHistoryCopyWith(
          WalletHistory value, $Res Function(WalletHistory) then) =
      _$WalletHistoryCopyWithImpl<$Res>;
  $Res call({int id, int amount, String datetime, String address});
}

/// @nodoc
class _$WalletHistoryCopyWithImpl<$Res>
    implements $WalletHistoryCopyWith<$Res> {
  _$WalletHistoryCopyWithImpl(this._value, this._then);

  final WalletHistory _value;
  // ignore: unused_field
  final $Res Function(WalletHistory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? datetime = freezed,
    Object? address = freezed,
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
      datetime: datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WalletHistoryCopyWith<$Res>
    implements $WalletHistoryCopyWith<$Res> {
  factory _$WalletHistoryCopyWith(
          _WalletHistory value, $Res Function(_WalletHistory) then) =
      __$WalletHistoryCopyWithImpl<$Res>;
  @override
  $Res call({int id, int amount, String datetime, String address});
}

/// @nodoc
class __$WalletHistoryCopyWithImpl<$Res>
    extends _$WalletHistoryCopyWithImpl<$Res>
    implements _$WalletHistoryCopyWith<$Res> {
  __$WalletHistoryCopyWithImpl(
      _WalletHistory _value, $Res Function(_WalletHistory) _then)
      : super(_value, (v) => _then(v as _WalletHistory));

  @override
  _WalletHistory get _value => super._value as _WalletHistory;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? datetime = freezed,
    Object? address = freezed,
  }) {
    return _then(_WalletHistory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      datetime: datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WalletHistory extends _WalletHistory {
  const _$_WalletHistory(
      {required this.id,
      required this.amount,
      required this.datetime,
      required this.address})
      : super._();

  @override

  /// History identifier.
  final int id;
  @override

  /// Amount of added likes
  final int amount;
  @override

  /// Date and time of top-up account.
  final String datetime;
  @override

  /// Adress
  final String address;

  @override
  String toString() {
    return 'WalletHistory(id: $id, amount: $amount, datetime: $datetime, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WalletHistory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.datetime, datetime) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(datetime),
      const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$WalletHistoryCopyWith<_WalletHistory> get copyWith =>
      __$WalletHistoryCopyWithImpl<_WalletHistory>(this, _$identity);
}

abstract class _WalletHistory extends WalletHistory {
  const factory _WalletHistory(
      {required int id,
      required int amount,
      required String datetime,
      required String address}) = _$_WalletHistory;
  const _WalletHistory._() : super._();

  @override

  /// History identifier.
  int get id;
  @override

  /// Amount of added likes
  int get amount;
  @override

  /// Date and time of top-up account.
  String get datetime;
  @override

  /// Adress
  String get address;
  @override
  @JsonKey(ignore: true)
  _$WalletHistoryCopyWith<_WalletHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
