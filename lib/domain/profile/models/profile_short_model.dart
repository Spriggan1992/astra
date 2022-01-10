import 'package:astra_app/domain/core/models/image_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_short_model.freezed.dart';

/// Definesshort information about user.
@freezed
class ProfileShortModel with _$ProfileShortModel {
  const ProfileShortModel._();
  const factory ProfileShortModel({
    /// User identifier.
    required int id,

    /// Users first name.
    required String firstname,

    /// Users lastname.
    required String lastname,

    /// Users age.
    required int age,

    /// Users country.
    required String country,

    /// Users city.
    required String city,

    /// Users image.
    required ImageModel avatar,
  }) = _ProfileShortModel;

  /// Empty `ProfileShortModel`.
  factory ProfileShortModel.empty() => ProfileShortModel(
        id: 0,
        firstname: '',
        lastname: '',
        age: 0,
        country: '',
        city: '',
        avatar: ImageModel.empty(),
      );

  /// Get user information.
  String get userInfo => '$firstname $lastname, $age';

  /// Get user location.
  String get userLocation => '$country, $city';
}
