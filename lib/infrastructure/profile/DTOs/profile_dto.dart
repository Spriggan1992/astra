// ignore_for_file: invalid_annotation_target

import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

/// Represemt data transfer object profile.
@freezed
class ProfileDTO with _$ProfileDTO {
  const ProfileDTO._();
  const factory ProfileDTO({
    /// User identifier.
    @JsonKey(name: 'id') required final int id,

    /// Curator id.
    @JsonKey(name: 'curator_id') required final int curatorId,

    // / User phone number.
    @JsonKey(name: 'phone_number') required final String phoneNumber,

    /// User firstname.
    @JsonKey(name: 'firstname') required final String firstname,

    /// User lastname.
    @JsonKey(name: 'lastname') required final String lastname,

    /// User age.
    @JsonKey(name: 'age') required final int age,

    /// User height.
    @JsonKey(name: 'height') required final int height,

    /// User gender.
    @JsonKey(name: 'gender') required final String gender,

    /// User status.
    @JsonKey(name: 'status') required final String status,

    /// A flag responsible to status that user have a child.
    @JsonKey(name: 'have_child') required final bool haveChild,

    /// Users country.
    @JsonKey(name: 'country') required final String country,

    /// Users city.
    @JsonKey(name: 'city') required final String city,

    /// Users profile photos.
    @JsonKey(name: 'profile_photos') required final List profilePhotos, // ??
    /// Curators photos.
    @JsonKey(name: 'curator_photos') required final List curatorPhotos, // ??

    /// Users profileInfo.
    @JsonKey(name: 'profile_info') required final String profileInfo,

    /// Users created account date.
    @JsonKey(name: 'created_at') required final String createdAt,

    /// Users saved account date.
    @JsonKey(name: 'saved_at') required final String savedAt,

    /// A flag resposible for status of relationship in active.
    @JsonKey(name: 'is_active') required final bool isActive,

    /// ?
    @JsonKey(name: 'draft') required final bool draft,

    /// A flag responsible for hidden status account.
    @JsonKey(name: 'is_hidden') required final bool isHidden,

    /// A flag responsible for hidden account info account.
    @JsonKey(name: 'show_info') required final bool showInfo,
  }) = _ProfileDTO;

  /// Return converted DTO from from domain.
  factory ProfileDTO.fromDomain(Profile _) {
    return ProfileDTO(
      id: _.id,
      curatorId: _.curatorId,
      phoneNumber: _.phoneNumber,
      firstname: _.firstname,
      lastname: _.lastname,
      age: _.age,
      height: _.height,
      gender: _.gender,
      status: _.status,
      haveChild: _.haveChild,
      country: _.country,
      city: _.city,
      profilePhotos: _.profilePhotos,
      curatorPhotos: _.curatorPhotos,
      profileInfo: _.profileInfo,
      createdAt: _.createdAt,
      savedAt: _.savedAt,
      isActive: _.isActive,
      draft: _.draft,
      isHidden: _.isHidden,
      showInfo: _.showInfo,
    );
  }

  Profile toDomain() => Profile(
        id: id,
        curatorId: curatorId,
        phoneNumber: phoneNumber,
        firstname: firstname,
        lastname: lastname,
        age: age,
        height: height,
        gender: gender,
        status: status,
        haveChild: haveChild,
        country: country,
        city: city,
        profilePhotos: profilePhotos,
        curatorPhotos: curatorPhotos,
        profileInfo: profileInfo,
        createdAt: createdAt,
        savedAt: savedAt,
        isActive: isActive,
        draft: draft,
        isHidden: isHidden,
        showInfo: showInfo,
      );

  /// Return converted DTO from json.
  factory ProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileDTOFromJson(json);

  ///
  factory ProfileDTO.toJson() {
    return ProfileDTO.toJson();
  }
}
