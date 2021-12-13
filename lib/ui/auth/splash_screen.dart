import 'package:astra_app/api/auth/application/auth/auth_bloc.dart';
import 'package:astra_app/routes/app_router.gr.dart';
import 'package:astra_app/ui/astra/home_screen.dart';
import 'package:astra_app/ui/config/gradients.dart';
import 'package:astra_app/ui/glodal/widgets/logo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Defines app splash screen.
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.map(
                initial: (_) {},
                authenticated: (_) {
                  AutoRouter.of(context).push(const HomeScreenRoute());
                  // AutoRouter.of(context).pushAndPopUntil(
                  //   const HomeScreenRoute(),
                  //   predicate: (route) => false,
                  // );
                },
                unauthenticated: (_) {
                  AutoRouter.of(context).push(const PhoneNumberScreenRoute());
                });
          },
        ),
      ],
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: Gradients.blueGradient,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            const Logo(logoWithText: true),
          ],
        ),
      ),
    );
  }
}
