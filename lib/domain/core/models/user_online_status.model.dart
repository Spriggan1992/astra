import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_online_status.model.freezed.dart';

/// Defines user online status model.
@freezed
class UserOnlineStatusModel with _$UserOnlineStatusModel {
  const UserOnlineStatusModel._();
  const factory UserOnlineStatusModel({
    /// Status whether the user online.
    required bool isOnline,
  }) = _UserOnlineStatusModel;

  /// Empty object.
  factory UserOnlineStatusModel.empty() => const UserOnlineStatusModel(
        isOnline: false,
      );
}
