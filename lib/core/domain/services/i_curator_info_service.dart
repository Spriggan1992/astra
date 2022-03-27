/// Describes the curator information service.
import 'package:astra_app/core/domain/models/curator_model.dart';

abstract class ICuratorInfoService {
  /// Returns curator profile.
  CuratorModel get curatorProfile;

  /// Set curator profile.
  ///
  /// `userProfile` User profile.
  void setCuratorProfile(CuratorModel curatorProfile);
}
