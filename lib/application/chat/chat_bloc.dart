import 'package:astra_app/domain/chats/i_chat_repository.dart';
import 'package:astra_app/domain/chats/message_model.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final IChatRepository _chatRepository;
  ChatBloc(
    this._chatRepository,
  ) : super(const ChatState.initial()) {
    on<ChatEvent>(
      (event, emit) async {
        await event.map(
          chatHistoryLoaded: (e) async {
            emit(const ChatState.loadInProgress());
            final response = await _chatRepository.getChatHisory(e.chatId);
            emit(response.fold((failure) => ChatState.loadFailure(failure),
                (messages) => ChatState.loadSuccess(messages)));
          },
        );
      },
    );
  }
}
