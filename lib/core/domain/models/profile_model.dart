import 'package:astra_app/core/domain/models/image_models.dart';
import 'package:astra_app/favorites/domain/match_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_model.freezed.dart';

/// Represent model(union) profile
@freezed
class ProfileModel with _$ProfileModel {
  const ProfileModel._();
  const factory ProfileModel({
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

    /// Users profile photos to display.
    required final List<ImageModel> profilePhotos,

    /// Curators photos to display.
    required final List<ImageModel> curatorPhotos,

    /// Users profileInfo to display.
    required final String profileInfo,

    /// Users created account date to display.
    required final String createdAt,

    /// Users saved account date to display.
    required final String savedAt,

    /// A flag responsible for display status of relationship.
    required final bool isActive,

    /// ?
    required final bool draft,

    /// A flag responsible for hidden status account.
    required final bool isHidden,

    /// A flag responsible for hidden account info account.
    required final bool showInfo,

    /// A flag responsible for showing mutual sympathy.
    required final bool isMutualLike,

    /// A curator first name.
    required final String curatorFirstName,

    /// A curator last name.
    required final String curatorLastName,

    /// Amount of likes on account.
    required final int likeAmount,

    /// Whether the applicant contains in `StopList` category.
    bool? isStopList,
    required final MatchStatus matchStatus,
  }) = _Profile;

  /// Get user information.
  String get userInfo => '$firstname $lastname, $age';

  /// Get user name and age.
  String get userNameAge => '$firstname , $age';

  /// Get user location.
  String get userLocation => '$country, $city';

  String get curatorInfo => '$country, $city';

  /// Get curator full name.
  String get curatorFullName => '$curatorFirstName $curatorLastName';

  /// Empty profile.
  factory ProfileModel.empty() => const ProfileModel(
        id: 0,
        curatorId: 0,
        phoneNumber: '',
        firstname: '',
        lastname: '',
        age: 0,
        height: 0,
        gender: '',
        status: '',
        haveChild: false,
        country: '',
        city: '',
        profilePhotos: [],
        curatorPhotos: [],
        profileInfo: '',
        createdAt: '',
        savedAt: '',
        isActive: false,
        draft: false,
        isHidden: false,
        showInfo: false,
        isMutualLike: false,
        isStopList: false,
        curatorFirstName: '',
        curatorLastName: '',
        likeAmount: 0,
        matchStatus: MatchStatus.initial,
      );
}
