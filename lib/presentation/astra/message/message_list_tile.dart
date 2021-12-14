import 'package:astra_app/infrastructure/chat/models/chat/chat.dart';
import 'package:astra_app/infrastructure/chat/models/chat/message.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

class MessageLitTile extends StatelessWidget {
  const MessageLitTile({
    Key? key,
    required this.selected,
    required this.onTap,
    required this.chat,
    required this.lastMessage,
    required this.countOfunreadMessages,
  }) : super(key: key);

  final bool selected;
  final VoidCallback onTap;
  final Chat chat;
  final Message lastMessage;
  final int countOfunreadMessages;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: (selected) ? const Color.fromRGBO(240, 241, 243, 1) : Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            onTap: onTap,
            // isThreeLine: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            leading: CircleAvatar(
                backgroundImage: Image.asset('assets/right_girl.png').image),
            title: Text(
              lastMessage.sender,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AstraColors.black,
              ),
            ),
            subtitle: Text(
              lastMessage.text,
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
                Text(lastMessage.time),
                Visibility(
                  visible: selected,
                  child: CircleAvatar(
                    maxRadius: 10,
                    backgroundColor: AstraColors.blue06,
                    child: Text(
                      "$countOfunreadMessages",
                      style: const TextStyle(
                          color: AstraColors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: AstraColors.black01)
        ],
      ),
    );
  }
}
