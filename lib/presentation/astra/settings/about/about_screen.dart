import 'package:astra_app/presentation/astra/settings/about/politics_screen.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/material.dart';

import 'about_button.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  static const String routeName = '/aboutscreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const AboutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AstraAppBar(
        onPressed: () {
          Navigator.of(context).pop();
        },
        title: 'О приложении',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo_t.png'),
              const SizedBox(width: 25),
              const Text(
                'ООО Пабло \nВерсия 1.0.0',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 30),
          AboutButton(
            onTap: () {},
            title: 'Пользовательское соглашение',
          ),
          AboutButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PoliticsScreen();
                  },
                ),
              );
            },
            title: 'Политика конфиденциальности',
          ),
          AboutButton(
            onTap: () {},
            title: 'Положение по обработке \nперсональных данных',
            isBigButton: true,
          ),
        ],
      ),
    );
  }
}
