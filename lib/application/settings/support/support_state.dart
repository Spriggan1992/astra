part of 'support_bloc.dart';

@freezed
class SupportState with _$SupportState {
  /// Initial states loaded.
  const factory SupportState.initial() = _Initial;

  /// Progress loading states.
  const factory SupportState.loadInProgress() = _LoadInProgress;

  /// Successfule loaded data state.
  ///
  /// Keep state of [Profile] if loaded successfully.
  const factory SupportState.loadSuccess(CuratorModel curatorInfo) =
      _LoadSuccess;

  /// Unsuccessfully loaded data state.
  const factory SupportState.loadFailure() = _LoadFailure;
}
