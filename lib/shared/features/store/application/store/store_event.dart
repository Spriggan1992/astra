part of 'store_bloc.dart';

/// Store state change events.
@freezed
class StoreEvent with _$StoreEvent {
  /// Screen initialoization event.
  const factory StoreEvent.initialized() = _Initialized;
}
