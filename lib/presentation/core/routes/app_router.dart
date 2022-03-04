import 'package:astra_app/presentation/astra/chats/chat_screen/chat_screen.dart';
import 'package:astra_app/presentation/astra/chats/chats_screen/chats_screen.dart';
import 'package:astra_app/presentation/astra/favorite/favorite_screen.dart';
import 'package:astra_app/presentation/astra/favorite/user_form/user_form_screen.dart';
import 'package:astra_app/presentation/astra/home_screen.dart';
import 'package:astra_app/presentation/astra/search/applicants/applicant_detail_screen.dart';
import 'package:astra_app/presentation/astra/search/applicants/applicant_screen.dart';
import 'package:astra_app/presentation/astra/search/search_page_route.dart';
import 'package:astra_app/presentation/astra/search/search_screen.dart';
import 'package:astra_app/presentation/astra/settings/about/about_screen.dart';
import 'package:astra_app/presentation/astra/settings/about/politics_screen.dart';
import 'package:astra_app/presentation/astra/settings/application_form/application_form_screen.dart';
import 'package:astra_app/presentation/astra/settings/coach/coach_screen.dart';
import 'package:astra_app/presentation/astra/settings/my_pofile/my_profile.dart';
import 'package:astra_app/presentation/astra/settings/my_pofile/photo/image_pick_screen.dart';
import 'package:astra_app/presentation/auth/enter_screen.dart';
import 'package:astra_app/presentation/core/widgets/screens/show_image_full_screen.dart';
import 'package:astra_app/presentation/astra/settings/promocode/promocode_screen.dart';
import 'package:astra_app/presentation/astra/settings/settings_screen.dart';
import 'package:astra_app/presentation/astra/settings/support/support_screen.dart';
import 'package:astra_app/presentation/astra/store/store_screen.dart';
import 'package:astra_app/presentation/auth/code_screen.dart';
import 'package:astra_app/presentation/auth/confirm_password_screen.dart';
import 'package:astra_app/presentation/auth/how_to_get_club_screen.dart';
import 'package:astra_app/presentation/auth/password_screen.dart';
import 'package:astra_app/presentation/auth/phone_number_screen.dart';
import 'package:astra_app/presentation/auth/splash_screen.dart';
import 'package:astra_app/presentation/auth/widgets/finish_register_screen.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: SplashScreen, initial: true, path: '/'),
    AutoRoute(page: EnterScreen),
    AutoRoute(page: PhoneNumberScreen),
    AutoRoute(page: HowToGetClubScreen),
    AutoRoute(page: CodeScreen),
    AutoRoute(page: PasswordScreen),
    AutoRoute(page: ConfirmPasswordScreen),
    AutoRoute(page: FinishRegisterScreen),
    AutoRoute(page: ImagePickScreen),
    AutoRoute(page: ShowImageFullScreen),
    AutoRoute(page: UserFormScreen),
    AutoRoute(page: CoachScreen),
    AutoRoute(page: ChatScreen),
    AutoRoute(page: PoliticsScreen),
    AutoRoute(page: StoreScreen),
    AutoRoute(
        page: ApplicantScreen,
        name: 'ApplicantScreenFromSettingsRouter',
        path: 'applicantScreenFromSettings'),
    AutoRoute(
      path: '',
      page: HomeScreen,
      children: [
        AutoRoute(
          path: 'search',
          name: 'SearchRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: SearchPageRoute,
            ),
            AutoRoute(path: ':applicantScreen', page: ApplicantScreen),
            AutoRoute(path: ':searchScreen', page: SearchScreen),
          ],
        ),
        AutoRoute(
          path: '',
          name: 'FavoritesRouter',
          page: FavoriteScreen,
          initial: true,
        ),
        AutoRoute(
          path: 'chats',
          name: 'ChatsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: ChatsScreen),
          ],
        ),
        AutoRoute(
          path: 'settings',
          name: 'SettingsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: SettingsScreen),
            AutoRoute(path: ':myProfileScreen', page: MyProfileScreen),
            AutoRoute(path: ':aboutScreen', page: AboutScreen),
            AutoRoute(path: ':supportScreen', page: SupportScreen),
            AutoRoute(path: ':promocode', page: PromocodeScreen),
            AutoRoute(
                path: ':applicantDetailScreen', page: ApplicantDetailScreen),
            AutoRoute(path: ':applicationForm', page: ApplicationFormScreen),
          ],
        ),
      ],
    )
  ],
)
class $AppRouter {}
