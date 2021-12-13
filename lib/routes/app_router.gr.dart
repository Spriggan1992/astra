// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

import '../ui/astra/favorite/favorite_choose_screen.dart.dart' as _i16;
import '../ui/astra/home_screen.dart' as _i11;
import '../ui/astra/profile/my_pofile/my_profile.dart' as _i13;
import '../ui/astra/profile/my_pofile/photo/image_pick_screen.dart' as _i15;
import '../ui/astra/profile/my_pofile/photo/show_image_full_screen.dart'
    as _i14;
import '../ui/astra/store_screen.dart' as _i8;
import '../ui/signin/enter/enter_password_screen.dart' as _i10;
import '../ui/signin/enter/enter_screen.dart' as _i9;
import '../ui/signin/finish_register_screen.dart' as _i12;
import '../ui/signin/registration/first_signin.dart' as _i1;
import '../ui/signin/registration/how_to_get_club_screen.dart' as _i4;
import '../ui/signin/registration/password_screen.dart' as _i6;
import '../ui/signin/registration/repeate_password_screen.dart' as _i7;
import '../ui/signin/registration/signin_screen.dart' as _i3;
import '../ui/signin/registration/sms_code_screen.dart' as _i5;
import '../ui/signin/splash_screen.dart' as _i2;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    FirstSigninRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.FirstSignin());
    },
    SplashScreenRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SplashScreen());
    },
    SigninScreenRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SigninScreen());
    },
    HowToGetClubScreenRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HowToGetClubScreen());
    },
    SmsCodeScreenRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SmsCodeScreen());
    },
    PasswordScreenRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.PasswordScreen());
    },
    RepeatePasswordScreenRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RepeatePasswordScreen());
    },
    StoreScreenRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.StoreScreen());
    },
    EnterScreenRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.EnterScreen());
    },
    EnterPasswordScreenRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.EnterPasswordScreen());
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.HomeScreen(key: args.key));
    },
    FinishRegisterScreenRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.FinishRegisterScreen());
    },
    MyProfileScreenRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.MyProfileScreen());
    },
    ShowImageFullScreenRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ShowImageFullScreen());
    },
    ImagePickScreenRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.ImagePickScreen());
    },
    FavoriteChooseScreenRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.FavoriteChooseScreen());
    }
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(FirstSigninRoute.name, path: '/'),
        _i17.RouteConfig(SplashScreenRoute.name, path: '/splash-screen'),
        _i17.RouteConfig(SigninScreenRoute.name, path: '/signin-screen'),
        _i17.RouteConfig(HowToGetClubScreenRoute.name,
            path: '/how-to-get-club-screen'),
        _i17.RouteConfig(SmsCodeScreenRoute.name, path: '/sms-code-screen'),
        _i17.RouteConfig(PasswordScreenRoute.name, path: '/password-screen'),
        _i17.RouteConfig(RepeatePasswordScreenRoute.name,
            path: '/repeate-password-screen'),
        _i17.RouteConfig(StoreScreenRoute.name, path: '/store-screen'),
        _i17.RouteConfig(EnterScreenRoute.name, path: '/enter-screen'),
        _i17.RouteConfig(EnterPasswordScreenRoute.name,
            path: '/enter-password-screen'),
        _i17.RouteConfig(HomeScreenRoute.name, path: '/home-screen'),
        _i17.RouteConfig(FinishRegisterScreenRoute.name,
            path: '/finish-register-screen'),
        _i17.RouteConfig(MyProfileScreenRoute.name, path: '/my-profile-screen'),
        _i17.RouteConfig(ShowImageFullScreenRoute.name,
            path: '/show-image-full-screen'),
        _i17.RouteConfig(ImagePickScreenRoute.name, path: '/image-pick-screen'),
        _i17.RouteConfig(FavoriteChooseScreenRoute.name,
            path: '/favorite-choose-screen')
      ];
}

/// generated route for [_i1.FirstSignin]
class FirstSigninRoute extends _i17.PageRouteInfo<void> {
  const FirstSigninRoute() : super(name, path: '/');

  static const String name = 'FirstSigninRoute';
}

/// generated route for [_i2.SplashScreen]
class SplashScreenRoute extends _i17.PageRouteInfo<void> {
  const SplashScreenRoute() : super(name, path: '/splash-screen');

  static const String name = 'SplashScreenRoute';
}

/// generated route for [_i3.SigninScreen]
class SigninScreenRoute extends _i17.PageRouteInfo<void> {
  const SigninScreenRoute() : super(name, path: '/signin-screen');

  static const String name = 'SigninScreenRoute';
}

/// generated route for [_i4.HowToGetClubScreen]
class HowToGetClubScreenRoute extends _i17.PageRouteInfo<void> {
  const HowToGetClubScreenRoute()
      : super(name, path: '/how-to-get-club-screen');

  static const String name = 'HowToGetClubScreenRoute';
}

/// generated route for [_i5.SmsCodeScreen]
class SmsCodeScreenRoute extends _i17.PageRouteInfo<void> {
  const SmsCodeScreenRoute() : super(name, path: '/sms-code-screen');

  static const String name = 'SmsCodeScreenRoute';
}

/// generated route for [_i6.PasswordScreen]
class PasswordScreenRoute extends _i17.PageRouteInfo<void> {
  const PasswordScreenRoute() : super(name, path: '/password-screen');

  static const String name = 'PasswordScreenRoute';
}

/// generated route for [_i7.RepeatePasswordScreen]
class RepeatePasswordScreenRoute extends _i17.PageRouteInfo<void> {
  const RepeatePasswordScreenRoute()
      : super(name, path: '/repeate-password-screen');

  static const String name = 'RepeatePasswordScreenRoute';
}

/// generated route for [_i8.StoreScreen]
class StoreScreenRoute extends _i17.PageRouteInfo<void> {
  const StoreScreenRoute() : super(name, path: '/store-screen');

  static const String name = 'StoreScreenRoute';
}

/// generated route for [_i9.EnterScreen]
class EnterScreenRoute extends _i17.PageRouteInfo<void> {
  const EnterScreenRoute() : super(name, path: '/enter-screen');

  static const String name = 'EnterScreenRoute';
}

/// generated route for [_i10.EnterPasswordScreen]
class EnterPasswordScreenRoute extends _i17.PageRouteInfo<void> {
  const EnterPasswordScreenRoute()
      : super(name, path: '/enter-password-screen');

  static const String name = 'EnterPasswordScreenRoute';
}

/// generated route for [_i11.HomeScreen]
class HomeScreenRoute extends _i17.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({_i18.Key? key})
      : super(name, path: '/home-screen', args: HomeScreenRouteArgs(key: key));

  static const String name = 'HomeScreenRoute';
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}

/// generated route for [_i12.FinishRegisterScreen]
class FinishRegisterScreenRoute extends _i17.PageRouteInfo<void> {
  const FinishRegisterScreenRoute()
      : super(name, path: '/finish-register-screen');

  static const String name = 'FinishRegisterScreenRoute';
}

/// generated route for [_i13.MyProfileScreen]
class MyProfileScreenRoute extends _i17.PageRouteInfo<void> {
  const MyProfileScreenRoute() : super(name, path: '/my-profile-screen');

  static const String name = 'MyProfileScreenRoute';
}

/// generated route for [_i14.ShowImageFullScreen]
class ShowImageFullScreenRoute extends _i17.PageRouteInfo<void> {
  const ShowImageFullScreenRoute()
      : super(name, path: '/show-image-full-screen');

  static const String name = 'ShowImageFullScreenRoute';
}

/// generated route for [_i15.ImagePickScreen]
class ImagePickScreenRoute extends _i17.PageRouteInfo<void> {
  const ImagePickScreenRoute() : super(name, path: '/image-pick-screen');

  static const String name = 'ImagePickScreenRoute';
}

/// generated route for [_i16.FavoriteChooseScreen]
class FavoriteChooseScreenRoute extends _i17.PageRouteInfo<void> {
  const FavoriteChooseScreenRoute()
      : super(name, path: '/favorite-choose-screen');

  static const String name = 'FavoriteChooseScreenRoute';
}
