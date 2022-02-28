import 'dart:developer';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/infrastructure/auth/repositories/authenticator.dart';
import 'package:astra_app/domain/core/services/i_user_online_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Represent websocket chat service.
@LazySingleton(as: IUserOnlineStatusService)
class UserOnlineStatusService implements IUserOnlineStatusService {
  UserOnlineStatusService(this._authenticator);

  // Authorization service.
  final Authenticator _authenticator;

  // A stream channel that communicates over a WebSocket.
  WebSocketChannel? _channel;
  @override
  Future<Either<AstraFailure, Unit>> connectToServer() async {
    final token = await _authenticator.getSignedToken();
    if (token != null) {
      try {
        _channel = IOWebSocketChannel.connect(
          Uri.parse('ws://92.255.108.56:8000/ws/?token=${token.access}'),
        );
        return right(unit);
      } on WebSocketChannelException catch (e) {
        log(e.message.toString(),
            name: 'USER_ONLINE_STATUS_EXCEPTION',
            level: 2,
            error: WebSocketChannelException);
        return left(const AstraFailure.api(2));
      }
    } else {
      return left(const AstraFailure.api(2));
    }
  }

  @override
  Future<void> closeChannel() async {
    await _channel?.sink.close();
    _channel = null;
  }
}
