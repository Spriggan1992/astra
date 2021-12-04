import 'package:astra_app/ui/astra/profile/about/politics_screen.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AstraAppBar(
        onPressed: () {},
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
          CustomBtn(
            onTap: () {},
            title: 'Пользовательское соглашение',
          ),
          CustomBtn(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PoliticsScreen();
                  },
                ),
              );
            },
            title: 'Политика конфиденциальности',
          ),
          CustomBtn(
            onTap: () {},
            title: 'Положение по обработке \nперсональных данных',
            isBigButton: true,
          ),
        ],
      ),
    );
  }
}

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {Key? key,
      required this.title,
      required this.onTap,
      this.isBigButton = false})
      : super(key: key);

  final String title;
  final VoidCallback onTap;
  final bool isBigButton;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: OutlinedButton(
        onPressed: onTap,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Color.fromRGBO(24, 24, 24, 1),
            ),
          ),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(20),
          ),
          elevation: MaterialStateProperty.all(2),
          side: MaterialStateProperty.all(
            BorderSide.none,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          minimumSize: MaterialStateProperty.all(Size(
              MediaQuery.of(context).size.width / 1.5,
              (isBigButton) ? 66 : 50)),
          maximumSize: MaterialStateProperty.all(Size(
              MediaQuery.of(context).size.width / 1.5,
              (isBigButton) ? 75 : 55)),
        ),
      ),
    );
  }
}
