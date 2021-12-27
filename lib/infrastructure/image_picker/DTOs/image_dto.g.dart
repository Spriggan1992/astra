// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageDTO _$$_ImageDTOFromJson(Map<String, dynamic> json) => _$_ImageDTO(
      id: json['id'] as int?,
      imageUrl: json['url'] as String?,
      imagePath: json['images'] as String?,
    );

Map<String, dynamic> _$$_ImageDTOToJson(_$_ImageDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.imageUrl,
      'images': instance.imagePath,
    };
