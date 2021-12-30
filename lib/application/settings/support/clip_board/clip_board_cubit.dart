import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'clip_board_state.dart';
part 'clip_board_cubit.freezed.dart';

@injectable
class ClipBoardCubit extends Cubit<ClipBoardState> {
  ClipBoardCubit() : super(ClipBoardState.initial());

  void saveData(String value) {
    Clipboard.setData(ClipboardData(text: value));
    emit(state.copyWith(copiedData: value));
  }
}
