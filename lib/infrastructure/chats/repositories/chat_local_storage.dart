import 'package:astra_app/infrastructure/chats/DTOs/websocket_message_dto.dart';
import 'package:astra_app/infrastructure/core/database/sembast/sembast_database.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';

import 'i_chat_local_storage.dart';

@LazySingleton(as: IChatLocalStorage)
class ChatLocalStorage implements IChatLocalStorage {
  final SembastDatabase _db;
  final _store = stringMapStoreFactory.store('message');

  ChatLocalStorage(this._db);
  @override
  Future<bool> isNotEmpty() async {
    final response = await _store.find(_db.instance);
    return response.isNotEmpty;
  }

  @override
  Future<void> save(WebsocketMessageDTO dto) async {
    await _store.add(_db.instance, dto.toJson());
  }

  @override
  Future<List<Map<String, dynamic>>> read() async {
    final result = await _store.find(_db.instance);
    if (result.isNotEmpty) {
      return result.map((e) => e.value).toList();
    } else {
      return [];
    }
  }
}
