// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'walet_history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletHistoryDTO _$WalletHistoryDTOFromJson(Map<String, dynamic> json) {
  return _WalletHistoryDTO.fromJson(json);
}

/// @nodoc
class _$WalletHistoryDTOTearOff {
  const _$WalletHistoryDTOTearOff();

  _WalletHistoryDTO call(
      {required int id,
      required int amount,
      required String datetime,
      required String address}) {
    return _WalletHistoryDTO(
      id: id,
      amount: amount,
      datetime: datetime,
      address: address,
    );
  }

  WalletHistoryDTO fromJson(Map<String, Object?> json) {
    return WalletHistoryDTO.fromJson(json);
  }
}

/// @nodoc
const $WalletHistoryDTO = _$WalletHistoryDTOTearOff();

/// @nodoc
mixin _$WalletHistoryDTO {
  /// History identifier.
  int get id => throw _privateConstructorUsedError;

  /// Amount of added likes
  int get amount => throw _privateConstructorUsedError;

  /// Date and time of top-up account.
  String get datetime => throw _privateConstructorUsedError;

  /// Adress
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletHistoryDTOCopyWith<WalletHistoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletHistoryDTOCopyWith<$Res> {
  factory $WalletHistoryDTOCopyWith(
          WalletHistoryDTO value, $Res Function(WalletHistoryDTO) then) =
      _$WalletHistoryDTOCopyWithImpl<$Res>;
  $Res call({int id, int amount, String datetime, String address});
}

/// @nodoc
class _$WalletHistoryDTOCopyWithImpl<$Res>
    implements $WalletHistoryDTOCopyWith<$Res> {
  _$WalletHistoryDTOCopyWithImpl(this._value, this._then);

  final WalletHistoryDTO _value;
  // ignore: unused_field
  final $Res Function(WalletHistoryDTO) _then;

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
abstract class _$WalletHistoryDTOCopyWith<$Res>
    implements $WalletHistoryDTOCopyWith<$Res> {
  factory _$WalletHistoryDTOCopyWith(
          _WalletHistoryDTO value, $Res Function(_WalletHistoryDTO) then) =
      __$WalletHistoryDTOCopyWithImpl<$Res>;
  @override
  $Res call({int id, int amount, String datetime, String address});
}

/// @nodoc
class __$WalletHistoryDTOCopyWithImpl<$Res>
    extends _$WalletHistoryDTOCopyWithImpl<$Res>
    implements _$WalletHistoryDTOCopyWith<$Res> {
  __$WalletHistoryDTOCopyWithImpl(
      _WalletHistoryDTO _value, $Res Function(_WalletHistoryDTO) _then)
      : super(_value, (v) => _then(v as _WalletHistoryDTO));

  @override
  _WalletHistoryDTO get _value => super._value as _WalletHistoryDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? datetime = freezed,
    Object? address = freezed,
  }) {
    return _then(_WalletHistoryDTO(
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
@JsonSerializable()
class _$_WalletHistoryDTO extends _WalletHistoryDTO {
  const _$_WalletHistoryDTO(
      {required this.id,
      required this.amount,
      required this.datetime,
      required this.address})
      : super._();

  factory _$_WalletHistoryDTO.fromJson(Map<String, dynamic> json) =>
      _$$_WalletHistoryDTOFromJson(json);

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
    return 'WalletHistoryDTO(id: $id, amount: $amount, datetime: $datetime, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WalletHistoryDTO &&
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
  _$WalletHistoryDTOCopyWith<_WalletHistoryDTO> get copyWith =>
      __$WalletHistoryDTOCopyWithImpl<_WalletHistoryDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletHistoryDTOToJson(this);
  }
}

abstract class _WalletHistoryDTO extends WalletHistoryDTO {
  const factory _WalletHistoryDTO(
      {required int id,
      required int amount,
      required String datetime,
      required String address}) = _$_WalletHistoryDTO;
  const _WalletHistoryDTO._() : super._();

  factory _WalletHistoryDTO.fromJson(Map<String, dynamic> json) =
      _$_WalletHistoryDTO.fromJson;

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
  _$WalletHistoryDTOCopyWith<_WalletHistoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
