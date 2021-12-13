import 'package:astra_app/infrastructure/core/helpers/server_address.dart';

class Endpoints {
  static get auth => _AuthEndpoints();
  static get chat => _ChatEndpoints();
  static get feed => _FeedEndpoints();
  static get shop => _ShopEndpoints();
  static get user => _ProfileEndpoints();
}

final String _address = ServerAddress().relevant;

class _AuthEndpoints {
  String get checkPhone => _address + "user/auth/check/phone/";
  String get login => _address + "user/auth/login/";
  String get passwordReset => _address + "user/auth/reset/create/";
  String get checkResetToken => _address + "user/auth/reset/check/";
  String get resetPassword => _address + "user/auth/reset/password/";
}

class _ChatEndpoints {
  String get chats => _address + "user/chat/";
  String getMessages(int id) => _address + "user/chat/$id/";
  String sendMessage(int id) => _address + "user/chat/$id/send/";
  String get curatorChat => _address + "user/chat/curator/";
  String get createPassword => _address + "auth/reset/password/";
}

class _FeedEndpoints {
  // todo feed endpoints
}

class _ShopEndpoints {
  // todo shop endpoints
}

class _ProfileEndpoints {
  // todo profile endpoints
}
