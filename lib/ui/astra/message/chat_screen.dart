import 'package:astra_app/models/chat/chat.dart';
import 'package:astra_app/models/chat/message.dart';
import 'package:astra_app/ui/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_item.dart';

class MessageChatScreen extends StatelessWidget {
  const MessageChatScreen(
      {Key? key, required this.chat, required this.lastMessage})
      : super(key: key);

  final Chat chat;
  final Message lastMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //child:
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.black87,
            size: 35,
          ),
        ),
        title: Column(
          children: [
            Text(
              lastMessage.sender,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: const Color.fromRGBO(31, 31, 31, 1),
                    fontSize: 17,
                  ),
            ),
            Text(
              'в сети',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.green,
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: chat.messages.length,
            itemBuilder: (context, index) {
              final message = chat.messages[index];
              return ChatItemCard(
                  sent: true, text: message.text, timeSent: message.time);
            },
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: _EnterMessageWidget(),
          ),
        ],
      ),
    );
  }
}

class _EnterMessageWidget extends StatefulWidget {
  const _EnterMessageWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_EnterMessageWidget> createState() => _EnterMessageWidgetState();
}

class _EnterMessageWidgetState extends State<_EnterMessageWidget> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(217, 191, 131, 0.8),
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(30, 49, 90, 1),
                Color.fromRGBO(24, 38, 71, 1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          right: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: (_controller.text.isNotEmpty)
                    ? MediaQuery.of(context).size.width - 80
                    : MediaQuery.of(context).size.width - 32,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    isDense: true,
                    fillColor: AstraColors.white01,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    hintText: 'Cooбщение',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide.none),
                    filled: true,
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              Visibility(
                visible: _controller.text.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(251, 251, 251, 0.2),
                    radius: 15,
                    child: Image.asset(
                      'assets/paper_plane.png',
                      color: Colors.white,
                      scale: 0.9,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
