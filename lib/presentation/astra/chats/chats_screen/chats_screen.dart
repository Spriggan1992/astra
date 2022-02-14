import 'package:astra_app/application/chats/chats_bloc.dart';
import 'package:astra_app/application/chats/chats_watcher/chats_watcher_bloc.dart';
import 'package:astra_app/injection.dart';

import 'package:astra_app/presentation/core/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chats_screen_content.dart';

/// Represent screens with displaying chats.
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadFailure: (state) => ErrorScreen(
            failure: state.failure,
            onTryAgain: () {
              context.read<ChatsBloc>().add(const ChatsEvent.chatsLoaded());
            },
          ),
          loadInProgress: (_) => const LoadingScreen(),
          loadSuccess: (state) {
            return BlocProvider(
              create: (context) => getIt<ChatsWatcherBloc>()
                ..add(const ChatsWatcherEvent.watchStarted()),
              child: ChatsScreenContent(state.chats),
            );
          },
        );
      },
    );
  }
}
