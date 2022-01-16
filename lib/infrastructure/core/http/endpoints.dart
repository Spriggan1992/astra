import 'package:astra_app/infrastructure/core/http/server_address.dart';

class Endpoints {
  static get auth => _AuthEndpoints();
  static get chat => _ChatEndpoints();
  static get feed => _FeedEndpoints();
  static get shop => _ShopEndpoints();
  static get user => _ProfileEndpoints();
  static get imageAdress => relevantAdress;
}

final String _address = ServerAddress().relevant;
final String relevantAdress = ServerAddress().imageAdress;

class _AuthEndpoints {
  String get checkPhone => _address + "user/auth/check/phone/";
  String get login => _address + "user/auth/login/";
  String get passwordReset => _address + "user/auth/reset/create/";
  String get checkSmsCode => _address + "user/auth/reset/check/";
  String get resetPassword => _address + "user/auth/reset/password/";
  String get refreshToken => _address + "users/auth/jwt/refresh/";
}

class _ChatEndpoints {
  String get chats => _address + "user/chat/";
  String getMessages(int id) => _address + "user/chat/$id/";
  String sendMessage(int id) => _address + "user/chat/$id/send/";
  String get curatorChat => _address + "user/chat/curator/";
}

class _FeedEndpoints {
  String get feed => _address + "user/feed/";
  String like(int id) => _address + "user/feed/like/$id/";
  String nope(int id) => _address + "user/feed/nope/$id/";
  String think(int id) => _address + "user/feed/think/$id/";
  String block(int id) => _address + "user/feed/block/$id/";
  String get getLikes => _address + "user/feed/like/";
  String get getWhoLike => _address + "user/feed/liked/";
  String get getThink => _address + "user/feed/think/";
  String get getNope => _address + "user/feed/nope/";
}

class _ShopEndpoints {
  String get purchaseItems => _address + "user/wallet/likes";
  String get userWallet => _address + "user/wallet/";
  String get walletHistory => _address + "user/wallet/history/";
  String get walletAppend => _address + "user/wallet/append/";
}

class _ProfileEndpoints {
  String get account => _address + "user/account/";
  String get accountShort => _address + "user/account/min/";
  String get hideAccount => _address + "user/account/hidden/";
  String get showAccount => _address + "user/account/unhidden/";
  String get hideAccountInfo => _address + "user/account/info/hidden/";
  String get showAccountInfo => _address + "user/account/info/show/";
  String get addPhoto => _address + "user/account/photo/add/";
  String get updatePhoto => _address + "user/account/photo/update/";
  String get deletePhoto => _address + "user/account/photo/delete/";
  String get updateShortInfo => _address + "user/account/info/short/update/";
  String get updateStatus => _address + "user/account/info/status/update/";
  String get getStatuses => _address + "user/account/info/status/";
  String get getCurator => _address + "user/account/curator/";
  String get refreshToken => _address + "users/auth/jwt/refresh/";
}
