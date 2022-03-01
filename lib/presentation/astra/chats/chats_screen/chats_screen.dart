import 'package:astra_app/application/chats/chats_bloc.dart';
import 'package:astra_app/application/chats/delete_statuses.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chats_content.dart';

/// Represent screens with displaying chats.
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Сообщения',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: const Color.fromRGBO(31, 31, 31, 1),
                fontSize: 17,
              ),
        ),
      ),
      body: BlocConsumer<ChatsBloc, ChatsState>(
        listener: (context, state) {
          if (state.deleteStatus == DeleteStatus.failure) {
            context.read<ChatsBloc>().add(const ChatsEvent.chatsUpdated());
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
              onRefresh: () async =>
                  context.read<ChatsBloc>().add(const ChatsEvent.chatsLoaded()),
              child: ChatsContent(state: state));
        },
      ),
    );
  }
}
