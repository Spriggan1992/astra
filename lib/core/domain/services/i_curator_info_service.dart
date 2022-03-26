import 'package:astra_app/settings/domain/profile/models/curator_model.dart';

/// Describes the curator information service.
abstract class ICuratorInfoService {
  /// Returns curator profile.
  CuratorModel get curatorProfile;

  /// Set curator profile.
  ///
  /// `userProfile` User profile.
  void setCuratorProfile(CuratorModel curatorProfile);
}
