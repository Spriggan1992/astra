import 'package:astra_app/models/models.dart';
import 'package:dio/dio.dart';
// import 'dart:math';
import 'package:astra_app/api/api.dart';
import 'dart:developer';

// const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
// Random _rnd = Random();

// String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
//     length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class Chats {
  late final Dio _dio;
  
  final List<Chat> _chats = [];

  get chats => _chats;

  Future fetchChats(String token) async {
    Response<dynamic> res;
    try {
      res = await _dio.get(Endpoints.chat.chats, options: Options(headers: {"Authorization": "Bearer $token"}));
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          name: "Chat.fetchChats");
      _chats.clear();
      res.data.forEach((el) => {
        _chats.add(Chat.fromJson(el))
      });
      // _chats = res.data;
      // return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Chat.fetchChats");
      return e.response?.data;
    }
  }

  Future<Chat> getChat({required int id}) async {
    Chat chat = _chats.firstWhere((element) => element.id == id);
    return Future.delayed(const Duration(milliseconds: 500), () => chat);
  }

  // Future sendMessage(String token, String message) async {
  //
  // }
}
