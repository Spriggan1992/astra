import 'package:astra_app/ui/astra/store_screen.dart';
import 'package:astra_app/ui/signin/enter/enter_screen.dart';
import 'package:astra_app/ui/signin/registration/first_signin.dart';
import 'package:astra_app/ui/signin/registration/how_to_get_club_screen.dart';
import 'package:astra_app/ui/signin/registration/password_screen.dart';
import 'package:astra_app/ui/signin/registration/repeate_password_screen.dart';
import 'package:astra_app/ui/signin/registration/signin_screen.dart';
import 'package:astra_app/ui/signin/registration/sms_code_screen.dart';
import 'package:astra_app/ui/signin/splash_screen.dart';
import 'package:flutter/material.dart';

class AstraRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/'),
            builder: (_) => const Scaffold());
      case SplashScreen.routeName:
        return SplashScreen.route();
      case SigninScreen.routeName:
        return SigninScreen.route();
      case HowToGetClubScreen.routeName:
        return HowToGetClubScreen.route();
      case FirstSignin.routeName:
        return FirstSignin.route();
      case SmsCodeScreen.routeName:
        return SmsCodeScreen.route();
      case PasswordScreen.routeName:
        return PasswordScreen.route();
      case RepeatePasswordScreen.routeName:
        return RepeatePasswordScreen.route();
      case StoreScreen.routeName:
        return StoreScreen.route();
      case EnterScreen.routeName:
        return EnterScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Что то произошло не так '),
        ),
      ),
    );
  }
}
