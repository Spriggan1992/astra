import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';

/// Represent user data.
@freezed
class UserData with _$UserData {
  const UserData._();
  const factory UserData({
    /// User name.
    required String name,
  }) = _UserData;
  factory UserData.empty() => const UserData(
        name: "",
      );
}
