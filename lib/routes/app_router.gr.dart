// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i22;

import '../models/models.dart' as _i23;
import '../ui/astra/favorite/favorite_screen.dart' as _i11;
import '../ui/astra/home_screen.dart' as _i9;
import '../ui/astra/message/chat_screen.dart' as _i15;
import '../ui/astra/message/message_screen.dart' as _i12;
import '../ui/astra/profile/about/about_screen.dart' as _i20;
import '../ui/astra/profile/my_pofile/my_profile.dart' as _i19;
import '../ui/astra/profile/my_pofile/photo/image_pick_screen.dart' as _i18;
import '../ui/astra/profile/my_pofile/photo/show_image_full_screen.dart'
    as _i17;
import '../ui/astra/profile/profile_screen.dart' as _i16;
import '../ui/astra/profile/support/support_screen.dart' as _i21;
import '../ui/astra/search/search_detail.dart' as _i14;
import '../ui/astra/search/search_screen.dart' as _i13;
import '../ui/astra/store_screen.dart' as _i7;
import '../ui/auth/code_screen.dart' as _i4;
import '../ui/auth/confirm_password_screen.dart' as _i6;
import '../ui/auth/how_to_get_club_screen.dart' as _i3;
import '../ui/auth/password_screen.dart' as _i5;
import '../ui/auth/phone_number_screen.dart' as _i2;
import '../ui/auth/splash_screen.dart' as _i1;
import '../ui/auth/widgets/finish_register_screen.dart' as _i8;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i22.GlobalKey<_i22.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    PhoneNumberScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.PhoneNumberScreen());
    },
    HowToGetClubScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HowToGetClubScreen());
    },
    CodeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CodeScreenRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.CodeScreen(key: args.key, phoneNumber: args.phoneNumber));
    },
    PasswordScreenRoute.name: (routeData) {
      final args = routeData.argsAs<PasswordScreenRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.PasswordScreen(
              key: args.key, phoneNumber: args.phoneNumber, code: args.code));
    },
    ConfirmPasswordScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmPasswordScreenRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.ConfirmPasswordScreen(
              key: args.key,
              phoneNumber: args.phoneNumber,
              confirmePassword: args.confirmePassword));
    },
    StoreScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.StoreScreen());
    },
    FinishRegisterScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.FinishRegisterScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.HomeScreen());
    },
    SearchRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.EmptyRouterPage());
    },
    FavoritesRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.FavoriteScreen());
    },
    MessageRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.MessageScreen());
    },
    SettingsRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.EmptyRouterPage());
    },
    SearchScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.SearchScreen());
    },
    SearchDetailPageRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.SearchDetailPage());
    },
    MessageChatScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MessageChatScreenRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.MessageChatScreen(
              key: args.key, chat: args.chat, lastMessage: args.lastMessage));
    },
    ProfileScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.ProfileScreen());
    },
    ShowImageFullScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.ShowImageFullScreen());
    },
    ImagePickScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.ImagePickScreen());
    },
    MyProfileScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.MyProfileScreen());
    },
    AboutScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.AboutScreen());
    },
    SupportScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.SupportScreen());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i10.RouteConfig(PhoneNumberScreenRoute.name,
            path: '/phone-number-screen'),
        _i10.RouteConfig(HowToGetClubScreenRoute.name,
            path: '/how-to-get-club-screen'),
        _i10.RouteConfig(CodeScreenRoute.name, path: '/code-screen'),
        _i10.RouteConfig(PasswordScreenRoute.name, path: '/password-screen'),
        _i10.RouteConfig(ConfirmPasswordScreenRoute.name,
            path: '/confirm-password-screen'),
        _i10.RouteConfig(StoreScreenRoute.name, path: '/store-screen'),
        _i10.RouteConfig(FinishRegisterScreenRoute.name,
            path: '/finish-register-screen'),
        _i10.RouteConfig(HomeScreenRoute.name, path: '', children: [
          _i10.RouteConfig(SearchRouter.name,
              path: 'searche',
              parent: HomeScreenRoute.name,
              children: [
                _i10.RouteConfig(SearchScreenRoute.name,
                    path: '', parent: SearchRouter.name),
                _i10.RouteConfig(SearchDetailPageRoute.name,
                    path: ':searchDetailPage', parent: SearchRouter.name)
              ]),
          _i10.RouteConfig(FavoritesRouter.name,
              path: '', parent: HomeScreenRoute.name),
          _i10.RouteConfig(MessageRouter.name,
              path: 'message',
              parent: HomeScreenRoute.name,
              children: [
                _i10.RouteConfig(MessageChatScreenRoute.name,
                    path: '', parent: MessageRouter.name)
              ]),
          _i10.RouteConfig(SettingsRouter.name,
              path: 'settings',
              parent: HomeScreenRoute.name,
              children: [
                _i10.RouteConfig(ProfileScreenRoute.name,
                    path: '', parent: SettingsRouter.name),
                _i10.RouteConfig(ShowImageFullScreenRoute.name,
                    path: ':showImageFullScreen', parent: SettingsRouter.name),
                _i10.RouteConfig(ImagePickScreenRoute.name,
                    path: ':imagePickScreen', parent: SettingsRouter.name),
                _i10.RouteConfig(MyProfileScreenRoute.name,
                    path: ':myProfileScreen', parent: SettingsRouter.name),
                _i10.RouteConfig(AboutScreenRoute.name,
                    path: ':aboutScreen', parent: SettingsRouter.name),
                _i10.RouteConfig(SupportScreenRoute.name,
                    path: ':supportScreen', parent: SettingsRouter.name)
              ])
        ])
      ];
}

/// generated route for [_i1.SplashScreen]
class SplashScreenRoute extends _i10.PageRouteInfo<void> {
  const SplashScreenRoute() : super(name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for [_i2.PhoneNumberScreen]
class PhoneNumberScreenRoute extends _i10.PageRouteInfo<void> {
  const PhoneNumberScreenRoute() : super(name, path: '/phone-number-screen');

  static const String name = 'PhoneNumberScreenRoute';
}

/// generated route for [_i3.HowToGetClubScreen]
class HowToGetClubScreenRoute extends _i10.PageRouteInfo<void> {
  const HowToGetClubScreenRoute()
      : super(name, path: '/how-to-get-club-screen');

  static const String name = 'HowToGetClubScreenRoute';
}

/// generated route for [_i4.CodeScreen]
class CodeScreenRoute extends _i10.PageRouteInfo<CodeScreenRouteArgs> {
  CodeScreenRoute({_i22.Key? key, required String phoneNumber})
      : super(name,
            path: '/code-screen',
            args: CodeScreenRouteArgs(key: key, phoneNumber: phoneNumber));

  static const String name = 'CodeScreenRoute';
}

class CodeScreenRouteArgs {
  const CodeScreenRouteArgs({this.key, required this.phoneNumber});

  final _i22.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'CodeScreenRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for [_i5.PasswordScreen]
class PasswordScreenRoute extends _i10.PageRouteInfo<PasswordScreenRouteArgs> {
  PasswordScreenRoute(
      {_i22.Key? key, required String phoneNumber, String? code})
      : super(name,
            path: '/password-screen',
            args: PasswordScreenRouteArgs(
                key: key, phoneNumber: phoneNumber, code: code));

  static const String name = 'PasswordScreenRoute';
}

class PasswordScreenRouteArgs {
  const PasswordScreenRouteArgs(
      {this.key, required this.phoneNumber, this.code});

  final _i22.Key? key;

  final String phoneNumber;

  final String? code;

  @override
  String toString() {
    return 'PasswordScreenRouteArgs{key: $key, phoneNumber: $phoneNumber, code: $code}';
  }
}

/// generated route for [_i6.ConfirmPasswordScreen]
class ConfirmPasswordScreenRoute
    extends _i10.PageRouteInfo<ConfirmPasswordScreenRouteArgs> {
  ConfirmPasswordScreenRoute(
      {_i22.Key? key,
      required String phoneNumber,
      required String confirmePassword})
      : super(name,
            path: '/confirm-password-screen',
            args: ConfirmPasswordScreenRouteArgs(
                key: key,
                phoneNumber: phoneNumber,
                confirmePassword: confirmePassword));

  static const String name = 'ConfirmPasswordScreenRoute';
}

class ConfirmPasswordScreenRouteArgs {
  const ConfirmPasswordScreenRouteArgs(
      {this.key, required this.phoneNumber, required this.confirmePassword});

  final _i22.Key? key;

  final String phoneNumber;

  final String confirmePassword;

  @override
  String toString() {
    return 'ConfirmPasswordScreenRouteArgs{key: $key, phoneNumber: $phoneNumber, confirmePassword: $confirmePassword}';
  }
}

/// generated route for [_i7.StoreScreen]
class StoreScreenRoute extends _i10.PageRouteInfo<void> {
  const StoreScreenRoute() : super(name, path: '/store-screen');

  static const String name = 'StoreScreenRoute';
}

/// generated route for [_i8.FinishRegisterScreen]
class FinishRegisterScreenRoute extends _i10.PageRouteInfo<void> {
  const FinishRegisterScreenRoute()
      : super(name, path: '/finish-register-screen');

  static const String name = 'FinishRegisterScreenRoute';
}

/// generated route for [_i9.HomeScreen]
class HomeScreenRoute extends _i10.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i10.PageRouteInfo>? children})
      : super(name, path: '', initialChildren: children);

  static const String name = 'HomeScreenRoute';
}

/// generated route for [_i10.EmptyRouterPage]
class SearchRouter extends _i10.PageRouteInfo<void> {
  const SearchRouter({List<_i10.PageRouteInfo>? children})
      : super(name, path: 'searche', initialChildren: children);

  static const String name = 'SearchRouter';
}

/// generated route for [_i11.FavoriteScreen]
class FavoritesRouter extends _i10.PageRouteInfo<void> {
  const FavoritesRouter() : super(name, path: '');

  static const String name = 'FavoritesRouter';
}

/// generated route for [_i12.MessageScreen]
class MessageRouter extends _i10.PageRouteInfo<void> {
  const MessageRouter({List<_i10.PageRouteInfo>? children})
      : super(name, path: 'message', initialChildren: children);

  static const String name = 'MessageRouter';
}

/// generated route for [_i10.EmptyRouterPage]
class SettingsRouter extends _i10.PageRouteInfo<void> {
  const SettingsRouter({List<_i10.PageRouteInfo>? children})
      : super(name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for [_i13.SearchScreen]
class SearchScreenRoute extends _i10.PageRouteInfo<void> {
  const SearchScreenRoute() : super(name, path: '');

  static const String name = 'SearchScreenRoute';
}

/// generated route for [_i14.SearchDetailPage]
class SearchDetailPageRoute extends _i10.PageRouteInfo<void> {
  const SearchDetailPageRoute() : super(name, path: ':searchDetailPage');

  static const String name = 'SearchDetailPageRoute';
}

/// generated route for [_i15.MessageChatScreen]
class MessageChatScreenRoute
    extends _i10.PageRouteInfo<MessageChatScreenRouteArgs> {
  MessageChatScreenRoute(
      {_i22.Key? key,
      required _i23.Chat chat,
      required _i23.Message lastMessage})
      : super(name,
            path: '',
            args: MessageChatScreenRouteArgs(
                key: key, chat: chat, lastMessage: lastMessage));

  static const String name = 'MessageChatScreenRoute';
}

class MessageChatScreenRouteArgs {
  const MessageChatScreenRouteArgs(
      {this.key, required this.chat, required this.lastMessage});

  final _i22.Key? key;

  final _i23.Chat chat;

  final _i23.Message lastMessage;

  @override
  String toString() {
    return 'MessageChatScreenRouteArgs{key: $key, chat: $chat, lastMessage: $lastMessage}';
  }
}

/// generated route for [_i16.ProfileScreen]
class ProfileScreenRoute extends _i10.PageRouteInfo<void> {
  const ProfileScreenRoute() : super(name, path: '');

  static const String name = 'ProfileScreenRoute';
}

/// generated route for [_i17.ShowImageFullScreen]
class ShowImageFullScreenRoute extends _i10.PageRouteInfo<void> {
  const ShowImageFullScreenRoute() : super(name, path: ':showImageFullScreen');

  static const String name = 'ShowImageFullScreenRoute';
}

/// generated route for [_i18.ImagePickScreen]
class ImagePickScreenRoute extends _i10.PageRouteInfo<void> {
  const ImagePickScreenRoute() : super(name, path: ':imagePickScreen');

  static const String name = 'ImagePickScreenRoute';
}

/// generated route for [_i19.MyProfileScreen]
class MyProfileScreenRoute extends _i10.PageRouteInfo<void> {
  const MyProfileScreenRoute() : super(name, path: ':myProfileScreen');

  static const String name = 'MyProfileScreenRoute';
}

/// generated route for [_i20.AboutScreen]
class AboutScreenRoute extends _i10.PageRouteInfo<void> {
  const AboutScreenRoute() : super(name, path: ':aboutScreen');

  static const String name = 'AboutScreenRoute';
}

/// generated route for [_i21.SupportScreen]
class SupportScreenRoute extends _i10.PageRouteInfo<void> {
  const SupportScreenRoute() : super(name, path: ':supportScreen');

  static const String name = 'SupportScreenRoute';
}
