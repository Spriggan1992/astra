import 'package:astra_app/chats/chat/application/chat_bloc.dart';
import 'package:astra_app/chats/chat/presentation/widgets/chat_screen_content.dart';
import 'package:astra_app/core/application/enums/loading_states.dart';
import 'package:astra_app/chats/chats/domain/chat_model.dart';
import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_app/injection.dart';
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
      create: (context) => getIt<ChatBloc>()
        ..add(
          ChatEvent.initialized(chatModel),
        ),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state.loadingStates == LoadingStates.noConnectionFailure) {
            return ErrorScreen(
              failure: const AstraFailure.noConnection(),
              onTryAgain: () {
                context.read<ChatBloc>().add(ChatEvent.initialized(chatModel));
              },
            );
          } else if (state.loadingStates == LoadingStates.unexpectedFailure) {
            return ErrorScreen(
              failure: const AstraFailure.api(),
              onTryAgain: () {
                context.read<ChatBloc>().add(ChatEvent.initialized(chatModel));
              },
            );
          } else {
            return ChatScreenContent(chatModel: chatModel);
          }
        },
      ),
    );
  }
}
