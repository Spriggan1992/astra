import 'package:astra_app/application/chats/chats_bloc.dart';

import 'package:astra_app/presentation/core/widgets/scaffolds/error_screens/error_screen.dart';
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
          loadFailure: (_) => ErrorScreen(onTryAgain: () {}),
          loadInProgress: (_) => const LoadingScreen(),
          loadSuccess: (state) {
            return ChatsScreenContent(state.chats);
          },
        );
      },
    );
  }
}
