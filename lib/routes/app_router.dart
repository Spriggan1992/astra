import 'package:astra_app/ui/astra/favorite/favorite_choose_screen.dart.dart';
import 'package:astra_app/ui/astra/home_screen.dart';
import 'package:astra_app/ui/astra/profile/my_pofile/my_profile.dart';
import 'package:astra_app/ui/astra/profile/my_pofile/photo/image_pick_screen.dart';
import 'package:astra_app/ui/astra/profile/my_pofile/photo/show_image_full_screen.dart';
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

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: FirstSignin, initial: true),
    MaterialRoute(page: SplashScreen),
    MaterialRoute(page: SigninScreen),
    MaterialRoute(page: HowToGetClubScreen),
    MaterialRoute(page: SmsCodeScreen),
    MaterialRoute(page: PasswordScreen),
    MaterialRoute(page: RepeatePasswordScreen),
    MaterialRoute(page: StoreScreen),
    MaterialRoute(page: EnterScreen),
    MaterialRoute(page: EnterPasswordScreen),
    MaterialRoute(page: HomeScreen),
    MaterialRoute(page: FinishRegisterScreen),
    MaterialRoute(page: MyProfileScreen),
    MaterialRoute(page: ShowImageFullScreen),
    MaterialRoute(page: ImagePickScreen),
    MaterialRoute(page: FavoriteChooseScreen),
  ],
)
class $AppRouter {}
