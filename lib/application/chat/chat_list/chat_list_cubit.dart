import 'package:astra_app/domain/core/failure/failure.dart';
import 'package:astra_app/infrastructure/chat/chat.dart';
import 'package:astra_app/infrastructure/chat/models/chat/chat.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_list_state.dart';

class ChatListCubit extends Cubit<ChatListState> {
  ChatListCubit() : super(ChatListState.initial()) {}

  void getChats() async {
    final chats = Chats();

    await chats.fetchChats();

    emit(state.copyWith(chats: chats.chats, status: ChatListStatus.success));
  }

  void removeChat(int chatId) {
    state.chats.removeWhere((element) => element.id == chatId);
    emit(state);
  }
}
