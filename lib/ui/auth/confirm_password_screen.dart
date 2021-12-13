import 'package:astra_app/api/auth/application/auth/auth_bloc.dart';
import 'package:astra_app/api/auth/application/repeat_password/repeat_password_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/ui/auth/widgets/pin_code_field.dart';
import 'package:astra_app/ui/auth/widgets/screen_content.dart';
import 'package:astra_app/ui/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Password confirmation screen.
class ConfirmPasswordScreen extends StatelessWidget {
  /// A phone number for signin/signup.
  final String phoneNumber;

  /// A password for confirmetion of registration.
  final String confirmePassword;

  const ConfirmPasswordScreen(
      {Key? key, required this.phoneNumber, required this.confirmePassword})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RepeatPasswordBloc>()
        ..add(RepeatPasswordEvent.initialized(phoneNumber, confirmePassword)),
      child: BlocConsumer<RepeatPasswordBloc, RepeatPasswordState>(
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
                  .read<RepeatPasswordBloc>()
                  .add(RepeatPasswordEvent.changedPassword(value)),
              obscureText: true,
              onCompleted: (value) {
                context
                    .read<RepeatPasswordBloc>()
                    .add(RepeatPasswordEvent.submittedPassword(value));
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
                  .read<RepeatPasswordBloc>()
                  .add(const RepeatPasswordEvent.pressedButn());
            },
          );
        },
      ),
    );
  }
}
