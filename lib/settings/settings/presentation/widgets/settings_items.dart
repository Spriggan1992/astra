import 'package:astra_app/auth/core/application/auth_bloc.dart';
import 'package:astra_app/core/presentation/routes/app_router.gr.dart';
import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/theming/icons/svg_icon.dart';
import 'package:astra_app/core/presentation/widgets/buttons/dialog_action_button.dart';
import 'package:astra_app/core/presentation/widgets/dialogs/dialog_two_actions.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/settings/core/application/logout/logout_cubit.dart';
import 'package:astra_app/settings/my_profile/domain/models/profile_short_model.dart';
import 'package:astra_app/settings/my_profile/presentation/widgets/profile_item_widget.dart';
import 'package:astra_app/settings/settings/application/settings_bloc.dart';
import 'package:astra_app/shared/features/user_subscription/application/user_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsItems extends StatelessWidget {
  final ProfileShortModel profile;

  const SettingsItems({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LogoutCubit>(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<LogoutCubit, LogoutState>(
            listener: (context, state) {
              if (state.canLogout) {
                context
                    .read<UserBloc>()
                    .add(const UserEvent.userStatusOnlineUpdated(false));
              }
            },
          ),
          BlocListener<UserBloc, UserState>(
            listener: (context, state) {
              if (!state.isOnline &&
                  context.read<LogoutCubit>().state.canLogout) {
                context
                    .read<UserBloc>()
                    .add(const UserEvent.userUpdatesUnsubscribed());
                context.read<AuthBloc>().add(const AuthEvent.signedOut());
              }
            },
          ),
        ],
        child: BlocBuilder<LogoutCubit, LogoutState>(
          builder: (context, state) {
            return Column(
              children: [
                ProfileItem(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 32),
                  icon: const SvgIcon(
                    asset: 'assets/icons/profile.svg',
                    height: 25,
                  ),
                  title: '?????? ??????????????',
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
                  title: '?????? ????????????',
                  onTap: () {
                    context.router.push(MyFormScreenRoute());
                  },
                ),
                ProfileItem(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: AstraColors.darkWhite,
                    size: 28,
                  ),
                  title: '??????????????',
                  onTap: () {
                    context.router.push(StoreScreenRoute());
                  },
                ),
                ProfileItem(
                  icon: const SvgIcon(
                    asset: 'assets/icons/promocode.svg',
                    height: 20,
                  ),
                  title: '????????????????',
                  onTap: () =>
                      context.router.push(const PromocodeScreenRoute()),
                ),
                ProfileItem(
                  icon: const Icon(
                    CupertinoIcons.exclamationmark_circle_fill,
                    color: AstraColors.darkWhite,
                    size: 28,
                  ),
                  title: '????????????????',
                  onTap: () {
                    context.router.push(
                        CoachScreenRoute(size: MediaQuery.of(context).size));
                  },
                ),
                ProfileItem(
                  icon: const SvgIcon(
                    asset: 'assets/icons/support.svg',
                    height: 25,
                  ),
                  title: '??????????????????',
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
                  title: '?? ????????????????????',
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
                  title: '??????????',
                  isSignout: true,
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return DialogTwoActions(
                          content: const Text(
                            "???? ?????????? ???????????? ?????????? ???? ?????????????????",
                            textAlign: TextAlign.center,
                          ),
                          action1: DialogActionButton(
                            title: '????????????',
                            onClick: () => dialogContext.router.pop(false).then(
                                (value) => context
                                    .read<LogoutCubit>()
                                    .setLogoutState(false)),
                          ),
                          action2: TextButton(
                            onPressed: () async {
                              context.read<LogoutCubit>().setLogoutState(true);
                            },
                            child: const Text(
                              "??????????",
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
          },
        ),
      ),
    );
  }
}
