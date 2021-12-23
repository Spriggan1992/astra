// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walet_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletHistoryDTO _$$_WalletHistoryDTOFromJson(Map<String, dynamic> json) =>
    _$_WalletHistoryDTO(
      id: json['id'] as int,
      amount: json['amount'] as int,
      datetime: json['datetime'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$_WalletHistoryDTOToJson(_$_WalletHistoryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'datetime': instance.datetime,
      'address': instance.address,
    };
