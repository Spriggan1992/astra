import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:dartz/dartz.dart';

/// Describes service for defines whether user online or not.
abstract class IUserOnlineStatusService {
  /// Sets connection to the server to determine user online status.
  Future<Either<AstraFailure, Unit>> connectToServer();

  /// Close websocket channel.
  Future<void> closeChannel();
}
