import 'dart:async';

import 'package:astra_app/application/core/extensions/sort_chats.dart';
import 'package:astra_app/domain/chats/models/chats_model.dart';
import 'package:astra_app/domain/chats/repositories/i_chats_repository.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chats_event.dart';
part 'chats_state.dart';
part 'chats_bloc.freezed.dart';

/// Represent Chats bloc.
@injectable
class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final IChatsRepository _chatRepository;
  ChatsBloc(this._chatRepository) : super(const ChatsState.initial()) {
    on<ChatsEvent>(
      (event, emit) async {
        await event.map(
          chatsLoaded: (e) async {
            emit(const ChatsState.loadInProgress());
            await Future.delayed(const Duration(milliseconds: 500));
            final response = await _chatRepository.getChats();
            emit(
              response.fold(
                (failure) => ChatsState.loadFailure(failure),
                (chats) {
                  final updatedChats = chats.sortChats;
                  return ChatsState.loadSuccess(updatedChats);
                },
              ),
            );
          },
        );
      },
    );
  }
}
