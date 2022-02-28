import 'package:astra_app/application/auth/auth/auth_bloc.dart';
import 'package:astra_app/application/user/user_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/theming/gradients.dart';
import 'package:astra_app/presentation/core/widgets/custom/platform.activity_indicator.dart';
import 'package:astra_app/presentation/core/widgets/logo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Defines app splash screen.
class SplashScreen extends StatelessWidget {
  /// Flag responsible for showing download indicator.
  final bool isLoading;
  const SplashScreen({Key? key, this.isLoading = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeMap(
                orElse: () {},
                initial: (_) {},
                authenticated: (_) {
                  AutoRouter.of(context).push(const HomeScreenRoute());
                },
                unauthenticated: (_) {
                  AutoRouter.of(context).push(const PhoneNumberScreenRoute());
                });
          },
        ),
      ],
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: Gradients.blueGradient,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(logoWithText: true),
              const SizedBox(height: 40),
              Visibility(
                  visible: isLoading,
                  child: const PlatformActivityIndicator(
                      isCapertinoDarkTheme: true)),
            ],
          ),
        ),
      ),
    );
  }
}
