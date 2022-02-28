import 'package:astra_app/domain/chats/models/pagination_chat_model.dart';
import 'package:astra_app/domain/chats/repositories/i_chat_repository.dart';
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
            final response = await _chatRepository.getChatHistory(e.chatId);
            emit(
              response.fold(
                (failure) => ChatState.loadFailure(failure),
                (paginationModel) => ChatState.loadSuccess(paginationModel),
              ),
            );
          },
        );
      },
    );
  }
}
