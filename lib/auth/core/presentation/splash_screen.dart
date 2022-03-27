import 'package:astra_app/auth/core/application/auth_bloc.dart';
import 'package:astra_app/core/presentation/enums/store_screen_qualifier.dart';
import 'package:astra_app/core/presentation/routes/app_router.gr.dart';
import 'package:astra_app/core/presentation/theming/gradients.dart';
import 'package:astra_app/core/presentation/widgets/custom/platform.activity_indicator.dart';
import 'package:astra_app/core/presentation/widgets/logo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Defines app splash screen.
class SplashScreen extends StatelessWidget {
  /// Flag responsible for showing download indicator.
  final bool isLoading;

  const SplashScreen({
    Key? key,
    this.isLoading = false,
  }) : super(key: key);

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
              authenticated: (state) {
                if (!state.isFirstAuth) {
                  context.router.push(
                    CommonStoreScreenRouter(
                      storeQualifier:
                          StoreScreenQualifier.storeAfterRegistration,
                    ),
                  );
                } else {
                  if (state.hasLikes) {
                    context.router.push(
                      const HomeScreenRoute(),
                    );
                  } else {
                    context.router.push(
                      CommonStoreScreenRouter(
                        storeQualifier:
                            StoreScreenQualifier.storeAfterRegistration,
                      ),
                    );
                  }
                }
              },
              unauthenticated: (_) {
                context.router.replace(const EnterScreenRoute());
              },
            );
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
                  isCupertinoDarkTheme: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
