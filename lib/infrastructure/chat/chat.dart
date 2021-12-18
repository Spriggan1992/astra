import 'package:astra_app/infrastructure/chat/models/chat/chat.dart';
import 'package:astra_app/infrastructure/chat/models/chat/message.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';
import 'dart:math' as math;
import 'package:dio/dio.dart';
import 'dart:developer';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
math.Random _rnd = math.Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class Chats {
  final _dio = Dio();
  Chats();

  List<Chat> _chats = [];
  List<Chat> _lastChats = [];

  get chats => _chats;

  Future fetchChats() {
    _chats = List<Chat>.generate(
      _rnd.nextInt(20),
      (index) => Chat(
        id: index,
        messages: List<Message>.generate(
          5,
          (i) => Message(
            sender: getRandomString(6),
            text: getRandomString(100),
            read: _rnd.nextBool(),
            timeSent: DateTime.now(),
          ),
        ),
      ),
    );
    return Future.delayed(const Duration(milliseconds: 500), () => {});
  }

  fetchRealChats(String token) async {
    Response<dynamic> res;
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      res = await _dio.get(Endpoints.chat.chats);
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          time: DateTime.now(), name: "Chat.fetchChats");
      // _chats.addAll(res);
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Chat.fetchChats");
      return e.response?.data;
    }
  }

  Future<Chat> getChat({required int id}) {
    Chat chat = _chats.firstWhere((element) => element.id == id);
    return Future.delayed(const Duration(milliseconds: 500), () => chat);
  }
}
