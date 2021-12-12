import 'package:astra_app/api/auth/application/auth/auth_bloc.dart';
import 'package:astra_app/routes/app_router.gr.dart';
import 'package:astra_app/ui/astra/profile/support/support_screen.dart';
import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/glodal/icons/svg_icon.dart';
import 'package:astra_app/ui/glodal/widgets/dialogs/custom_dialog.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../store_screen.dart';
import 'about/about_screen.dart';
import 'my_pofile/my_profile.dart';
import 'my_pofile/widgets/profile_item_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profilescreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AstraAppBar(
          onPressed: () {},
          title: 'Настройки',
        ),
        body: Column(
          children: [
            Container(
              color: const Color.fromRGBO(240, 241, 243, 1),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: Image.asset('assets/right_girl.png').image,
                ),
                title: const Text(
                  'Август Августин, 30',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AstraColors.black,
                  ),
                ),
                subtitle: const Text(
                  'Россия, Москва',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AstraColors.black06,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                ProfileItem(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 32),
                  icon: const SvgIcon(
                    asset: 'assets/icons/profile.svg',
                    height: 25,
                  ),
                  title: 'Мой профиль',
                  onTap: () {
                    AutoRouter.of(
                      context,
                    ).push(const MyProfileScreenRoute());
                  },
                ),
                ProfileItem(
                  icon: const SvgIcon(
                    asset: 'assets/icons/anketa.svg',
                    height: 20,
                  ),
                  title: 'Моя анкета',
                  onTap: () {},
                ),
                ProfileItem(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: AstraColors.darkWhite,
                    size: 28,
                  ),
                  title: 'Магазин',
                  onTap: () {
                    AutoRouter.of(context).push(const StoreScreenRoute());
                  },
                ),
                ProfileItem(
                  icon: const Icon(
                    CupertinoIcons.exclamationmark_circle_fill,
                    color: AstraColors.darkWhite,
                    size: 28,
                  ),
                  title: 'Обучение',
                  onTap: () {},
                ),
                ProfileItem(
                  icon: const SvgIcon(
                    asset: 'assets/icons/support.svg',
                    height: 25,
                  ),
                  title: 'Поддержка',
                  onTap: () {
                    context.router.push(const SupportScreenRoute());
                    // Navigator.of(context, rootNavigator: false)
                    //     .pushNamed(SupportScreen.routeName);
                  },
                ),
                ProfileItem(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  icon: const SvgIcon(
                    asset: 'assets/icons/aboutApp.svg',
                    height: 25,
                  ),
                  title: 'О приложении',
                  onTap: () {
                    context.router.push(const AboutScreenRoute());
                  },
                ),
                ProfileItem(
                  icon: const Icon(
                    CupertinoIcons.arrow_right_square,
                    color: AstraColors.darkWhite,
                    size: 28,
                  ),
                  title: 'Выйти',
                  isSignout: true,
                  onTap: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          title: const Text(
                            "Вы точно хотите выйти из аккаунта?",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          action1: TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text(
                              "Отмена",
                              style: TextStyle(color: AstraColors.black),
                            ),
                          ),
                          action2: TextButton(
                            onPressed: () {
                              // context.router.pushAndPopUntil(
                              //     const PhoneNumberScreenRoute(),
                              //     predicate: (_) => false);
                              context
                                  .read<AuthBloc>()
                                  .add(const AuthEvent.signedOut());
                            },
                            child: const Text(
                              "Выйти",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
