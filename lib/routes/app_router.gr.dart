// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i25;

import '../models/chat/chat.dart' as _i26;
import '../models/chat/message.dart' as _i27;
import '../ui/astra/favorite/favorite_screen.dart' as _i14;
import '../ui/astra/home_screen.dart' as _i12;
import '../ui/astra/message/chat_screen.dart' as _i18;
import '../ui/astra/message/message_screen.dart' as _i15;
import '../ui/astra/profile/about/about_screen.dart' as _i23;
import '../ui/astra/profile/my_pofile/my_profile.dart' as _i22;
import '../ui/astra/profile/my_pofile/photo/image_pick_screen.dart' as _i21;
import '../ui/astra/profile/my_pofile/photo/show_image_full_screen.dart'
    as _i20;
import '../ui/astra/profile/profile_screen.dart' as _i19;
import '../ui/astra/profile/support/support_screen.dart' as _i24;
import '../ui/astra/search/search_detail.dart' as _i17;
import '../ui/astra/search/search_screen.dart' as _i16;
import '../ui/astra/store_screen.dart' as _i8;
import '../ui/signin/enter/enter_password_screen.dart' as _i10;
import '../ui/signin/enter/enter_screen.dart' as _i9;
import '../ui/signin/finish_register_screen.dart' as _i11;
import '../ui/signin/registration/first_signin.dart' as _i1;
import '../ui/signin/registration/how_to_get_club_screen.dart' as _i4;
import '../ui/signin/registration/password_screen.dart' as _i6;
import '../ui/signin/registration/repeate_password_screen.dart' as _i7;
import '../ui/signin/registration/signin_screen.dart' as _i3;
import '../ui/signin/registration/sms_code_screen.dart' as _i5;
import '../ui/signin/splash_screen.dart' as _i2;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i25.GlobalKey<_i25.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    FirstSigninRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.FirstSignin());
    },
    SplashScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SplashScreen());
    },
    SigninScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SigninScreen());
    },
    HowToGetClubScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HowToGetClubScreen());
    },
    SmsCodeScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SmsCodeScreen());
    },
    PasswordScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.PasswordScreen());
    },
    RepeatePasswordScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RepeatePasswordScreen());
    },
    StoreScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.StoreScreen());
    },
    EnterScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.EnterScreen());
    },
    EnterPasswordScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.EnterPasswordScreen());
    },
    FinishRegisterScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.FinishRegisterScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.HomeScreen());
    },
    SearchRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.EmptyRouterPage());
    },
    FavoritesRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.FavoriteScreen());
    },
    MessageRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.MessageScreen());
    },
    SettingsRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.EmptyRouterPage());
    },
    SearchScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.SearchScreen());
    },
    SearchDetailPageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.SearchDetailPage());
    },
    MessageChatScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MessageChatScreenRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.MessageChatScreen(
              key: args.key, chat: args.chat, lastMessage: args.lastMessage));
    },
    ProfileScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.ProfileScreen());
    },
    ShowImageFullScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.ShowImageFullScreen());
    },
    ImagePickScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.ImagePickScreen());
    },
    MyProfileScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.MyProfileScreen());
    },
    AboutScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.AboutScreen());
    },
    SupportScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.SupportScreen());
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(FirstSigninRoute.name, path: '/'),
        _i13.RouteConfig(SplashScreenRoute.name, path: '/splash-screen'),
        _i13.RouteConfig(SigninScreenRoute.name, path: '/signin-screen'),
        _i13.RouteConfig(HowToGetClubScreenRoute.name,
            path: '/how-to-get-club-screen'),
        _i13.RouteConfig(SmsCodeScreenRoute.name, path: '/sms-code-screen'),
        _i13.RouteConfig(PasswordScreenRoute.name, path: '/password-screen'),
        _i13.RouteConfig(RepeatePasswordScreenRoute.name,
            path: '/repeate-password-screen'),
        _i13.RouteConfig(StoreScreenRoute.name, path: '/store-screen'),
        _i13.RouteConfig(EnterScreenRoute.name, path: '/enter-screen'),
        _i13.RouteConfig(EnterPasswordScreenRoute.name,
            path: '/enter-password-screen'),
        _i13.RouteConfig(FinishRegisterScreenRoute.name,
            path: '/finish-register-screen'),
        _i13.RouteConfig(HomeScreenRoute.name, path: '', children: [
          _i13.RouteConfig(SearchRouter.name,
              path: 'searche',
              parent: HomeScreenRoute.name,
              children: [
                _i13.RouteConfig(SearchScreenRoute.name,
                    path: '', parent: SearchRouter.name),
                _i13.RouteConfig(SearchDetailPageRoute.name,
                    path: ':searchDetailPage', parent: SearchRouter.name)
              ]),
          _i13.RouteConfig(FavoritesRouter.name,
              path: '', parent: HomeScreenRoute.name),
          _i13.RouteConfig(MessageRouter.name,
              path: 'message',
              parent: HomeScreenRoute.name,
              children: [
                _i13.RouteConfig(MessageChatScreenRoute.name,
                    path: '', parent: MessageRouter.name)
              ]),
          _i13.RouteConfig(SettingsRouter.name,
              path: 'settings',
              parent: HomeScreenRoute.name,
              children: [
                _i13.RouteConfig(ProfileScreenRoute.name,
                    path: '', parent: SettingsRouter.name),
                _i13.RouteConfig(ShowImageFullScreenRoute.name,
                    path: ':showImageFullScreen', parent: SettingsRouter.name),
                _i13.RouteConfig(ImagePickScreenRoute.name,
                    path: ':imagePickScreen', parent: SettingsRouter.name),
                _i13.RouteConfig(MyProfileScreenRoute.name,
                    path: ':myProfileScreen', parent: SettingsRouter.name),
                _i13.RouteConfig(AboutScreenRoute.name,
                    path: ':aboutScreen', parent: SettingsRouter.name),
                _i13.RouteConfig(SupportScreenRoute.name,
                    path: ':supportScreen', parent: SettingsRouter.name)
              ])
        ])
      ];
}

/// generated route for [_i1.FirstSignin]
class FirstSigninRoute extends _i13.PageRouteInfo<void> {
  const FirstSigninRoute() : super(name, path: '/');

  static const String name = 'FirstSigninRoute';
}

/// generated route for [_i2.SplashScreen]
class SplashScreenRoute extends _i13.PageRouteInfo<void> {
  const SplashScreenRoute() : super(name, path: '/splash-screen');

  static const String name = 'SplashScreenRoute';
}

/// generated route for [_i3.SigninScreen]
class SigninScreenRoute extends _i13.PageRouteInfo<void> {
  const SigninScreenRoute() : super(name, path: '/signin-screen');

  static const String name = 'SigninScreenRoute';
}

/// generated route for [_i4.HowToGetClubScreen]
class HowToGetClubScreenRoute extends _i13.PageRouteInfo<void> {
  const HowToGetClubScreenRoute()
      : super(name, path: '/how-to-get-club-screen');

  static const String name = 'HowToGetClubScreenRoute';
}

/// generated route for [_i5.SmsCodeScreen]
class SmsCodeScreenRoute extends _i13.PageRouteInfo<void> {
  const SmsCodeScreenRoute() : super(name, path: '/sms-code-screen');

  static const String name = 'SmsCodeScreenRoute';
}

/// generated route for [_i6.PasswordScreen]
class PasswordScreenRoute extends _i13.PageRouteInfo<void> {
  const PasswordScreenRoute() : super(name, path: '/password-screen');

  static const String name = 'PasswordScreenRoute';
}

/// generated route for [_i7.RepeatePasswordScreen]
class RepeatePasswordScreenRoute extends _i13.PageRouteInfo<void> {
  const RepeatePasswordScreenRoute()
      : super(name, path: '/repeate-password-screen');

  static const String name = 'RepeatePasswordScreenRoute';
}

/// generated route for [_i8.StoreScreen]
class StoreScreenRoute extends _i13.PageRouteInfo<void> {
  const StoreScreenRoute() : super(name, path: '/store-screen');

  static const String name = 'StoreScreenRoute';
}

/// generated route for [_i9.EnterScreen]
class EnterScreenRoute extends _i13.PageRouteInfo<void> {
  const EnterScreenRoute() : super(name, path: '/enter-screen');

  static const String name = 'EnterScreenRoute';
}

/// generated route for [_i10.EnterPasswordScreen]
class EnterPasswordScreenRoute extends _i13.PageRouteInfo<void> {
  const EnterPasswordScreenRoute()
      : super(name, path: '/enter-password-screen');

  static const String name = 'EnterPasswordScreenRoute';
}

/// generated route for [_i11.FinishRegisterScreen]
class FinishRegisterScreenRoute extends _i13.PageRouteInfo<void> {
  const FinishRegisterScreenRoute()
      : super(name, path: '/finish-register-screen');

  static const String name = 'FinishRegisterScreenRoute';
}

/// generated route for [_i12.HomeScreen]
class HomeScreenRoute extends _i13.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i13.PageRouteInfo>? children})
      : super(name, path: '', initialChildren: children);

  static const String name = 'HomeScreenRoute';
}

/// generated route for [_i13.EmptyRouterPage]
class SearchRouter extends _i13.PageRouteInfo<void> {
  const SearchRouter({List<_i13.PageRouteInfo>? children})
      : super(name, path: 'searche', initialChildren: children);

  static const String name = 'SearchRouter';
}

/// generated route for [_i14.FavoriteScreen]
class FavoritesRouter extends _i13.PageRouteInfo<void> {
  const FavoritesRouter() : super(name, path: '');

  static const String name = 'FavoritesRouter';
}

/// generated route for [_i15.MessageScreen]
class MessageRouter extends _i13.PageRouteInfo<void> {
  const MessageRouter({List<_i13.PageRouteInfo>? children})
      : super(name, path: 'message', initialChildren: children);

  static const String name = 'MessageRouter';
}

/// generated route for [_i13.EmptyRouterPage]
class SettingsRouter extends _i13.PageRouteInfo<void> {
  const SettingsRouter({List<_i13.PageRouteInfo>? children})
      : super(name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for [_i16.SearchScreen]
class SearchScreenRoute extends _i13.PageRouteInfo<void> {
  const SearchScreenRoute() : super(name, path: '');

  static const String name = 'SearchScreenRoute';
}

/// generated route for [_i17.SearchDetailPage]
class SearchDetailPageRoute extends _i13.PageRouteInfo<void> {
  const SearchDetailPageRoute() : super(name, path: ':searchDetailPage');

  static const String name = 'SearchDetailPageRoute';
}

/// generated route for [_i18.MessageChatScreen]
class MessageChatScreenRoute
    extends _i13.PageRouteInfo<MessageChatScreenRouteArgs> {
  MessageChatScreenRoute(
      {_i25.Key? key,
      required _i26.Chat chat,
      required _i27.Message lastMessage})
      : super(name,
            path: '',
            args: MessageChatScreenRouteArgs(
                key: key, chat: chat, lastMessage: lastMessage));

  static const String name = 'MessageChatScreenRoute';
}

class MessageChatScreenRouteArgs {
  const MessageChatScreenRouteArgs(
      {this.key, required this.chat, required this.lastMessage});

  final _i25.Key? key;

  final _i26.Chat chat;

  final _i27.Message lastMessage;

  @override
  String toString() {
    return 'MessageChatScreenRouteArgs{key: $key, chat: $chat, lastMessage: $lastMessage}';
  }
}

/// generated route for [_i19.ProfileScreen]
class ProfileScreenRoute extends _i13.PageRouteInfo<void> {
  const ProfileScreenRoute() : super(name, path: '');

  static const String name = 'ProfileScreenRoute';
}

/// generated route for [_i20.ShowImageFullScreen]
class ShowImageFullScreenRoute extends _i13.PageRouteInfo<void> {
  const ShowImageFullScreenRoute() : super(name, path: ':showImageFullScreen');

  static const String name = 'ShowImageFullScreenRoute';
}

/// generated route for [_i21.ImagePickScreen]
class ImagePickScreenRoute extends _i13.PageRouteInfo<void> {
  const ImagePickScreenRoute() : super(name, path: ':imagePickScreen');

  static const String name = 'ImagePickScreenRoute';
}

/// generated route for [_i22.MyProfileScreen]
class MyProfileScreenRoute extends _i13.PageRouteInfo<void> {
  const MyProfileScreenRoute() : super(name, path: ':myProfileScreen');

  static const String name = 'MyProfileScreenRoute';
}

/// generated route for [_i23.AboutScreen]
class AboutScreenRoute extends _i13.PageRouteInfo<void> {
  const AboutScreenRoute() : super(name, path: ':aboutScreen');

  static const String name = 'AboutScreenRoute';
}

/// generated route for [_i24.SupportScreen]
class SupportScreenRoute extends _i13.PageRouteInfo<void> {
  const SupportScreenRoute() : super(name, path: ':supportScreen');

  static const String name = 'SupportScreenRoute';
}
