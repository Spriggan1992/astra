import 'package:astra_app/core/presentation/routes/app_router.gr.dart';
import 'package:astra_app/core/presentation/widgets/logo.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'about_button.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);
  static const String _baseUri = "http://92.255.108.56:8000/info";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AstraAppBar(
        onPressed: () => context.router.pop(),
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
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 5,
                child: const Logo(),
              ),
              const SizedBox(width: 25),
              const Text(
                'ООО Пабло \nВерсия 1.0.0',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          AboutButton(
            onTap: () => context.router.push(PoliticsScreenRoute(
              title: "Пользовательское соглашение",
              uri: "$_baseUri/end-user-license/",
            )),
            title: 'Пользовательское соглашение',
          ),
          AboutButton(
            onTap: () => context.router.push(PoliticsScreenRoute(
              title: "Политика конфиденциальности",
              uri: "$_baseUri/confidential/",
            )),
            title: 'Политика конфиденциальности',
          ),
          AboutButton(
            onTap: () => context.router.push(PoliticsScreenRoute(
              title: "Положение по обработке персональных данных",
              uri: "$_baseUri/personal-data/",
            )),
            title: 'Положение по обработке персональных данных',
          ),
        ],
      ),
    );
  }
}
