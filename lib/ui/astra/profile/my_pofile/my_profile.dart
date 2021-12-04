import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../show_image_full_screen.dart';
import 'edit_my_profile_screen.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AstraAppBar(
        onPressed: () {},
        title: 'Мой профиль',
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EditMyProfileScreen();
                  },
                ),
              );
            },
            child: Image.asset('assets/icons/pencil.png'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ShowImageFullScreen();
                    },
                  ),
                );
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/left_girl.png'),
                        const SizedBox(width: 40),
                        Image.asset('assets/right_girl.png'),
                      ],
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width / 7 - 30,
                    top: -20,
                    child: Image.asset('assets/middle_girl.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Август Августин, 30',
              style: TextStyle(
                color: Color.fromRGBO(24, 24, 24, 1),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            _DescriptionWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'На счету:',
                    style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 0.4),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '4 лайка',
                    style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(24, 24, 24, 0.1),
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Отображать подробную анкету',
                    style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 0.4),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    height: 22,
                    width: 44,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromRGBO(24, 24, 24, 0.1)),
                        borderRadius: BorderRadius.circular(22)),
                    child: Switch(
                      value: true,
                      onChanged: (value) {},
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white,
                      activeColor: Color.fromRGBO(217, 191, 100, 1),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(24, 24, 24, 0.1),
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Скрыть профиль',
                    style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 0.4),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    height: 22,
                    width: 44,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromRGBO(24, 24, 24, 0.1)),
                        borderRadius: BorderRadius.circular(22)),
                    child: Switch(
                      value: false,
                      onChanged: (value) {},
                      inactiveTrackColor: Colors.white,
                      activeTrackColor: Colors.white,
                      activeColor: Color.fromRGBO(217, 191, 100, 1),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(24, 24, 24, 0.1),
              thickness: 1,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: Image.asset('assets/right_girl.png').image,
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Алексей Муховец',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(24, 24, 24, 1)),
                    ),
                    Text(
                      'Куратор',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(24, 24, 24, 0.6),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 4),
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color.fromRGBO(24, 24, 24, 1),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 19,
                    child: Icon(CupertinoIcons.paperplane),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Divider(
                color: Color.fromRGBO(24, 24, 24, 0.1),
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Краткое описание:',
            style: TextStyle(
              color: Color.fromRGBO(24, 24, 24, 0.4),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'На свете нет ни одного человека, который бы не мечтал. Я не стала исключением, в моей голове создавались образы прекрасного будущего.dsa..',
            style: TextStyle(
              color: Color.fromRGBO(24, 24, 24, 1),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
