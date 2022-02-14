part of 'store_bloc.dart';

/// Defines states for store screen.
@freezed
class StoreState with _$StoreState {
  /// Initial states loaded.
  const factory StoreState.initial() = _Initial;

  /// Progress loading states.
  const factory StoreState.loadInProgress() = _LoadInProgress;

  /// Successfule loaded data state.
  ///
  /// Keep state of list [Like] if loaded successfully.
  const factory StoreState.loadSuccess(List<Like> likes) = _LoadSuccess;

  /// Unsuccessfully loaded data state.
  const factory StoreState.loadFailure(AstraFailure failure) = _LoadFailure;
}
