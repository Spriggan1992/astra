import 'package:astra_app/routes/app_router.gr.dart';
import 'package:astra_app/ui/astra/favorite/favorite_choose_screen.dart.dart';
import 'package:astra_app/ui/astra/favorite/favorite_screen.dart';
import 'package:astra_app/ui/astra/home_screen.dart';
import 'package:astra_app/ui/astra/message/chat_screen.dart';
import 'package:astra_app/ui/astra/message/message_screen.dart';
import 'package:astra_app/ui/astra/profile/about/about_screen.dart';
import 'package:astra_app/ui/astra/profile/my_pofile/my_profile.dart';
import 'package:astra_app/ui/astra/profile/my_pofile/photo/image_pick_screen.dart';
import 'package:astra_app/ui/astra/profile/my_pofile/photo/show_image_full_screen.dart';
import 'package:astra_app/ui/astra/profile/profile_screen.dart';
import 'package:astra_app/ui/astra/profile/support/support_screen.dart';
import 'package:astra_app/ui/astra/search/search_detail.dart';
import 'package:astra_app/ui/astra/search/search_screen.dart';
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
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  // replaceInRouteName: 'Page,Route',
  routes: [
    MaterialRoute(page: FirstSignin, initial: true, path: '/'),
    MaterialRoute(page: SplashScreen),
    MaterialRoute(page: SigninScreen),
    MaterialRoute(page: HowToGetClubScreen),
    MaterialRoute(page: SmsCodeScreen),
    MaterialRoute(page: PasswordScreen),
    MaterialRoute(page: RepeatePasswordScreen),
    MaterialRoute(page: StoreScreen),
    MaterialRoute(page: EnterScreen),
    MaterialRoute(page: EnterPasswordScreen),
    MaterialRoute(page: FinishRegisterScreen),
    AutoRoute(
      path: '',
      page: HomeScreen,
      children: [
        AutoRoute(
          path: 'searche',
          name: 'SearchRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: SearchScreen),
            AutoRoute(path: ':searchDetailPage', page: SearchDetailPage),
          ],
        ),
        AutoRoute(
          path: '',
          name: 'FavoritesRouter',
          page: FavoriteScreen,
        ),
        AutoRoute(
          path: 'message',
          name: 'MessageRouter',
          page: MessageScreen,
          children: [
            AutoRoute(path: '', page: MessageChatScreen),
          ],
        ),
        AutoRoute(
          path: 'settings',
          name: 'SettingsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: ProfileScreen),
            AutoRoute(path: ':showImageFullScreen', page: ShowImageFullScreen),
            AutoRoute(path: ':imagePickScreen', page: ImagePickScreen),
            AutoRoute(path: ':myProfileScreen', page: MyProfileScreen),
            AutoRoute(path: ':aboutScreen', page: AboutScreen),
            AutoRoute(path: ':supportScreen', page: SupportScreen),
          ],
        ),
      ],
    )
  ],
)
class $AppRouter {}
