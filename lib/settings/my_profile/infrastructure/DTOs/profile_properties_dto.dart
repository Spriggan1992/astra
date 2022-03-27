// ignore_for_file: invalid_annotation_target

import 'package:astra_app/settings/my_profile/domain/models/profile_properties.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_properties_dto.freezed.dart';
part 'profile_properties_dto.g.dart';

/// Defines profile additional info data transfer object.
@freezed
class ProfilePropertiesDTO with _$ProfilePropertiesDTO {
  const ProfilePropertiesDTO._();

  const factory ProfilePropertiesDTO({
    /// User's character.
    @JsonKey(name: 'character') required String? character,

    /// User's skills.
    @JsonKey(name: 'skills') required String? skills,

    /// User's orientation.
    @JsonKey(name: 'orientation') required String? orientation,

    /// User's emotionality.
    @JsonKey(name: 'emotionality') required String? emotionality,

    /// User's intellectuality.
    @JsonKey(name: 'intellectuality') required String? intellectuality,

    /// User's sociability.
    @JsonKey(name: 'sociability') required String? sociability,

    /// User's selfRating.
    @JsonKey(name: 'self_rating') required String? selfRating,

    /// User's volitionally.
    @JsonKey(name: 'volitionality') required String? volitionality,

    /// User's selfControl.
    @JsonKey(name: 'self_control') required String? selfControl,
  }) = _ProfilePropertiesDTO;

  /// Return converted DTO from json.
  factory ProfilePropertiesDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfilePropertiesDTOFromJson(json);

  /// Convert object to json.
  factory ProfilePropertiesDTO.toJson() {
    return ProfilePropertiesDTO.toJson();
  }

  /// Convert DTO to domain.
  List<ProfileProperties> toDomain() {
    List<ProfileProperties> additionalInfo = [];

    if (character != null && character!.isNotEmpty) {
      additionalInfo.add(
        ProfileProperties(title: 'Характеристика', value: character!),
      );
    }

    if (skills != null && skills!.isNotEmpty) {
      additionalInfo.add(
        ProfileProperties(title: 'Cпособности', value: skills!),
      );
    }

    if (skills != null && skills!.isNotEmpty) {
      additionalInfo.add(
        ProfileProperties(title: 'Ориентация', value: orientation!),
      );
    }
    if (emotionality != null && emotionality!.isNotEmpty) {
      additionalInfo.add(
        ProfileProperties(title: 'Эмоциональность', value: emotionality!),
      );
    }

    if (intellectuality != null && intellectuality!.isNotEmpty) {
      additionalInfo.add(
        ProfileProperties(title: 'Интеллектуальность', value: intellectuality!),
      );
    }

    if (sociability != null && sociability!.isNotEmpty) {
      additionalInfo.add(
        ProfileProperties(title: 'Общительность', value: sociability!),
      );
    }

    if (selfRating != null && selfRating!.isNotEmpty) {
      additionalInfo.add(
        ProfileProperties(title: 'Самооценка', value: selfRating!),
      );
    }

    if (volitionality != null && volitionality!.isNotEmpty) {
      additionalInfo.add(
        ProfileProperties(title: 'Произвольность', value: volitionality!),
      );
    }
    if (selfControl != null && selfControl!.isNotEmpty) {
      additionalInfo.add(
        ProfileProperties(title: 'Самоконтроль', value: selfControl!),
      );
    }

    return additionalInfo;
  }
}
