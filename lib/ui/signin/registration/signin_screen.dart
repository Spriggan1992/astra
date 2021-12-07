import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/config/gradients.dart';
import 'package:astra_app/ui/glodal/widgets/buttons/astra_button.dart';
import 'package:astra_app/ui/glodal/widgets/logo.dart';
import 'package:astra_app/ui/signin/registration/first_signin.dart';
import 'package:astra_app/ui/signin/registration/how_to_get_club_screen.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  static const String routeName = '/signin';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SigninScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              // image: DecorationImage(image: Image.asset('assets/logo.png').image),
              gradient: LinearGradient(
                colors: Gradients.blueGradient,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                tileMode: TileMode.decal,
                stops: [0.0, 1.0],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AstraButton(
                  title: 'Войти',
                  onTap: () {
                    Navigator.of(context).pushNamed(FirstSignin.routeName);
                  },
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: true,
                        side: MaterialStateBorderSide.resolveWith(
                          (states) =>
                              const BorderSide(width: 1.0, color: Colors.white),
                        ),
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => AstraColors.blue),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        checkColor: Colors.white,
                        onChanged: (value) {},
                      ),
                      const Text(
                        'Оставаться в системе',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(HowToGetClubScreen.routeName);
                  },
                  child: const Text(
                    'Как попасть в клуб?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5,
            child: const Logo(logoWithText: true),
          ),
        ],
      ),
    );
  }
}
