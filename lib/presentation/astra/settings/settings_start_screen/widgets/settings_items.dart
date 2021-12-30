import 'package:astra_app/application/auth/auth/auth_bloc.dart';
import 'package:astra_app/application/settings/settings/settings_bloc.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/astra/settings/my_pofile/widgets/profile_item_widget.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/theming/icons/svg_icon.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsItems extends StatelessWidget {
  final Profile profile;
  const SettingsItems({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileItem(
          contentPadding: const EdgeInsets.symmetric(horizontal: 32),
          icon: const SvgIcon(
            asset: 'assets/icons/profile.svg',
            height: 25,
          ),
          title: 'Мой профиль',
          onTap: () async {
            await AutoRouter.of(
              context,
            ).push(const MyProfileScreenRoute()).then((_) => context
                .read<SettingsBloc>()
                .add(const SettingsEvent.profileLoaded()));
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
            AutoRouter.of(context).push(StoreScreenRoute());
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
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog(
                  title: const Text(
                    "Вы точно хотите выйти из аккаунта?",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                      context.read<AuthBloc>().add(const AuthEvent.signedOut());
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
    );
  }
}
