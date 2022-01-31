// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i25;

import '../../../domain/core/models/image_models.dart' as _i26;
import '../../../domain/profile/models/profile.dart' as _i27;
import '../../../infrastructure/chat/models/chat/chat.dart' as _i28;
import '../../../infrastructure/chat/models/chat/message.dart' as _i29;
import '../../astra/favorite/favorite_screen.dart' as _i13;
import '../../astra/favorite/user_form/user_form_screen.dart' as _i10;
import '../../astra/home_screen.dart' as _i11;
import '../../astra/message/chat_screen.dart' as _i18;
import '../../astra/message/message_screen.dart' as _i14;
import '../../astra/search/applicants/applicant_screen.dart' as _i16;
import '../../astra/search/search_page_route.dart' as _i15;
import '../../astra/search/search_screen.dart' as _i17;
import '../../astra/settings/about/about_screen.dart' as _i21;
import '../../astra/settings/my_pofile/my_profile.dart' as _i20;
import '../../astra/settings/my_pofile/photo/image_pick_screen.dart' as _i8;
import '../../astra/settings/my_pofile/photo/show_image_full_screen.dart'
    as _i9;
import '../../astra/settings/promocode/promocode_screen.dart' as _i24;
import '../../astra/settings/settings_screen.dart' as _i19;
import '../../astra/settings/support/support_screen.dart' as _i22;
import '../../astra/store/store_screen.dart' as _i23;
import '../../auth/code_screen.dart' as _i4;
import '../../auth/confirm_password_screen.dart' as _i6;
import '../../auth/how_to_get_club_screen.dart' as _i3;
import '../../auth/password_screen.dart' as _i5;
import '../../auth/phone_number_screen.dart' as _i2;
import '../../auth/splash_screen.dart' as _i1;
import '../../auth/widgets/finish_register_screen.dart' as _i7;
import '../enums/store_screen_qualifier.dart' as _i30;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i25.GlobalKey<_i25.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    PhoneNumberScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.PhoneNumberScreen());
    },
    HowToGetClubScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HowToGetClubScreen());
    },
    CodeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CodeScreenRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.CodeScreen(key: args.key, phoneNumber: args.phoneNumber));
    },
    PasswordScreenRoute.name: (routeData) {
      final args = routeData.argsAs<PasswordScreenRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.PasswordScreen(
              key: args.key, phoneNumber: args.phoneNumber, code: args.code));
    },
    ConfirmPasswordScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmPasswordScreenRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.ConfirmPasswordScreen(
              key: args.key,
              phoneNumber: args.phoneNumber,
              confirmePassword: args.confirmePassword));
    },
    FinishRegisterScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.FinishRegisterScreen());
    },
    ImagePickScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ImagePickScreen());
    },
    ShowImageFullScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ShowImageFullScreenRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.ShowImageFullScreen(key: args.key, images: args.images));
    },
    UserFormScreenRoute.name: (routeData) {
      final args = routeData.argsAs<UserFormScreenRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.UserFormScreen(key: args.key, profile: args.profile));
    },
    HomeScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.HomeScreen());
    },
    SearchRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    FavoritesRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.FavoriteScreen());
    },
    MessageRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.MessageScreen());
    },
    SettingsRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    SearchPageRouteRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.SearchPageRoute());
    },
    ApplicantScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ApplicantScreenRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i16.ApplicantScreen(
              key: args.key, applicant: args.applicant, image: args.image));
    },
    SearchScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SearchScreenRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i17.SearchScreen(key: args.key, applicants: args.applicants));
    },
    MessageChatScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MessageChatScreenRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.MessageChatScreen(
              key: args.key, chat: args.chat, lastMessage: args.lastMessage));
    },
    SettingsScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.SettingsScreen());
    },
    MyProfileScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.MyProfileScreen());
    },
    AboutScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.AboutScreen());
    },
    SupportScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.SupportScreen());
    },
    StoreScreenRoute.name: (routeData) {
      final args = routeData.argsAs<StoreScreenRouteArgs>(
          orElse: () => const StoreScreenRouteArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i23.StoreScreen(
              key: args.key, storeQualifer: args.storeQualifer));
    },
    PromocodeScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.PromocodeScreen());
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i12.RouteConfig(PhoneNumberScreenRoute.name,
            path: '/phone-number-screen'),
        _i12.RouteConfig(HowToGetClubScreenRoute.name,
            path: '/how-to-get-club-screen'),
        _i12.RouteConfig(CodeScreenRoute.name, path: '/code-screen'),
        _i12.RouteConfig(PasswordScreenRoute.name, path: '/password-screen'),
        _i12.RouteConfig(ConfirmPasswordScreenRoute.name,
            path: '/confirm-password-screen'),
        _i12.RouteConfig(FinishRegisterScreenRoute.name,
            path: '/finish-register-screen'),
        _i12.RouteConfig(ImagePickScreenRoute.name, path: '/image-pick-screen'),
        _i12.RouteConfig(ShowImageFullScreenRoute.name,
            path: '/show-image-full-screen'),
        _i12.RouteConfig(UserFormScreenRoute.name, path: '/user-form-screen'),
        _i12.RouteConfig(HomeScreenRoute.name, path: '', children: [
          _i12.RouteConfig(SearchRouter.name,
              path: 'searche',
              parent: HomeScreenRoute.name,
              children: [
                _i12.RouteConfig(SearchPageRouteRoute.name,
                    path: '', parent: SearchRouter.name),
                _i12.RouteConfig(ApplicantScreenRoute.name,
                    path: ':applicantScreen', parent: SearchRouter.name),
                _i12.RouteConfig(SearchScreenRoute.name,
                    path: ':searchScreen', parent: SearchRouter.name)
              ]),
          _i12.RouteConfig(FavoritesRouter.name,
              path: '', parent: HomeScreenRoute.name),
          _i12.RouteConfig(MessageRouter.name,
              path: 'message',
              parent: HomeScreenRoute.name,
              children: [
                _i12.RouteConfig(MessageChatScreenRoute.name,
                    path: '', parent: MessageRouter.name)
              ]),
          _i12.RouteConfig(SettingsRouter.name,
              path: 'settings',
              parent: HomeScreenRoute.name,
              children: [
                _i12.RouteConfig(SettingsScreenRoute.name,
                    path: '', parent: SettingsRouter.name),
                _i12.RouteConfig(MyProfileScreenRoute.name,
                    path: ':myProfileScreen', parent: SettingsRouter.name),
                _i12.RouteConfig(AboutScreenRoute.name,
                    path: ':aboutScreen', parent: SettingsRouter.name),
                _i12.RouteConfig(SupportScreenRoute.name,
                    path: ':supportScreen', parent: SettingsRouter.name),
                _i12.RouteConfig(StoreScreenRoute.name,
                    path: ':store', parent: SettingsRouter.name),
                _i12.RouteConfig(PromocodeScreenRoute.name,
                    path: ':promocode', parent: SettingsRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i12.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.PhoneNumberScreen]
class PhoneNumberScreenRoute extends _i12.PageRouteInfo<void> {
  const PhoneNumberScreenRoute()
      : super(PhoneNumberScreenRoute.name, path: '/phone-number-screen');

  static const String name = 'PhoneNumberScreenRoute';
}

/// generated route for
/// [_i3.HowToGetClubScreen]
class HowToGetClubScreenRoute extends _i12.PageRouteInfo<void> {
  const HowToGetClubScreenRoute()
      : super(HowToGetClubScreenRoute.name, path: '/how-to-get-club-screen');

  static const String name = 'HowToGetClubScreenRoute';
}

/// generated route for
/// [_i4.CodeScreen]
class CodeScreenRoute extends _i12.PageRouteInfo<CodeScreenRouteArgs> {
  CodeScreenRoute({_i25.Key? key, required String phoneNumber})
      : super(CodeScreenRoute.name,
            path: '/code-screen',
            args: CodeScreenRouteArgs(key: key, phoneNumber: phoneNumber));

  static const String name = 'CodeScreenRoute';
}

class CodeScreenRouteArgs {
  const CodeScreenRouteArgs({this.key, required this.phoneNumber});

  final _i25.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'CodeScreenRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i5.PasswordScreen]
class PasswordScreenRoute extends _i12.PageRouteInfo<PasswordScreenRouteArgs> {
  PasswordScreenRoute(
      {_i25.Key? key, required String phoneNumber, String? code})
      : super(PasswordScreenRoute.name,
            path: '/password-screen',
            args: PasswordScreenRouteArgs(
                key: key, phoneNumber: phoneNumber, code: code));

  static const String name = 'PasswordScreenRoute';
}

class PasswordScreenRouteArgs {
  const PasswordScreenRouteArgs(
      {this.key, required this.phoneNumber, this.code});

  final _i25.Key? key;

  final String phoneNumber;

  final String? code;

  @override
  String toString() {
    return 'PasswordScreenRouteArgs{key: $key, phoneNumber: $phoneNumber, code: $code}';
  }
}

/// generated route for
/// [_i6.ConfirmPasswordScreen]
class ConfirmPasswordScreenRoute
    extends _i12.PageRouteInfo<ConfirmPasswordScreenRouteArgs> {
  ConfirmPasswordScreenRoute(
      {_i25.Key? key,
      required String phoneNumber,
      required String confirmePassword})
      : super(ConfirmPasswordScreenRoute.name,
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

  final _i25.Key? key;

  final String phoneNumber;

  final String confirmePassword;

  @override
  String toString() {
    return 'ConfirmPasswordScreenRouteArgs{key: $key, phoneNumber: $phoneNumber, confirmePassword: $confirmePassword}';
  }
}

/// generated route for
/// [_i7.FinishRegisterScreen]
class FinishRegisterScreenRoute extends _i12.PageRouteInfo<void> {
  const FinishRegisterScreenRoute()
      : super(FinishRegisterScreenRoute.name, path: '/finish-register-screen');

  static const String name = 'FinishRegisterScreenRoute';
}

/// generated route for
/// [_i8.ImagePickScreen]
class ImagePickScreenRoute extends _i12.PageRouteInfo<void> {
  const ImagePickScreenRoute()
      : super(ImagePickScreenRoute.name, path: '/image-pick-screen');

  static const String name = 'ImagePickScreenRoute';
}

/// generated route for
/// [_i9.ShowImageFullScreen]
class ShowImageFullScreenRoute
    extends _i12.PageRouteInfo<ShowImageFullScreenRouteArgs> {
  ShowImageFullScreenRoute(
      {_i25.Key? key, required List<_i26.ImageModel> images})
      : super(ShowImageFullScreenRoute.name,
            path: '/show-image-full-screen',
            args: ShowImageFullScreenRouteArgs(key: key, images: images));

  static const String name = 'ShowImageFullScreenRoute';
}

class ShowImageFullScreenRouteArgs {
  const ShowImageFullScreenRouteArgs({this.key, required this.images});

  final _i25.Key? key;

  final List<_i26.ImageModel> images;

  @override
  String toString() {
    return 'ShowImageFullScreenRouteArgs{key: $key, images: $images}';
  }
}

/// generated route for
/// [_i10.UserFormScreen]
class UserFormScreenRoute extends _i12.PageRouteInfo<UserFormScreenRouteArgs> {
  UserFormScreenRoute({_i25.Key? key, required _i27.Profile profile})
      : super(UserFormScreenRoute.name,
            path: '/user-form-screen',
            args: UserFormScreenRouteArgs(key: key, profile: profile));

  static const String name = 'UserFormScreenRoute';
}

class UserFormScreenRouteArgs {
  const UserFormScreenRouteArgs({this.key, required this.profile});

  final _i25.Key? key;

  final _i27.Profile profile;

  @override
  String toString() {
    return 'UserFormScreenRouteArgs{key: $key, profile: $profile}';
  }
}

/// generated route for
/// [_i11.HomeScreen]
class HomeScreenRoute extends _i12.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i12.PageRouteInfo>? children})
      : super(HomeScreenRoute.name, path: '', initialChildren: children);

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class SearchRouter extends _i12.PageRouteInfo<void> {
  const SearchRouter({List<_i12.PageRouteInfo>? children})
      : super(SearchRouter.name, path: 'searche', initialChildren: children);

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i13.FavoriteScreen]
class FavoritesRouter extends _i12.PageRouteInfo<void> {
  const FavoritesRouter() : super(FavoritesRouter.name, path: '');

  static const String name = 'FavoritesRouter';
}

/// generated route for
/// [_i14.MessageScreen]
class MessageRouter extends _i12.PageRouteInfo<void> {
  const MessageRouter({List<_i12.PageRouteInfo>? children})
      : super(MessageRouter.name, path: 'message', initialChildren: children);

  static const String name = 'MessageRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class SettingsRouter extends _i12.PageRouteInfo<void> {
  const SettingsRouter({List<_i12.PageRouteInfo>? children})
      : super(SettingsRouter.name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i15.SearchPageRoute]
class SearchPageRouteRoute extends _i12.PageRouteInfo<void> {
  const SearchPageRouteRoute() : super(SearchPageRouteRoute.name, path: '');

  static const String name = 'SearchPageRouteRoute';
}

/// generated route for
/// [_i16.ApplicantScreen]
class ApplicantScreenRoute
    extends _i12.PageRouteInfo<ApplicantScreenRouteArgs> {
  ApplicantScreenRoute(
      {_i25.Key? key,
      required _i27.Profile applicant,
      required _i25.ImageProvider<Object> image})
      : super(ApplicantScreenRoute.name,
            path: ':applicantScreen',
            args: ApplicantScreenRouteArgs(
                key: key, applicant: applicant, image: image));

  static const String name = 'ApplicantScreenRoute';
}

class ApplicantScreenRouteArgs {
  const ApplicantScreenRouteArgs(
      {this.key, required this.applicant, required this.image});

  final _i25.Key? key;

  final _i27.Profile applicant;

  final _i25.ImageProvider<Object> image;

  @override
  String toString() {
    return 'ApplicantScreenRouteArgs{key: $key, applicant: $applicant, image: $image}';
  }
}

/// generated route for
/// [_i17.SearchScreen]
class SearchScreenRoute extends _i12.PageRouteInfo<SearchScreenRouteArgs> {
  SearchScreenRoute({_i25.Key? key, required List<_i27.Profile> applicants})
      : super(SearchScreenRoute.name,
            path: ':searchScreen',
            args: SearchScreenRouteArgs(key: key, applicants: applicants));

  static const String name = 'SearchScreenRoute';
}

class SearchScreenRouteArgs {
  const SearchScreenRouteArgs({this.key, required this.applicants});

  final _i25.Key? key;

  final List<_i27.Profile> applicants;

  @override
  String toString() {
    return 'SearchScreenRouteArgs{key: $key, applicants: $applicants}';
  }
}

/// generated route for
/// [_i18.MessageChatScreen]
class MessageChatScreenRoute
    extends _i12.PageRouteInfo<MessageChatScreenRouteArgs> {
  MessageChatScreenRoute(
      {_i25.Key? key,
      required _i28.Chat chat,
      required _i29.Message lastMessage})
      : super(MessageChatScreenRoute.name,
            path: '',
            args: MessageChatScreenRouteArgs(
                key: key, chat: chat, lastMessage: lastMessage));

  static const String name = 'MessageChatScreenRoute';
}

class MessageChatScreenRouteArgs {
  const MessageChatScreenRouteArgs(
      {this.key, required this.chat, required this.lastMessage});

  final _i25.Key? key;

  final _i28.Chat chat;

  final _i29.Message lastMessage;

  @override
  String toString() {
    return 'MessageChatScreenRouteArgs{key: $key, chat: $chat, lastMessage: $lastMessage}';
  }
}

/// generated route for
/// [_i19.SettingsScreen]
class SettingsScreenRoute extends _i12.PageRouteInfo<void> {
  const SettingsScreenRoute() : super(SettingsScreenRoute.name, path: '');

  static const String name = 'SettingsScreenRoute';
}

/// generated route for
/// [_i20.MyProfileScreen]
class MyProfileScreenRoute extends _i12.PageRouteInfo<void> {
  const MyProfileScreenRoute()
      : super(MyProfileScreenRoute.name, path: ':myProfileScreen');

  static const String name = 'MyProfileScreenRoute';
}

/// generated route for
/// [_i21.AboutScreen]
class AboutScreenRoute extends _i12.PageRouteInfo<void> {
  const AboutScreenRoute() : super(AboutScreenRoute.name, path: ':aboutScreen');

  static const String name = 'AboutScreenRoute';
}

/// generated route for
/// [_i22.SupportScreen]
class SupportScreenRoute extends _i12.PageRouteInfo<void> {
  const SupportScreenRoute()
      : super(SupportScreenRoute.name, path: ':supportScreen');

  static const String name = 'SupportScreenRoute';
}

/// generated route for
/// [_i23.StoreScreen]
class StoreScreenRoute extends _i12.PageRouteInfo<StoreScreenRouteArgs> {
  StoreScreenRoute(
      {_i25.Key? key,
      _i30.StoreScreenQualifier storeQualifer =
          _i30.StoreScreenQualifier.storeSettings})
      : super(StoreScreenRoute.name,
            path: ':store',
            args: StoreScreenRouteArgs(key: key, storeQualifer: storeQualifer));

  static const String name = 'StoreScreenRoute';
}

class StoreScreenRouteArgs {
  const StoreScreenRouteArgs(
      {this.key, this.storeQualifer = _i30.StoreScreenQualifier.storeSettings});

  final _i25.Key? key;

  final _i30.StoreScreenQualifier storeQualifer;

  @override
  String toString() {
    return 'StoreScreenRouteArgs{key: $key, storeQualifer: $storeQualifer}';
  }
}

/// generated route for
/// [_i24.PromocodeScreen]
class PromocodeScreenRoute extends _i12.PageRouteInfo<void> {
  const PromocodeScreenRoute()
      : super(PromocodeScreenRoute.name, path: ':promocode');

  static const String name = 'PromocodeScreenRoute';
}
