import 'package:astra_app/domain/core/models/image_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'curator_model.freezed.dart';

/// Represent information about curator.
@freezed
class CuratorModel with _$CuratorModel {
  const CuratorModel._();
  const factory CuratorModel({
    /// Curator identifier.
    required int id,

    /// Curator email to display.
    required String email,

    /// Curator phone number .
    required int phoneNumber,

    /// Curator firstname to display.
    required String firstname,

    /// Curator lastname to display.
    required String lastname,

    /// Curator patronyc to display.
    required String patronyc,

    /// Curator country to display.
    required String country,

    /// Curator city to display.
    required String city,

    /// Curator profile photo to display.
    required ImageModel profilePhoto,
  }) = _CuratorModel;
  factory CuratorModel.empty() => CuratorModel(
        id: 0,
        email: '',
        phoneNumber: 0,
        firstname: '',
        lastname: '',
        patronyc: '',
        country: '',
        city: '',
        profilePhoto: ImageModel.empty(),
      );

  /// Gets curator fullname.
  String get curatorFullname => "$firstname $lastname";

}
