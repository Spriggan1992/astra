import 'package:astra_app/core/domain/models/curator_model.dart';
import 'package:astra_app/core/domain/services/i_curator_info_service.dart';
import 'package:injectable/injectable.dart';

/// Represent service for getting user profile information.
@LazySingleton(as: ICuratorInfoService)
class CuratorInfoService extends ICuratorInfoService {
  late CuratorModel _curatorProfile;

  @override
  CuratorModel get curatorProfile => _curatorProfile;

  @override
  void setCuratorProfile(CuratorModel curatorProfile) {
    _curatorProfile = curatorProfile;
  }
}
