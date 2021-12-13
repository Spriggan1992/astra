import 'package:astra_app/api/auth/application/auth/auth_bloc.dart';
import 'package:astra_app/api/auth/application/password/password_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/routes/app_router.gr.dart';
import 'package:astra_app/ui/auth/widgets/pin_code_field.dart';
import 'package:astra_app/ui/config/colors.dart';
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
      child: BlocConsumer<PasswordBloc, PasswordState>(
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
        },
        builder: (context, state) {
          return ScreenContent(
            onBackPresed: () => context.router.pop(),
            title: code == null ? "Введите пароль" : "Задайте пароль",
            textFieldContent: PinCodeField(
              isError: state.isShowError,
              onChanged: (value) => context
                  .read<PasswordBloc>()
                  .add(PasswordEvent.changedPassword(value)),
              obscureText: true,
              onCompleted: (value) {
                context
                    .read<PasswordBloc>()
                    .add(PasswordEvent.submittedPassword(value));
              },
            ),
            notificationMessageContent: Text(
              state.isShowError
                  ? "Неправильный пароль\nПовторите пожалуйста еще раз."
                  : "",
              style: const TextStyle(color: AstraColors.red),
            ),
            isEnableButton: state.isEnableBtn,
            clickButton: () {
              context
                  .read<PasswordBloc>()
                  .add(const PasswordEvent.pressedButn());
            },
          );
        },
      ),
    );
  }
}
