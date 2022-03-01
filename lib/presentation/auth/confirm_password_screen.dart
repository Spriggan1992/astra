import 'package:astra_app/application/auth/auth/auth_bloc.dart';
import 'package:astra_app/application/auth/confirm_password/confirm_password_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/auth/widgets/pin_code_field.dart';
import 'package:astra_app/presentation/auth/widgets/screen_content.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/buttons/astra_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Password confirmation screen.
class ConfirmPasswordScreen extends StatelessWidget {
  /// A phone number for signin/signup.
  final String phoneNumber;

  /// A password for confirmation of registration.
  final String confirmPassword;

  const ConfirmPasswordScreen(
      {Key? key, required this.phoneNumber, required this.confirmPassword})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ConfirmPasswordBloc>()
        ..add(ConfirmPasswordEvent.initialized(phoneNumber, confirmPassword)),
      child: BlocConsumer<ConfirmPasswordBloc, ConfirmPasswordState>(
        listener: (context, state) {
          if (state.isSuccessfullySubmitted) {
            context.read<AuthBloc>().add(const AuthEvent.authCheckRequested());
            FocusScope.of(context).unfocus();
          }
        },
        builder: (context, state) {
          return ScreenContent(
            title: "Повторите пароль",
            textFieldContent: PinCodeField(
              isError: state.isShowError,
              onChanged: (value) => context
                  .read<ConfirmPasswordBloc>()
                  .add(ConfirmPasswordEvent.changedPassword(value)),
              obscureText: true,
              onCompleted: (value) {
                context
                    .read<ConfirmPasswordBloc>()
                    .add(ConfirmPasswordEvent.submittedPassword(value));
              },
            ),
            notificationMessageContent: Text(
              state.isShowError
                  ? "Неправильный пароль\nПовторите пожалуйста еще раз."
                  : "",
              style: const TextStyle(color: AstraColors.red),
            ),
            button: AstraElevatedButton(
              isEnableButton: true,
              title: 'Продолжить',
              onClick: () {},
            ),
          );
        },
      ),
    );
  }
}
