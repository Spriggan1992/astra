import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AstraAppBar(
        onPressed: () {},
        title: 'Поддержка',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.error_outline,
              size: 25,
              color: Color.fromRGBO(24, 24, 24, 0.6),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
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
                  radius: 28,
                  backgroundColor: Color.fromRGBO(24, 24, 24, 1),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 26,
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
            // const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(29, 46, 86, 0.05),
                borderRadius: BorderRadius.circular(14),
              ),
              height: 66,
              child: Row(
                children: [
                  const Text(
                    'timtampereaqw@gmail.com',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(24, 24, 24, 1)),
                  ),
                  const Expanded(
                    child: VerticalDivider(
                      color: Color.fromRGBO(24, 24, 24, 0.1),
                      width: 50,
                      thickness: 2,
                      //endIndent: 10,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Копировать',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(24, 24, 24, 1)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Вы можете оставить заявку вашему \nкуратору, либо отправить \nсообщение на email.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(24, 24, 24, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
