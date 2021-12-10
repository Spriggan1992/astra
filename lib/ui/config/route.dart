import 'package:astra_app/ui/astra/favorite/favorite_choose_screen.dart.dart';
import 'package:astra_app/ui/astra/home_screen.dart';
import 'package:astra_app/ui/astra/profile/about/about_screen.dart';
import 'package:astra_app/ui/astra/profile/my_pofile/my_profile.dart';
import 'package:astra_app/ui/astra/profile/my_pofile/photo/image_pick_screen.dart';
import 'package:astra_app/ui/astra/profile/my_pofile/photo/show_image_full_screen.dart';
import 'package:astra_app/ui/astra/profile/support/support_screen.dart';
import 'package:astra_app/ui/astra/store_screen.dart';
import 'package:astra_app/ui/signin/enter/enter_password_screen.dart';
import 'package:astra_app/ui/signin/enter/enter_screen.dart';
import 'package:astra_app/ui/signin/finish_register_screen.dart';
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
      case EnterPasswordScreen.routeName:
        return EnterPasswordScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case FinishRegisterScreen.routeName:
        return FinishRegisterScreen.route();
      case MyProfileScreen.routeName:
        return MyProfileScreen.route();
      case ShowImageFullScreen.routeName:
        return ShowImageFullScreen.route();
      case ImagePickScreen.routeName:
        return ImagePickScreen.route();
      case FavoriteChooseScreen.routeName:
        return FavoriteChooseScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route onGenerateNestedRoute(RouteSettings settings) {
    print('nested screen ${settings.name}');
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/'),
            builder: (_) => const Scaffold());
      case MyProfileScreen.routeName:
        return MyProfileScreen.route();
      case StoreScreen.routeName:
        return StoreScreen.route();
      case SupportScreen.routeName:
        return SupportScreen.route();
      case AboutScreen.routeName:
        return AboutScreen.route();
      case FavoriteChooseScreen.routeName:
        return FavoriteChooseScreen.route();
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
