import 'package:astra_app/application/chats/chats_bloc.dart';
import 'package:astra_app/domain/chats/models/chats_model.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent element of chats list.
class ChatListItem extends StatelessWidget {
  const ChatListItem(
    this.chat, {
    Key? key,
    required this.chats,
  }) : super(key: key);

  /// Information about chat.
  final ChatModel chat;

  /// Current chats.
  final List<ChatModel> chats;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => await _navigateToChatScreen(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            tileColor: chat.newMessageCount > 0
                ? AstraColors.hasMessageColor
                : Colors.transparent,
            leading: AstraNetworkImage(
              height: 56,
              width: 56,
              boxShape: BoxShape.circle,
              fit: BoxFit.cover,
              imageUrl: chat.userPhoto.imageUrl,
            ),
            title: Row(
              children: [
                Text(
                  chat.userName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AstraColors.black,
                  ),
                ),
                Visibility(
                  visible: chat.isOnline,
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                  ),
                )
              ],
            ),
            subtitle: Text(
              chat.lastMessage,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AstraColors.black06,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(chat.time),
                Visibility(
                  visible:
                      chat.lastMessage.isNotEmpty && chat.newMessageCount > 0,
                  child: CircleAvatar(
                    maxRadius: 10,
                    backgroundColor: AstraColors.blue06,
                    child: Text(
                      "${chat.newMessageCount}",
                      style: const TextStyle(
                        color: AstraColors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: AstraColors.dividerColor,
            indent: MediaQuery.of(context).size.width * 0.22,
          ),
        ],
      ),
    );
  }

  Future<void> _navigateToChatScreen(BuildContext context) async {
    context.read<ChatsBloc>().add(const ChatsEvent.chatsUnsubscribed());
    context.router
        .push(
      ChatScreenRoute(chatModel: chat),
    )
        .then((_) {
      context.read<ChatsBloc>().add(const ChatsEvent.chatsUpdated());
      context.read<ChatsBloc>().add(const ChatsEvent.initialized());
    });
  }
}
