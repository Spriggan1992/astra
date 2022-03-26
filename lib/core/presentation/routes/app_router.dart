import 'package:astra_app/auth/presentation/code_screen.dart';
import 'package:astra_app/auth/presentation/confirm_password_screen.dart';
import 'package:astra_app/auth/presentation/enter_screen.dart';
import 'package:astra_app/auth/presentation/how_to_get_club_screen.dart';
import 'package:astra_app/auth/presentation/password_screen.dart';
import 'package:astra_app/auth/presentation/phone_number_screen.dart';
import 'package:astra_app/auth/presentation/splash_screen.dart';
import 'package:astra_app/auth/presentation/widgets/finish_register_screen.dart';
import 'package:astra_app/chats/presentation/chat_screen/chat_screen.dart';
import 'package:astra_app/chats/presentation/chats_screen/chats_screen.dart';
import 'package:astra_app/favorites/presentation/favorite_screen.dart';
import 'package:astra_app/favorites/presentation/user_form/user_form_screen.dart';
import 'package:astra_app/core/presentation/home_screen.dart';
import 'package:astra_app/core/presentation/screens/show_image_full_screen.dart';
import 'package:astra_app/core/presentation/screens/user_info/user_info_detail_screen.dart';
import 'package:astra_app/core/presentation/screens/user_info/user_info_screen.dart';
import 'package:astra_app/search/presentation/search_page_route.dart';
import 'package:astra_app/search/presentation/search_screen.dart';
import 'package:astra_app/settings/presentation/about/about_screen.dart';
import 'package:astra_app/settings/presentation/about/politics_screen.dart';
import 'package:astra_app/settings/presentation/coach/coach_screen.dart';
import 'package:astra_app/settings/presentation/my_form/my_form_screen.dart';
import 'package:astra_app/settings/presentation/my_pofile/my_profile.dart';
import 'package:astra_app/settings/presentation/promocode/promocode_screen.dart';
import 'package:astra_app/settings/presentation/settings_screen.dart';
import 'package:astra_app/settings/presentation/support/support_screen.dart';
import 'package:astra_app/shared/features/store/presentation/store/store_screen.dart';
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
    AutoRoute(page: ShowImageFullScreen),
    AutoRoute(page: CoachScreen),
    AutoRoute(page: PoliticsScreen),
    AutoRoute(page: ChatScreen),
    AutoRoute(
        page: StoreScreen,
        name: 'commonStoreScreenRouter',
        path: 'commonStoreScreen'),
    AutoRoute(
      path: '',
      page: HomeScreen,
      children: [
        _searchRoute,
        _favoriteRoute,
        _chatRoute,
        _settingsRoute,
      ],
    )
  ],
)
class $AppRouter {}

const _searchRoute = AutoRoute(
  path: 'search',
  name: 'SearchTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      path: '',
      name: 'SearchPage',
      page: SearchPageRoute,
    ),
    AutoRoute(
      name: 'SearchUserInfoRouter',
      path: ':searchInfoScreen',
      page: UserInfoScreen,
    ),
    AutoRoute(path: ':searchScreen', page: SearchScreen),
    AutoRoute(
      name: 'SearchUserInfoDetailRouter',
      path: ':searchUserInfoDetailScreen',
      page: UserInfoDetailScreen,
    ),
  ],
);

const _favoriteRoute = AutoRoute(
  name: 'FavoritesTab',
  page: EmptyRouterPage,
  initial: true,
  children: [
    AutoRoute(path: '', page: FavoriteScreen),
    AutoRoute(
        name: 'usersFormScreenRouter',
        path: ':usersFormScreen',
        page: UsersFormScreen),
    AutoRoute(
      name: 'FavoriteSearchRouter',
      path: ':favoriteSearchScreen',
      page: SearchScreen,
    ),
    AutoRoute(
      name: 'FavoritesUserInfoRouter',
      path: ':favoritesUserInfoScreen',
      page: UserInfoScreen,
    ),
    AutoRoute(
      name: 'FavoritesUserInfoDetailRouter',
      path: ':favoritesUserInfoDetailScreen',
      page: UserInfoDetailScreen,
    ),
  ],
);
const _chatRoute = AutoRoute(
  path: 'chats',
  name: 'ChatsTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(path: '', page: ChatsScreen),
  ],
);
const _settingsRoute = AutoRoute(
  path: 'settings',
  name: 'SettingsTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(path: '', page: SettingsScreen),
    AutoRoute(path: ':myProfileScreen', page: MyProfileScreen),
    AutoRoute(path: ':aboutScreen', page: AboutScreen),
    AutoRoute(path: ':supportScreen', page: SupportScreen),
    AutoRoute(path: ':storeScreen', page: StoreScreen),
    AutoRoute(path: ':promocode', page: PromocodeScreen),
    AutoRoute(path: ':applicationForm', page: MyFormScreen),
    AutoRoute(
      page: UserInfoScreen,
      name: 'SettingsUserInfoScreenRouter',
      path: ':userInfoScreen',
    ),
    AutoRoute(
      name: 'SettingsUserInfoDetailRouter',
      path: ':settingsUserInfoDetailScreen',
      page: UserInfoDetailScreen,
    ),
  ],
);
