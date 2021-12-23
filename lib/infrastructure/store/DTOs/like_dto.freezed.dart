// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'like_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LikeDTO _$LikeDTOFromJson(Map<String, dynamic> json) {
  return _LikeDTO.fromJson(json);
}

/// @nodoc
class _$LikeDTOTearOff {
  const _$LikeDTOTearOff();

  _LikeDTO call({required int id, required int amount, required int price}) {
    return _LikeDTO(
      id: id,
      amount: amount,
      price: price,
    );
  }

  LikeDTO fromJson(Map<String, Object?> json) {
    return LikeDTO.fromJson(json);
  }
}

/// @nodoc
const $LikeDTO = _$LikeDTOTearOff();

/// @nodoc
mixin _$LikeDTO {
  /// Like package identifier.
  int get id => throw _privateConstructorUsedError;

  /// Amount of like packages.
  int get amount => throw _privateConstructorUsedError;

  /// Like package price.
  int get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikeDTOCopyWith<LikeDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeDTOCopyWith<$Res> {
  factory $LikeDTOCopyWith(LikeDTO value, $Res Function(LikeDTO) then) =
      _$LikeDTOCopyWithImpl<$Res>;
  $Res call({int id, int amount, int price});
}

/// @nodoc
class _$LikeDTOCopyWithImpl<$Res> implements $LikeDTOCopyWith<$Res> {
  _$LikeDTOCopyWithImpl(this._value, this._then);

  final LikeDTO _value;
  // ignore: unused_field
  final $Res Function(LikeDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? price = freezed,
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
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$LikeDTOCopyWith<$Res> implements $LikeDTOCopyWith<$Res> {
  factory _$LikeDTOCopyWith(_LikeDTO value, $Res Function(_LikeDTO) then) =
      __$LikeDTOCopyWithImpl<$Res>;
  @override
  $Res call({int id, int amount, int price});
}

/// @nodoc
class __$LikeDTOCopyWithImpl<$Res> extends _$LikeDTOCopyWithImpl<$Res>
    implements _$LikeDTOCopyWith<$Res> {
  __$LikeDTOCopyWithImpl(_LikeDTO _value, $Res Function(_LikeDTO) _then)
      : super(_value, (v) => _then(v as _LikeDTO));

  @override
  _LikeDTO get _value => super._value as _LikeDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? price = freezed,
  }) {
    return _then(_LikeDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LikeDTO extends _LikeDTO {
  const _$_LikeDTO(
      {required this.id, required this.amount, required this.price})
      : super._();

  factory _$_LikeDTO.fromJson(Map<String, dynamic> json) =>
      _$$_LikeDTOFromJson(json);

  @override

  /// Like package identifier.
  final int id;
  @override

  /// Amount of like packages.
  final int amount;
  @override

  /// Like package price.
  final int price;

  @override
  String toString() {
    return 'LikeDTO(id: $id, amount: $amount, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LikeDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$LikeDTOCopyWith<_LikeDTO> get copyWith =>
      __$LikeDTOCopyWithImpl<_LikeDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LikeDTOToJson(this);
  }
}

abstract class _LikeDTO extends LikeDTO {
  const factory _LikeDTO(
      {required int id, required int amount, required int price}) = _$_LikeDTO;
  const _LikeDTO._() : super._();

  factory _LikeDTO.fromJson(Map<String, dynamic> json) = _$_LikeDTO.fromJson;

  @override

  /// Like package identifier.
  int get id;
  @override

  /// Amount of like packages.
  int get amount;
  @override

  /// Like package price.
  int get price;
  @override
  @JsonKey(ignore: true)
  _$LikeDTOCopyWith<_LikeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
