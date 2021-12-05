import 'package:astra_app/bloc/auth/auth_bloc.dart';
import 'package:astra_app/bloc/password/password_cubit.dart';
import 'package:astra_app/ui/astra/store_screen.dart';
import 'package:astra_app/ui/config/gradients.dart';
import 'package:astra_app/ui/glodal/widgets/logo.dart';
import 'package:astra_app/ui/signin/enter/enter_screen.dart';
import 'package:astra_app/ui/signin/finish_register_screen.dart';
import 'package:astra_app/ui/signin/registration/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.status == AuthStatus.unauthenticated) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  SigninScreen.routeName, (route) => false);
            } else if (state.status == AuthStatus.authenticated) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  EnterScreen.routeName, (route) => false);
              //TODO Если пользователь зарегистрирован в системе .....
            }
          },
        ),
        BlocListener<PasswordCubit, PasswordState>(
          bloc: BlocProvider.of<PasswordCubit>(context),
          listener: (context, state) {
            if (state.status == PasswordStatus.success) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  StoreScreen.routeName, (route) => false);
            } else if (state.status == PasswordStatus.succsessPassword) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  StoreScreen.routeName, (route) => false);
            } else if (state.status == PasswordStatus.initial) {
              //TODO what will i do?
            }
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
