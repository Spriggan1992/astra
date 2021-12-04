import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';
import 'message_list_tile.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          'Сообщения',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: const Color.fromRGBO(31, 31, 31, 1),
                fontSize: 17,
              ),
        ),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key('key'),
            onDismissed: (direction) {
              //   setState(() {
              //     items.removeAt(index);
              //   });
              //   Scaffold.of(context)
              //       .showSnackBar(SnackBar(content: Text("$item dismissed")));
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
                    children: <Widget>[
                      Icon(Icons.delete_outline, color: Colors.white),
                      Text('Удалить',
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ],
                  ),
                ),
              ),
            ),
            confirmDismiss: (DismissDirection direction) async {
              // return await showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return DeleteDialog(
              //       title: const Text(
              //         "Вы точно хотите удалить диалог?",
              //         style:
              //             TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              //       ),
              //       actions: <Widget>[
              //         TextButton(
              //           onPressed: () => Navigator.of(context).pop(false),
              //           child: const Text("Отмена"),
              //         ),
              //         const SizedBox(
              //           height: 25,
              //           child: VerticalDivider(
              //             color: Color.fromRGBO(24, 24, 24, 0.1),
              //             width: 1,
              //             thickness: 2,
              //           ),
              //         ),
              //         TextButton(
              //           onPressed: () => Navigator.of(context).pop(true),
              //           child: const Text(
              //             "Удалить",
              //             style: TextStyle(color: Colors.red),
              //           ),
              //         ),
              //       ],
              //     );
              //   },
              // );
            },
            direction: DismissDirection.endToStart,
            child: MessageLitTile(
              selected: false,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return MessageChatScreen();
                  },
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
