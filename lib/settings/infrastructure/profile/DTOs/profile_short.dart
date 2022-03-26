// ignore_for_file: invalid_annotation_target
import 'package:astra_app/core/infrastructure/DTOs/image_dto.dart';
import 'package:astra_app/settings/domain/profile/models/profile_short_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_short.freezed.dart';
part 'profile_short.g.dart';

/// Defines short profile info data transfer object.
@freezed
class ProfileShortDTO with _$ProfileShortDTO {
  const ProfileShortDTO._();
  const factory ProfileShortDTO({
    /// User identifier.
    @JsonKey(name: 'id') required int id,

    /// Users first name.
    @JsonKey(name: 'firstname') required String firstname,

    /// Users lastname.
    @JsonKey(name: 'lastname') required String lastname,

    /// Users age.
    @JsonKey(name: 'age') required int age,

    /// Users country.
    @JsonKey(name: 'country') required String country,

    /// Users city.
    @JsonKey(name: 'city') required String city,

    /// Users image.
    @JsonKey(name: 'profile_photo') required ImageDTO avatar,
  }) = _ProfileShortDTO;

  factory ProfileShortDTO.fromDomain(ProfileShortModel _) {
    return ProfileShortDTO(
      id: _.id,
      firstname: _.firstname,
      lastname: _.lastname,
      age: _.age,
      country: _.country,
      city: _.city,
      avatar: ImageDTO.fromDomain(_.avatar),
    );
  }

  /// Convert DTO to domain.
  ProfileShortModel toDomain() => ProfileShortModel(
        id: id,
        firstname: firstname,
        lastname: lastname,
        age: age,
        country: country,
        city: city,
        avatar: avatar.toDomain(),
      );

  /// Return converted DTO from json.
  factory ProfileShortDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileShortDTOFromJson(json);

  /// Convert object to json.
  factory ProfileShortDTO.toJson() {
    return ProfileShortDTO.toJson();
  }
}
