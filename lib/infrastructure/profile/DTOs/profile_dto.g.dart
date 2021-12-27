// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileDTO _$$_ProfileDTOFromJson(Map<String, dynamic> json) =>
    _$_ProfileDTO(
      id: json['id'] as int,
      curatorId: json['curator_id'] as int,
      phoneNumber: json['phone_number'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      age: json['age'] as int,
      height: json['height'] as int,
      gender: json['gender'] as String,
      status: json['status'] as String,
      haveChild: json['have_child'] as bool,
      country: json['country'] as String,
      city: json['city'] as String,
      profilePhotos: (json['profile_photos'] as List<dynamic>)
          .map((e) => ImageDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      curatorPhotos: (json['curator_photos'] as List<dynamic>)
          .map((e) => ImageDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      profileInfo: json['profile_info'] as String,
      createdAt: json['created_at'] as String,
      savedAt: json['saved_at'] as String,
      isActive: json['is_active'] as bool,
      draft: json['draft'] as bool,
      isHidden: json['is_hidden'] as bool,
      showInfo: json['show_info'] as bool,
    );

Map<String, dynamic> _$$_ProfileDTOToJson(_$_ProfileDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'curator_id': instance.curatorId,
      'phone_number': instance.phoneNumber,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'age': instance.age,
      'height': instance.height,
      'gender': instance.gender,
      'status': instance.status,
      'have_child': instance.haveChild,
      'country': instance.country,
      'city': instance.city,
      'profile_photos': instance.profilePhotos,
      'curator_photos': instance.curatorPhotos,
      'profile_info': instance.profileInfo,
      'created_at': instance.createdAt,
      'saved_at': instance.savedAt,
      'is_active': instance.isActive,
      'draft': instance.draft,
      'is_hidden': instance.isHidden,
      'show_info': instance.showInfo,
    };
