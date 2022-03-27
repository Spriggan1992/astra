import 'package:astra_app/chats/chats/application/chats_bloc.dart';
import 'package:astra_app/chats/chats/application/enums/chats_loading_statuses.dart';
import 'package:astra_app/chats/chats/presentation/chat_list_item.dart';
import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/widgets/buttons/dialog_action_button.dart';
import 'package:astra_app/core/presentation/widgets/dialogs/dialog_two_actions.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/error_screens/empty_data_screen.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/loading_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsContent extends StatelessWidget {
  final ChatsState state;
  const ChatsContent({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.loadingStatuses == ChatLoadingStatuses.loading) {
      return const LoadingScreen();
    } else if (state.loadingStatuses == ChatLoadingStatuses.connectionFailure) {
      return ErrorScreen(
        failure: const AstraFailure.noConnection(),
        onTryAgain: () {
          context.read<ChatsBloc>().add(const ChatsEvent.chatsLoaded());
        },
      );
    } else if (state.loadingStatuses == ChatLoadingStatuses.unexpectedFailure) {
      return ErrorScreen(
        failure: const AstraFailure.api(),
        onTryAgain: () {
          context.read<ChatsBloc>().add(const ChatsEvent.chatsLoaded());
        },
      );
    } else {
      if (state.chats.isNotEmpty) {
        return ListView.builder(
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
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
                          context.read<ChatsBloc>().add(
                              ChatsEvent.chatDeleted(state.chats[index].id));
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
              child: ChatListItem(state.chats[index], chats: state.chats),
            );
          },
        );
      } else {
        return CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Center(
                child: EmptyDataScreen(),
              ),
            ),
          ],
        );
      }
    }
  }
}
