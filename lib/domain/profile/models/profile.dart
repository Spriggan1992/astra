import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile.freezed.dart';

/// Represemt model(union) profile
@freezed
class Profile with _$Profile {
  const Profile._();
  const factory Profile({
    /// User identifier.
    required final int id,

    /// Curator id.
    required final int curatorId,

    /// User phone number to display.
    required final String phoneNumber,

    /// User firstname to display.
    required final String firstname,

    /// User lastname to display.
    required final String lastname,

    /// User age to display.
    required final int age,

    /// User height to display.
    required final int height,

    /// User gender to display.
    required final String gender,

    /// User status to display.
    required final String status,

    /// A flag responsible to display if user have a child.
    required final bool haveChild,

    /// Users country to display.
    required final String country,

    /// Users city to display.
    required final String city,

    /// Users profile photos to diplsy.
    required final List profilePhotos, // ??
    /// Curators photos to display.
    required final List curatorPhotos, // ??

    /// Users profileInfo to display.
    required final String profileInfo,

    /// Users created account date to display.
    required final String createdAt,

    /// Users saved account date to display.
    required final String savedAt,

    /// A flag resposible for display status of relationship.
    required final bool isActive,

    /// ?
    required final bool draft,

    /// A flag responsible for hidden status account.
    required final bool isHidden,

    /// A flag responsible for hidden account info account.
    required final bool showInfo,
  }) = _Profile;
}
