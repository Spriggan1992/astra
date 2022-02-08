import 'dart:convert';
import 'package:astra_app/domain/chats/message_model.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/infrastructure/auth/repositories/authenticator.dart';
import 'package:astra_app/domain/chats/i_chat_service.dart';
import 'package:astra_app/infrastructure/chats/DTOs/message_dto.dart';
import 'package:astra_app/infrastructure/chats/DTOs/websocket_message_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:rxdart/rxdart.dart';

/// Represent websocket chat service.
@LazySingleton(as: IChatService)
class ChatService implements IChatService {
  ChatService(
    this._authenticator,
  );

  // Authorization service.
  final Authenticator _authenticator;
  // A stream channel that communicates over a WebSocket.
  WebSocketChannel? _channel;
  // Chat id.
  int? _chatId;
  // Id requesting for chatting.
  String? _requiestId;

  @override
  Future<void> setChatId(int chatId) async {
    _chatId = chatId;
  }

  @override
  Future<void> sendMessage(String message) async {
    final dto = WebsocketMessageDTO.sendMessage(message, _requiestId!);
    _channel!.sink.add(jsonEncode(dto.toJson()));
  }

  @override
  Stream<Either<AstraFailure, MessageModel>>
      subscribeToWebsocketChennel() async* {
    if (_channel == null) {
      await _init();
    }
    yield* _channel!.stream.map(
      (event) {
        if (event != null) {
          Map<String, dynamic> jsonD = json.decode(event);
          return right(MessageDTO.fromJson(jsonD['data']).toDomain());
        } else {
          return left(const AstraFailure.api());
        }
      },
    )..onErrorReturnWith((error, stackTrace) {
        return left(const AstraFailure.api());
      });
  }

  @override
  Future<void> closeChannel() async {
    await _channel!.sink.close();
    _channel = null;
  }

  Future<void> _init() async {
    await _initializedChannel();
    await _connectToChat(_chatId!);
    await _subscribeToMessage(_chatId!);
  }

  Future<void> _initializedChannel() async {
    final token = await _authenticator.getSignedToken();
    if (token != null) {
      _requiestId = const Uuid().v4().toString();
      _channel = IOWebSocketChannel.connect(
        Uri.parse('ws://92.255.108.56:8000/ws/chat/?token=${token.access}'),
      );
    }
  }

  Future<void> _connectToChat(int chatId) async {
    _channel!.sink.add(
      jsonEncode(
        WebsocketMessageDTO.connectToChat(chatId, _requiestId!).toJson(),
      ),
    );
  }

  Future<void> _subscribeToMessage(int chatId) async {
    _channel!.sink.add(jsonEncode(
      WebsocketMessageDTO.subscribeToMsg(chatId, _requiestId!).toJson(),
    ));
  }
}
