import 'dart:async';

import 'package:astra_app/domain/core/services/i_ineternet_connection_status.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Represent service for getiing information about an internet connection.
@LazySingleton(as: IInternetConnectionService)
class InternetConnectionService implements IInternetConnectionService {
  bool _hasConnection = false;

  @override
  get hasConnection => _hasConnection;

  InternetConnectionChecker? checker = InternetConnectionChecker();

  @override
  Stream<bool> subscribeConnection() async* {
    yield* checker!.onStatusChange.map(
      (status) {
        _hasConnection = status == InternetConnectionStatus.connected;
        return _hasConnection;
      },
    );
  }

  @override
  Future<void> dispose() async {
    checker = null;
  }
}
