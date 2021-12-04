import 'package:astra_app/ui/astra/profile/support_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../store_screen.dart';
import 'about/about_screen.dart';
import 'my_pofile/my_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
          'Настройки',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: const Color.fromRGBO(31, 31, 31, 1),
                fontSize: 17,
              ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Color.fromRGBO(240, 241, 243, 1),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              leading: CircleAvatar(
                radius: 40,
                backgroundImage: Image.asset('assets/right_girl.png').image,
              ),
              title: Text(
                'Август Августин, 30',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(24, 24, 24, 1)),
              ),
              subtitle: Text(
                'Россия, Москва',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(24, 24, 24, 0.6),
                ),
              ),
            ),
          ),
          Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 28),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return MyProfileScreen();
                    },
                  ));
                },
                leading: Icon(
                  Icons.person,
                  color: Color.fromRGBO(206, 206, 206, 1),
                  size: 30,
                ),
                title: Text(
                  'Мой профиль',
                  style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Divider(
                height: 1,
                color: Color.fromRGBO(24, 24, 24, 0.1),
                thickness: 1,
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 28),
                leading: Icon(
                  CupertinoIcons.square_favorites,
                  color: Color.fromRGBO(206, 206, 206, 1),
                  size: 30,
                ),
                title: Text(
                  'Моя анкета',
                  style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Divider(
                height: 1,
                color: Color.fromRGBO(24, 24, 24, 0.1),
                thickness: 1,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return StoreScreen();
                    },
                  ));
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 28),
                leading: Icon(
                  Icons.shopping_cart_outlined,
                  color: Color.fromRGBO(206, 206, 206, 1),
                  size: 30,
                ),
                title: Text(
                  'Магазин',
                  style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Divider(
                height: 1,
                color: Color.fromRGBO(24, 24, 24, 0.1),
                thickness: 1,
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 28),
                leading: Icon(
                  CupertinoIcons.exclamationmark_circle_fill,
                  color: Color.fromRGBO(206, 206, 206, 1),
                  size: 30,
                ),
                title: Text(
                  'Обучение',
                  style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Divider(
                height: 1,
                color: Color.fromRGBO(24, 24, 24, 0.1),
                thickness: 1,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return SupportScreen();
                    },
                  ));
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 28),
                leading: Icon(
                  Icons.support_outlined,
                  color: Color.fromRGBO(206, 206, 206, 1),
                  size: 30,
                ),
                title: Text(
                  'Поддержка',
                  style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Divider(
                height: 1,
                color: Color.fromRGBO(24, 24, 24, 0.1),
                thickness: 1,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return AboutScreen();
                    },
                  ));
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 28),
                leading: Icon(
                  CupertinoIcons.news,
                  color: Color.fromRGBO(206, 206, 206, 1),
                  size: 30,
                ),
                title: Text(
                  'О приложении',
                  style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Divider(
                height: 1,
                color: Color.fromRGBO(24, 24, 24, 0.1),
                thickness: 1,
              ),
              ListTile(
                onTap: () async {
                  // final result = await showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return DeleteDialog(
                  //       title: const Text(
                  //         "Вы точно хотите удалить диалог?",
                  //         style: TextStyle(
                  //             fontSize: 15, fontWeight: FontWeight.w600),
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
                  //             "Выйти",
                  //             style: TextStyle(color: Colors.red),
                  //           ),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // );
                  //TODO
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 28),
                leading: Icon(
                  CupertinoIcons.arrow_right_square,
                  color: Color.fromRGBO(206, 206, 206, 1),
                  size: 30,
                ),
                title: Text(
                  'Выйти',
                  style: TextStyle(
                      color: Color.fromRGBO(222, 66, 66, 1),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Divider(
                height: 1,
                color: Color.fromRGBO(24, 24, 24, 0.1),
                thickness: 1,
              )
            ],
          )
        ],
      ),
    );
  }
}
