import 'package:astra_app/application/auth/code/code_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/auth/widgets/pin_code_field.dart';
import 'package:astra_app/presentation/auth/widgets/screen_content.dart';
import 'package:astra_app/presentation/auth/widgets/timer_text_widget.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/buttons/astra_elevated_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// SMS Code entry screen.
class CodeScreen extends StatelessWidget {
  /// A phone number for signin/signup.
  final String phoneNumber;
  const CodeScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CodeBloc>(
      create: (_) => getIt<CodeBloc>()..add(CodeEvent.initialized(phoneNumber)),
      child: BlocBuilder<CodeBloc, CodeState>(
        builder: (context, state) {
          return ScreenContent(
            onBackPressed: () => context.router.pop(),
            title: "Код из сообщения",
            textFieldContent: PinCodeField(
              isError: state.isShowErrorMessage,
              onChanged: (value) => context.read<CodeBloc>().add(
                    CodeEvent.changeCodeValue(value),
                  ),
              onCompleted: (value) => context.read<CodeBloc>().add(
                    CodeEvent.onSubmitCode(value),
                  ),
            ),
            notificationMessageContent: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.isShowErrorMessage
                      ? "Неправильный код\nПовторите пожалуйста еще раз."
                      : "Отправить поторно",
                  style: TextStyle(
                      color: state.isShowErrorMessage
                          ? AstraColors.red
                          : AstraColors.black06),
                ),
                const SizedBox(height: 4),
                const TimerTextWidget()
              ],
            ),
            button: AstraElevatedButton(
              isEnableButton: true,
              title: 'Продолжить',
              onClick: () {
                AutoRouter.of(context).replace(
                  PasswordScreenRoute(
                    phoneNumber: state.phoneNumber,
                    code: state.code,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
