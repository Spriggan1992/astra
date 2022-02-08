import 'package:astra_app/domain/chats/message_model.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:dartz/dartz.dart';

/// Describe websocket chat service.
abstract class IChatService {
  /// Sends the [message] to websocket chennel.
  Future<void> sendMessage(String message);

  /// Sibscribes to websocket channel for reciving messages in real time.
  Stream<Either<AstraFailure, MessageModel>> subscribeToWebsocketChennel();

  /// Sets the [chatId] with which the connection will be established.
  Future<void> setChatId(int chatId);

  /// Close websocket chennel.
  Future<void> closeChannel();

  // Future<void> setOfflineData<T>(T data);
}
