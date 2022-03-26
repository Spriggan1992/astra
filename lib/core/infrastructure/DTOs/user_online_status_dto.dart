// ignore_for_file: invalid_annotation_target

import 'package:astra_app/core/domain/models/user_online_status.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_online_status_dto.freezed.dart';
part 'user_online_status_dto.g.dart';

/// Defines online user status date transfer object.
@freezed
class UserOnlineStatusDTO with _$UserOnlineStatusDTO {
  const UserOnlineStatusDTO._();

  const factory UserOnlineStatusDTO({
    /// Status whether the user online.
    @JsonKey(name: 'is_online') required bool isOnline,
  }) = _UserOnlineStatusDTO;

  /// Return converted DTO from json.
  factory UserOnlineStatusDTO.fromDomain(UserOnlineStatusModel _) {
    return UserOnlineStatusDTO(isOnline: _.isOnline);
  }

// Convert DTO to domain.
  UserOnlineStatusModel toDomain() => UserOnlineStatusModel(isOnline: isOnline);

// Return converted DTO from json.
  factory UserOnlineStatusDTO.fromJson(Map<String, dynamic> json) =>
      _$UserOnlineStatusDTOFromJson(json);

// Convert object to json.
  factory UserOnlineStatusDTO.toJson() => UserOnlineStatusDTO.toJson();
}
