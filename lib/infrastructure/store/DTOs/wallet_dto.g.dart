// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletDTO _$$_WalletDTOFromJson(Map<String, dynamic> json) => _$_WalletDTO(
      id: json['id'] as int,
      amount: json['amount'] as int,
      profielId: json['profile_id'] as int,
    );

Map<String, dynamic> _$$_WalletDTOToJson(_$_WalletDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'profile_id': instance.profielId,
    };
