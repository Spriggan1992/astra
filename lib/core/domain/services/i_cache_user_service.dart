import 'package:astra_app/core/domain/models/profile_model.dart';

/// Describes the user information service.
abstract class ICacheUserService {
  /// Returns user profile.
  ProfileModel get userProfile;

  /// Set user profile.
  ///
  /// `userProfile` User profile.
  void setUserProfile(ProfileModel userProfile);
}
