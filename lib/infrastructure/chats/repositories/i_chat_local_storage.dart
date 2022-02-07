import 'package:astra_app/infrastructure/chats/DTOs/websocket_message_dto.dart';

abstract class IChatLocalStorage {
  Future<bool> isNotEmpty();
  Future<void> save(WebsocketMessageDTO dto);
  Future<List<Map<String, dynamic>>> read();
}
