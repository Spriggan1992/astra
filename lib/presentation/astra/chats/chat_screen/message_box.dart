import 'package:astra_app/domain/chats/message_model.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/custom/platform.activity_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Represent message box  that contains message from users.
class MessageBox extends StatelessWidget {
  const MessageBox({
    Key? key,
    required this.messageModel,
    required this.isMe,
    required this.isLoadingMessage,
  }) : super(key: key);

  /// Flag responsible for showing loading message indicator.
  final bool isLoadingMessage;

  /// Flag responsible for displaying message from the current user or the user who sent message to current user.
  final bool isMe;

  /// Message information.
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: isMe ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: isMe ? AstraColors.messageBoxColor : AstraColors.blue),
        margin: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: isMe ? 16 : screenWidth * 0.2,
          right: isMe ? screenWidth * 0.2 : 16,
        ),
        padding: const EdgeInsets.all(8),
        child: Wrap(
          alignment: WrapAlignment.end,
          children: [
            Text(
              messageModel.messageText,
              style: TextStyle(
                color: isMe ? AstraColors.black : AstraColors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 16),
              child: Text(
                messageModel.time,
                style: TextStyle(
                  color: isMe ? AstraColors.black06 : AstraColors.white05,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}