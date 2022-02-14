part of 'my_profile_bloc.dart';

/// Defines states for MyProfileScreen.
@freezed
class MyProfileState with _$MyProfileState {
  /// Initial states loaded.
  const factory MyProfileState.initial() = _Initial;

  /// Progress loading states.
  const factory MyProfileState.loadInProgress() = _LoadInProgress;

  /// Successfule loaded data state.
  ///
  /// Keep state of [Profile] if loaded successfully.
  const factory MyProfileState.loadSuccess(
          Profile profile, Wallet walletInfo, CuratorModel curatorInfo) =
      _LoadSuccess;

  /// Unsuccessfully loaded data state.
  const factory MyProfileState.loadFailure(AstraFailure failure) = _LoadFailure;
}
