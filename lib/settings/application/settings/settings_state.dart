part of 'settings_bloc.dart';

/// Defines states for settings screen.
@freezed
class SettingsState with _$SettingsState {
  /// Initial states loaded.
  const factory SettingsState.initial() = _Initial;

  /// Progress loading states.
  const factory SettingsState.loadInProgress() = _LoadInProgress;

  /// Successfully loaded data state.
  ///
  /// Keep state of [Profile] if loaded successfully.
  const factory SettingsState.loadSuccess(ProfileShortModel profile) =
      _LoadSuccess;

  /// Unsuccessfully loaded data state.
  const factory SettingsState.loadFailure(AstraFailure failure) = _LoadFailure;
}
