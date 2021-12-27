part of 'settings_bloc.dart';

/// Settings screen state change events.
@freezed
class SettingsEvent with _$SettingsEvent {
  /// Settings profile loaded state change event.
  const factory SettingsEvent.profileLoaded() = _ProfileLoaded;
}
