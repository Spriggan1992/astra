import 'package:astra_app/application/chat/chat_bloc.dart';
import 'package:astra_app/application/chat/chat_wathcer/chat_watcher_bloc.dart';
import 'package:astra_app/domain/chats/chats_model.dart';
import 'package:astra_app/domain/chats/message_model.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:grouped_list/grouped_list.dart';

import 'chat_bottom_bar.dart';
import 'message_box.dart';

/// Represent chat between two users.
class ChatScreen extends StatelessWidget {
  const ChatScreen({
    Key? key,
    required this.chatModel,
  }) : super(key: key);

  /// Information about chat.
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ChatBloc>()..add(ChatEvent.chatHistoryLoaded(chatModel.id)),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const SizedBox.shrink(),
            loadInProgress: (_) => const LoadingScreen(),
            loadFailure: (state) => ErrorScreen(
              failure: state.failure,
              onTryAgain: () {
                context
                    .read<ChatBloc>()
                    .add(ChatEvent.chatHistoryLoaded(chatModel.id));
              },
            ),
            loadSuccess: (state) => BlocProvider(
              create: (context) => getIt<ChatWatcherBloc>()
                ..add(
                  ChatWatcherEvent.initialized(
                      chatModel.id, state.chatMessages),
                ),
              child: ChatScreenContent(chatModel: chatModel),
            ),
          );
        },
      ),
    );
  }
}

class ChatScreenContent extends StatelessWidget {
  const ChatScreenContent({
    Key? key,
    required this.chatModel,
  }) : super(key: key);

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: Column(
            children: [
              Text(
                chatModel.userName,
                style: const TextStyle(color: AstraColors.black),
              ),
              BlocSelector<ChatWatcherBloc, ChatWatcherState, bool>(
                selector: (state) => state.hasConnection,
                builder: (context, hasConnection) {
                  return Visibility(
                    visible: !hasConnection,
                    child: const Text(
                      'Ожидание сети...',
                      style: TextStyle(color: AstraColors.grey, fontSize: 12),
                    ),
                  );
                },
              )
            ],
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.black87,
              size: 35,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: AstraNetworkImage(
                width: 32,
                boxShape: BoxShape.circle,
                fit: BoxFit.cover,
                imageUrl: chatModel.userPhoto.imageUrl,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            BlocBuilder<ChatWatcherBloc, ChatWatcherState>(
              builder: (context, state) {
                return Expanded(
                  child: GroupedListView(
                    reverse: true,
                    sort: false,
                    elements: state.chatMessages,
                    groupBy: (MessageModel element) => element.messageTime?.day,
                    itemBuilder: (context, MessageModel element) {
                      return MessageBox(
                        messageModel: element,
                        isMe: element.isMe,
                        isLoadingMessage: element.loadingMessageState,
                      );
                    },
                    groupHeaderBuilder: (MessageModel element) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          element.gropuedTimePostedMessage,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: AstraColors.black06),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const ChatBottomBar(),
          ],
        ),
      ),
    );
  }
}
