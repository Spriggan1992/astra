import 'package:astra_app/domain/core/user_info_service/i_user_unfo_service.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:injectable/injectable.dart';

/// Represent service for getting user profile information.
@LazySingleton(as: IUserInfoService)
class UserInfoService extends IUserInfoService {
  late Profile _userProfile;

  @override
  Profile get userProfile => _userProfile;

  @override
  void setUserProfile(Profile userProfile) {
    _userProfile = userProfile;
  }
}
