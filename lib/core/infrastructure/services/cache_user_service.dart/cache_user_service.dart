import 'package:astra_app/core/domain/services/i_cache_user_service.dart';
import 'package:astra_app/core/domain/models/profile_model.dart';
import 'package:injectable/injectable.dart';

/// Represent service for getting user profile information.
@LazySingleton(as: ICacheUserService)
class CacheUserService extends ICacheUserService {
  late ProfileModel _userProfile;

  @override
  void setUserProfile(ProfileModel userProfile) {
    _userProfile = userProfile;
  }

  @override
  ProfileModel get userProfile => _userProfile;
}
