import 'dart:developer';

import 'package:astra_app/application/auth/auth/auth_bloc.dart';
import 'package:astra_app/application/auth/password/password_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/auth/widgets/pin_code_field.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/buttons/astra_elevated_button.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/screen_content.dart';

/// Password entry screen.
class PasswordScreen extends StatelessWidget {
  /// A phone number for signin/signup.
  final String phoneNumber;

  /// A code fore confirme registration.
  final String? code;
  const PasswordScreen({Key? key, required this.phoneNumber, this.code})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PasswordBloc>()
        ..add(PasswordEvent.initialized(phoneNumber, code)),
      child: BlocListener<PasswordBloc, PasswordState>(
        listener: (context, state) {
          if (state.isSuseccfullySignIn) {
            context.read<AuthBloc>().add(const AuthEvent.authCheckRequested());
            FocusScope.of(context).unfocus();
          }
          if (state.redirectToConfirmePassword) {
            AutoRouter.of(context).push(ConfirmPasswordScreenRoute(
                phoneNumber: state.phoneNumber,
                confirmePassword: state.password));
          }
          if (state.isNoConnection) {
            showSnackBar(context);
          }
        },
        child: ScreenContent(
          onBackPresed: () => context.router.pop(),
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
                        .add(const PasswordEvent.pressedButn());
                  },
                );
              }),
        ),
      ),
    );
  }
}
