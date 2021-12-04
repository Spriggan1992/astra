import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_pick_screen.dart';

class EditMyProfileScreen extends StatelessWidget {
  const EditMyProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AstraAppBar(
        onPressed: () {},
        title: 'Мой профиль',
        actions: [
          TextButton(
            onPressed: () {},
            child: const Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(50),
                alignment: Alignment.center,
                // width: 250,
                // height: 250,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/girl.png',
                    ).image,
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ImagePickScreen();
                        },
                      ),
                    );
                  },
                  icon: Icon(
                    CupertinoIcons.photo_camera,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLines: 3,
                initialValue:
                    'На свете нет ни одного человека, который бы не мечтал. Я не стала исключением, в моей голове создавались образы прекрасного будущего.',
                style: TextStyle(
                  color: Color.fromRGBO(24, 24, 24, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Осталось символов: 4',
                style: TextStyle(
                  color: Color.fromRGBO(222, 66, 66, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
                          border: Border.all(
                              color: Color.fromRGBO(24, 24, 24, 0.1)),
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
                          border: Border.all(
                              color: Color.fromRGBO(24, 24, 24, 0.1)),
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
            ],
          ),
        ),
      ),
    );
  }
}
