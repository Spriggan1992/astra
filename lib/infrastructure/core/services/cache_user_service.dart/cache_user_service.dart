import 'package:astra_app/domain/core/services/i_cache_user_service.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:injectable/injectable.dart';

/// Represent service for getting user profile information.
@LazySingleton(as: ICacheUserService)
class CacheUserService extends ICacheUserService {
  late Profile _userProfile;

  @override
  void setUserProfile(Profile userProfile) {
    _userProfile = userProfile;
  }

  @override
  Profile get userProfile => _userProfile;
}
