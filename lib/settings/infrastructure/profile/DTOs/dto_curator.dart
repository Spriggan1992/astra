// ignore_for_file: invalid_annotation_target

import 'package:astra_app/core/infrastructure/DTOs/image_dto.dart';
import 'package:astra_app/settings/domain/profile/models/curator_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dto_curator.g.dart';
part 'dto_curator.freezed.dart';

ImageDTO? _curatorPhoto(List<Object> json) {
  return json.singleOrNull as ImageDTO?;
}

/// Represent curator data transfer object.
@freezed
class CuratorDTO with _$CuratorDTO {
  const CuratorDTO._();
  const factory CuratorDTO({
    // / Curator identifier.
    @JsonKey(name: 'id') required int id,

    /// Curator email.
    @JsonKey(name: 'email') required String email,

    /// Curator phone number.
    @JsonKey(name: 'phone_number') required int phoneNumber,

    /// Curator firstname.
    @JsonKey(name: 'firstname') required String firstname,

    /// Curator lastname.
    @JsonKey(name: 'lastname') required String lastname,

    /// Curator patronyc.
    @JsonKey(name: 'patronyc') required String patronyc,

    /// Curator country.
    @JsonKey(name: 'country') required String country,

    /// Curator city.
    @JsonKey(name: 'city') required String city,

    /// Curator profile photo.
    @JsonKey(name: 'profile_photo') required List<ImageDTO> profilePhoto,
  }) = _CuratorDTO;

  /// Return converted DTO from json.
  factory CuratorDTO.fromJson(Map<String, dynamic> json) =>
      _$CuratorDTOFromJson(json);

  /// Convert object to json.
  factory CuratorDTO.toJson() => CuratorDTO.toJson();

  /// Return converted DTO from from domain.
  factory CuratorDTO.fromDomain(CuratorModel _) {
    return CuratorDTO(
      id: _.id,
      email: _.email,
      phoneNumber: _.phoneNumber,
      firstname: _.firstname,
      lastname: _.lastname,
      patronyc: _.patronyc,
      country: _.country,
      city: _.city,
      profilePhoto: [ImageDTO.fromDomain(_.profilePhoto)],
    );
  }

  /// Convert DTO to domain.
  CuratorModel toDomain() => CuratorModel(
        id: id,
        email: email,
        phoneNumber: phoneNumber,
        firstname: firstname,
        lastname: lastname,
        patronyc: patronyc,
        country: country,
        city: city,
        profilePhoto: profilePhoto.single.toDomain(),
      );
}
