import 'package:astra_app/auth/core/application/auth_bloc.dart';
import 'package:astra_app/auth/core/presentation/widgets/pin_code_field.dart';
import 'package:astra_app/auth/core/presentation/widgets/screen_content.dart';
import 'package:astra_app/auth/password/application/password_bloc.dart';
import 'package:astra_app/core/presentation/routes/app_router.gr.dart';
import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/widgets/buttons/astra_elevated_button.dart';
import 'package:astra_app/core/presentation/widgets/dialogs/snack_bar.dart';
import 'package:astra_app/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Password entry screen.
class PasswordScreen extends StatelessWidget {
  /// A phone number for signing/sign up.
  final String phoneNumber;

  /// A code fore confirm registration.
  final String? code;

  const PasswordScreen({Key? key, required this.phoneNumber, this.code})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<PasswordBloc>()
            ..add(PasswordEvent.initialized(phoneNumber, code)),
        ),
      ],
      child: BlocListener<PasswordBloc, PasswordState>(
        listener: (context, state) {
          if (state.isSuccessfullySignIn) {
            context.read<AuthBloc>().add(const AuthEvent.authCheckRequested());
            // context.read<AuthBloc>().add(const AuthEvent.firstAuthSet());
            context.router.navigate(SplashScreenRoute(isLoading: true));
            FocusScope.of(context).unfocus();
          }
          if (state.redirectToConfirmPassword) {
            context.router.push(ConfirmPasswordScreenRoute(
              phoneNumber: state.phoneNumber,
              confirmPassword: state.password,
            ));
          }
          if (state.isNoConnection) {
            showSnackBar(context);
          }
        },
        child: ScreenContent(
          onBackPressed: () => context.router.pop(),
          title: code == null ? "Введите пароль" : "Задайте пароль",
          textFieldContent: BlocBuilder<PasswordBloc, PasswordState>(
              buildWhen: (p, c) =>
                  p.errorMessage != c.errorMessage || p.password != c.password,
              builder: (context, state) {
                return PinCodeField(
                  isError: state.errorMessage.isNotEmpty,
                  onChanged: (value) => context
                      .read<PasswordBloc>()
                      .add(PasswordEvent.changedPassword(value)),
                  obscureText: true,
                );
              }),
          notificationMessageContent: BlocBuilder<PasswordBloc, PasswordState>(
              buildWhen: (p, c) => p.errorMessage != c.errorMessage,
              builder: (context, state) {
                return Text(
                  state.errorMessage,
                  style: const TextStyle(color: AstraColors.red),
                );
              }),
          button: BlocBuilder<PasswordBloc, PasswordState>(
              buildWhen: (p, c) =>
                  p.isLoading != c.isLoading || p.isEnableBtn != c.isEnableBtn,
              builder: (context, state) {
                return AstraElevatedButton(
                  isLoading: state.isLoading,
                  isEnableButton: state.isEnableBtn,
                  title: 'Продолжить',
                  onClick: () {
                    context
                        .read<PasswordBloc>()
                        .add(const PasswordEvent.pressedButton());
                  },
                );
              }),
        ),
      ),
    );
  }
}
