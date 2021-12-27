part of 'clip_board_cubit.dart';

@freezed
class ClipBoardState with _$ClipBoardState {
  const factory ClipBoardState({required String copiedData}) = _ClipBoardState;
  factory ClipBoardState.initial() => const ClipBoardState(copiedData: '');
}
