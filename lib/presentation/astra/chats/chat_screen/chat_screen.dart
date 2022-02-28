import 'package:astra_app/application/chat/chat_bloc.dart';
import 'package:astra_app/application/chat/chat_wathcer/chat_watcher_bloc.dart';
import 'package:astra_app/domain/chats/models/chats_model.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/astra/chats/chat_screen/widgets/chat_screen_content.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    chatModel,
                    state.chatMessages,
                  ),
                ),
              child: ChatScreenContent(chatModel: chatModel),
            ),
          );
        },
      ),
    );
  }
}
