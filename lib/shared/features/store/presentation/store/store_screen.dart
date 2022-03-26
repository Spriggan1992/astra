import 'package:astra_app/auth/application/auth/auth_bloc.dart';
import 'package:astra_app/core/presentation/enums/store_screen_qualifier.dart';
import 'package:astra_app/core/presentation/routes/app_router.gr.dart';
import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/widgets/dialogs/store_dialog.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/astra_appbar.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/loading_screen.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/shared/features/store/application/store/store_actor/store_actor_bloc.dart';
import 'package:astra_app/shared/features/store/application/store/store_bloc.dart';
import 'package:astra_app/shared/features/store/presentation/store/widgets/astra_pay_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

import 'widgets/grouped_selected_like_packages.dart';

/// Represent store screen.
class StoreScreen extends StatelessWidget {
  /// Current screen qualifier. Determines from what place store was navigated
  /// from settings or from login
  final StoreScreenQualifier storeQualifier;

  const StoreScreen({
    Key? key,
    this.storeQualifier = StoreScreenQualifier.storeSettings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<StoreBloc>()..add(const StoreEvent.initialized()),
        ),
      ],
      child: BlocBuilder<StoreBloc, StoreState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loadInProgress: (_) => const LoadingScreen(),
            loadSuccess: (state) => BlocProvider(
              create: (context) => getIt<StoreActorBloc>()
                ..add(StoreActorEvent.initialized(state.likes)),
              child: StoreScreenContent(storeQualifier: storeQualifier),
            ),
            loadFailure: (stateFailure) => ErrorScreen(
              failure: stateFailure.failure,
              onTryAgain: () {
                context.read<StoreBloc>().add(const StoreEvent.initialized());
              },
            ),
          );
        },
      ),
    );
  }
}

class StoreScreenContent extends StatelessWidget {
  final StoreScreenQualifier storeQualifier;

  const StoreScreenContent({
    Key? key,
    required this.storeQualifier,
  }) : super(key: key);

  Function()? _navigateBack(BuildContext context) {
    if (storeQualifier == StoreScreenQualifier.storeAfterRegistration) {
      return null;
    } else if (storeQualifier == StoreScreenQualifier.storeSearch) {
      return () => context.navigateTo(const HomeScreenRoute());
    } else {
      return () => context.router.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AstraAppBar(
          onPressed: _navigateBack(context),
          title: 'Магазин',
          elevation: 0.3,
          actions: [
            IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const StoreDialog();
                  },
                );
              },
              icon: const Icon(
                Icons.info_outline,
                size: 25,
                color: Color.fromRGBO(24, 24, 24, 0.6),
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            const Text(
              'Выберите количество лайков,\n которые хотите преобрести',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AstraColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
            BlocBuilder<StoreActorBloc, StoreActorState>(
              builder: (context, state) => GroupedSelectedLikePackages(
                likes: state.likes,
                onSelectLike: (like) => context
                    .read<StoreActorBloc>()
                    .add(StoreActorEvent.likePackageSelected(like)),
                selectedLike: state.like,
              ),
            ),
            // const AstraCheckBox(), // TODO don't delete while we don't decide what if we need this feature.
            const SizedBox(height: 24),
            const Divider(
              color: AstraColors.dividerColor,
              thickness: 1,
              endIndent: 25,
              indent: 25,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'К оплате',
                    style: TextStyle(
                      color: AstraColors.black,
                      fontSize: 18,
                    ),
                  ),
                  BlocBuilder<StoreActorBloc, StoreActorState>(
                    buildWhen: (p, c) => p.like != c.like,
                    builder: (context, state) {
                      return Text(
                        state.like.price.toString(),
                        style: const TextStyle(
                          color: AstraColors.black,
                          fontSize: 18,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            BlocBuilder<StoreActorBloc, StoreActorState>(
              builder: (context, state) {
                return BlocBuilder<AuthBloc, AuthState>(
                  builder: (ctx, st) {
                    return st.maybeMap(
                      orElse: () => const SizedBox.shrink(),
                      authenticated: (authState) => AstraPayButton(
                        context: context,
                        state: state,
                        onApplePayResult: (payResult) {
                          log(payResult.toString(), name: "APay result");
                          authState.isFirstAuth
                              ? context.router.push(const HomeScreenRoute())
                              : context.router
                                  .push(const FinishRegisterScreenRoute());
                          context
                              .read<AuthBloc>()
                              .add(const AuthEvent.firstAuthSet());
                        },
                        onGooglePayResult: (payResult) {
                          log(payResult.toString(), name: "GPay result");
                          authState.isFirstAuth
                              ? context.router.push(const HomeScreenRoute())
                              : context.router
                                  .push(const FinishRegisterScreenRoute());
                          context
                              .read<AuthBloc>()
                              .add(const AuthEvent.firstAuthSet());
                        },
                        onPressed: onBtnPressed,
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            if (storeQualifier == StoreScreenQualifier.storeAfterRegistration)
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () => const SizedBox.shrink(),
                    authenticated: (state) => TextButton(
                      onPressed: () async {
                        state.isFirstAuth
                            ? context.router.push(const HomeScreenRoute())
                            : context.router
                                .push(const FinishRegisterScreenRoute());
                        context
                            .read<AuthBloc>()
                            .add(const AuthEvent.firstAuthSet());
                      },
                      child: const Text(
                        "Позже",
                        style: TextStyle(
                          color: AstraColors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  onBtnPressed() => log("Button pressed", name: "on pressed");
}
