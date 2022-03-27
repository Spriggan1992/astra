part of 'support_bloc.dart';

@freezed
class SupportEvent with _$SupportEvent {
  /// Support screen loaded state change event.
  const factory SupportEvent.supportLoaded() = _ProfileLoaded;
}
