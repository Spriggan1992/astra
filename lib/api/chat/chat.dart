import 'package:astra_app/models/models.dart';
import 'package:dio/dio.dart';
import 'dart:math';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class Chats {
  Chats();
  
  List<Chat> _chats = [];

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

  Future<Chat> getChat({required int id}) {
    Chat chat = _chats.firstWhere((element) => element.id == id);
    return Future.delayed(const Duration(milliseconds: 500), () => chat);
  }
}
