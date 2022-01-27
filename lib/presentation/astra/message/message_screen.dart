import 'package:astra_app/application/chat/chat_list/chat_list_cubit.dart';
import 'package:astra_app/infrastructure/chat/models/chat/message.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/buttons/dialog_action_button.dart';
import 'package:astra_app/presentation/core/widgets/custom/platform.activity_indicator.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/dialog_two_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_screen.dart';
import 'message_list_tile.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
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
        body: BlocBuilder<ChatListCubit, ChatListState>(
          bloc: context.read<ChatListCubit>()..getChats(),
          builder: (context, state) {
            if (state.status == ChatListStatus.initial) {
              return const Center(child: PlatformActivityIndicator());
            } else if (state.status == ChatListStatus.error) {
              //TODO widget fo failure?
              return Center(child: Text(state.failure.message));
            } else {
              return ListView.builder(
                itemCount: state.chats.length,
                itemBuilder: (context, index) {
                  final Message lastMessage = state.chats[index]
                      .messages[state.chats[index].messages.length - 1];

                  return Dismissible(
                    key: ValueKey(state.chats[index]),
                    onDismissed: (direction) {
                      context
                          .read<ChatListCubit>()
                          .removeChat(state.chats[index].id);
                    },
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
                        builder: (BuildContext context) {
                          return DialogTwoActions(
                            content: const Text(
                              'Вы точно хотите удалить диалог?',
                              textAlign: TextAlign.center,
                            ),
                            action1: DialogActionButton(
                              onClick: () => Navigator.of(context).pop(false),
                              title: 'Отмена',
                            ),
                            action2: DialogActionButton(
                              onClick: () => Navigator.of(context).pop(true),
                              title: 'Удалить',
                              buttonStyle: TextButton.styleFrom(
                                  primary: AstraColors.red),
                            ),
                          );
                        },
                      );
                    },
                    direction: DismissDirection.endToStart,
                    child: MessageLitTile(
                      chat: state.chats[index],
                      countOfunreadMessages: 1,
                      lastMessage: lastMessage,
                      selected: false,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return MessageChatScreen(
                                chat: state.chats[index],
                                lastMessage: lastMessage);
                          },
                        ));
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
