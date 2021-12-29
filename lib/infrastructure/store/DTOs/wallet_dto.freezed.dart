// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wallet_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletDTO _$WalletDTOFromJson(Map<String, dynamic> json) {
  return _WalletDTO.fromJson(json);
}

/// @nodoc
class _$WalletDTOTearOff {
  const _$WalletDTOTearOff();

  _WalletDTO call(
      {required int id,
      required int amount,
      @JsonKey(name: 'profile_id') required int profielId}) {
    return _WalletDTO(
      id: id,
      amount: amount,
      profielId: profielId,
    );
  }

  WalletDTO fromJson(Map<String, Object?> json) {
    return WalletDTO.fromJson(json);
  }
}

/// @nodoc
const $WalletDTO = _$WalletDTOTearOff();

/// @nodoc
mixin _$WalletDTO {
  /// Wallet identifier.
  int get id => throw _privateConstructorUsedError;

  /// Amount of likes on the account.
  int get amount => throw _privateConstructorUsedError;

  /// Profile identifier.
  @JsonKey(name: 'profile_id')
  int get profielId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletDTOCopyWith<WalletDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletDTOCopyWith<$Res> {
  factory $WalletDTOCopyWith(WalletDTO value, $Res Function(WalletDTO) then) =
      _$WalletDTOCopyWithImpl<$Res>;
  $Res call({int id, int amount, @JsonKey(name: 'profile_id') int profielId});
}

/// @nodoc
class _$WalletDTOCopyWithImpl<$Res> implements $WalletDTOCopyWith<$Res> {
  _$WalletDTOCopyWithImpl(this._value, this._then);

  final WalletDTO _value;
  // ignore: unused_field
  final $Res Function(WalletDTO) _then;

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
abstract class _$WalletDTOCopyWith<$Res> implements $WalletDTOCopyWith<$Res> {
  factory _$WalletDTOCopyWith(
          _WalletDTO value, $Res Function(_WalletDTO) then) =
      __$WalletDTOCopyWithImpl<$Res>;
  @override
  $Res call({int id, int amount, @JsonKey(name: 'profile_id') int profielId});
}

/// @nodoc
class __$WalletDTOCopyWithImpl<$Res> extends _$WalletDTOCopyWithImpl<$Res>
    implements _$WalletDTOCopyWith<$Res> {
  __$WalletDTOCopyWithImpl(_WalletDTO _value, $Res Function(_WalletDTO) _then)
      : super(_value, (v) => _then(v as _WalletDTO));

  @override
  _WalletDTO get _value => super._value as _WalletDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? profielId = freezed,
  }) {
    return _then(_WalletDTO(
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
@JsonSerializable()
class _$_WalletDTO extends _WalletDTO {
  const _$_WalletDTO(
      {required this.id,
      required this.amount,
      @JsonKey(name: 'profile_id') required this.profielId})
      : super._();

  factory _$_WalletDTO.fromJson(Map<String, dynamic> json) =>
      _$$_WalletDTOFromJson(json);

  @override

  /// Wallet identifier.
  final int id;
  @override

  /// Amount of likes on the account.
  final int amount;
  @override

  /// Profile identifier.
  @JsonKey(name: 'profile_id')
  final int profielId;

  @override
  String toString() {
    return 'WalletDTO(id: $id, amount: $amount, profielId: $profielId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WalletDTO &&
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
  _$WalletDTOCopyWith<_WalletDTO> get copyWith =>
      __$WalletDTOCopyWithImpl<_WalletDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletDTOToJson(this);
  }
}

abstract class _WalletDTO extends WalletDTO {
  const factory _WalletDTO(
      {required int id,
      required int amount,
      @JsonKey(name: 'profile_id') required int profielId}) = _$_WalletDTO;
  const _WalletDTO._() : super._();

  factory _WalletDTO.fromJson(Map<String, dynamic> json) =
      _$_WalletDTO.fromJson;

  @override

  /// Wallet identifier.
  int get id;
  @override

  /// Amount of likes on the account.
  int get amount;
  @override

  /// Profile identifier.
  @JsonKey(name: 'profile_id')
  int get profielId;
  @override
  @JsonKey(ignore: true)
  _$WalletDTOCopyWith<_WalletDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
