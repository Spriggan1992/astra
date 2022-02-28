import 'package:astra_app/application/chats/chats_bloc.dart';
import 'package:astra_app/application/chats/chats_watcher/chats_watcher_bloc.dart';
import 'package:astra_app/application/chats/chats_watcher/delete_status.dart';
import 'package:astra_app/domain/chats/models/chats_model.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/buttons/dialog_action_button.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/dialog_two_actions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_list_item.dart';

/// Represent chats screen content.
class ChatsScreenContent extends StatelessWidget {
  const ChatsScreenContent(
    this.chats, {
    Key? key,
  }) : super(key: key);

  /// Available chats for current user.
  final List<ChatModel> chats;

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
      body: BlocConsumer<ChatsWatcherBloc, ChatsWatcherState>(
        listener: (context, state) {
          if (state.deleteStatus == DeleteStatus.unsuccess) {
            context.read<ChatsBloc>().add(const ChatsEvent.chatsLoaded());
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async =>
                context.read<ChatsBloc>().add(const ChatsEvent.chatsLoaded()),
            child: ListView.builder(
              itemCount: state.chats.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(state.chats[index]),
                  background: Container(color: Colors.red),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.delete_outline, color: Colors.white),
                            Text('Удалить',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  confirmDismiss: (DismissDirection direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext _) {
                        return DialogTwoActions(
                          content: const Text(
                            'Вы точно хотите удалить диалог?',
                            textAlign: TextAlign.center,
                          ),
                          action1: DialogActionButton(
                            onClick: () => context.router.pop(false),
                            title: 'Отмена',
                          ),
                          action2: DialogActionButton(
                            onClick: () {
                              context.read<ChatsWatcherBloc>().add(
                                  ChatsWatcherEvent.chatDeleted(
                                      state.chats[index].id));
                              context.router.pop(true);
                            },
                            title: 'Удалить',
                            buttonStyle:
                                TextButton.styleFrom(primary: AstraColors.red),
                          ),
                        );
                      },
                    );
                  },
                  direction: DismissDirection.endToStart,
                  child: ChatListItem(state.chats[index], chats: chats),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
