import 'package:astra_app/domain/chats/chats_model.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Represent element of chats list.
class ChatListItem extends StatelessWidget {
  const ChatListItem(
    this.chat, {
    Key? key,
  }) : super(key: key);

  /// Information about chat.
  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ChatScreenRoute(
          chatModel: chat,
        ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            leading: AstraNetworkImage(
              height: 56,
              width: 56,
              boxShape: BoxShape.circle,
              fit: BoxFit.cover,
              imageUrl: chat.userPhoto.imageUrl,
            ),
            title: Text(
              chat.userName,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AstraColors.black,
              ),
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
                  visible: chat.lastMessage.isNotEmpty,
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
}
