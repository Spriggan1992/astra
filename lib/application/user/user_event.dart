part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  /// Initialized user event.
  const factory UserEvent.initialized() = _Initialized;

  /// Start to watch updates user info event.
  const factory UserEvent.userUpdatesWatched() = _UserUpdatesWatched;

  /// Connection to the websocket channel event.
  const factory UserEvent.userStatusOnlineUpdated(bool isOnline) =
      _UserOnlineStatusConnected;
}
