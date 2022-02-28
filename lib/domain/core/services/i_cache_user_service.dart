import 'package:astra_app/domain/profile/models/profile.dart';

/// Describes the user information service.
abstract class ICacheUserService {
  /// Returns user profile.
  Profile get userProfile;

  /// Set user profile.
  ///
  /// `userProfile` User profile.
  void setUserProfile(Profile userProfile);
}
