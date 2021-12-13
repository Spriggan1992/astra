part of 'chat_list_cubit.dart';

enum ChatListStatus { initial, error, success }

class ChatListState extends Equatable {
  final List<Chat> chats;
  final Failure failure;
  final ChatListStatus status;
  const ChatListState({
    required this.chats,
    required this.failure,
    required this.status,
  });

  ChatListState copyWith({
    List<Chat>? chats,
    Failure? failure,
    ChatListStatus? status,
  }) {
    return ChatListState(
      chats: chats ?? this.chats,
      failure: failure ?? this.failure,
      status: status ?? this.status,
    );
  }

  factory ChatListState.initial() {
    return const ChatListState(
        chats: [], failure: Failure(), status: ChatListStatus.initial);
  }

  @override
  List<Object> get props => [chats, failure, status];
}
