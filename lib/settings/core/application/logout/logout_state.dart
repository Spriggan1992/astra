part of 'logout_cubit.dart';

@freezed
@injectable
class LogoutState with _$LogoutState {
  const factory LogoutState({
    /// Whether the user can logout.
    required bool canLogout,
  }) = _Initial;
  factory LogoutState.initial() => const LogoutState(
        canLogout: false,
      );
}
