import 'package:astra_app/application/auth/phone/phone_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/buttons/astra_elevated_button.dart';
import 'package:astra_app/presentation/core/widgets/buttons/dialog_action_button.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/dialog_one_actions.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/constants.dart';
import 'widgets/screen_content.dart';

/// Phone number entry screen.
class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhoneBloc>(
      create: (_) => getIt<PhoneBloc>()..add(const PhoneEvent.initialized()),
      child: BlocListener<PhoneBloc, PhoneState>(
          listener: (context, listenState) {
            if (listenState.redirectToPasswordScreen) {
              AutoRouter.of(context).push(
                PasswordScreenRoute(phoneNumber: listenState.phoneNumber),
              );
            }
            if (listenState.redirectConfirmCode) {
              showDialog(
                context: context,
                builder: (context) => DialogOneAction(
                  content: Column(
                    children: const [
                      Text(
                        'Номер в базе\nне зарегистрирован',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Для регистрации обратитесь\nв службу поддержки по номеру',
                        style: TextStyle(
                            color: AstraColors.dialogContent, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '+ 7111 111 11 11',
                        style: TextStyle(color: AstraColors.blue, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  action: DialogActionButton(
                    title: "Спасибо",
                    onClick: () => context.router.pop(),
                  ),
                ),
              );
            }
            if (listenState.isNoConnection) {
              showSnackBar(context);
            }
          },
          child: ScreenContent(
            title: "Мой номер телефона",
            textFieldContent:
                BlocBuilder<PhoneBloc, PhoneState>(builder: (context, state) {
              return TextFormField(
                style: const TextStyle(fontSize: 24),
                inputFormatters: [maskFormatter],
                autofocus: true,
                keyboardType: TextInputType.phone,
                decoration:
                    const InputDecoration(hintText: "Введите номер телефона"),
                onChanged: (value) {
                  context.read<PhoneBloc>().add(
                        PhoneEvent.changedTextValue(value),
                      );
                },
                autovalidateMode: AutovalidateMode.disabled,
              );
            }),
            button:
                BlocBuilder<PhoneBloc, PhoneState>(builder: (context, state) {
              return AstraElevatedButton(
                isLoading: state.isLoading,
                isEnableButton: state.isEnableBtn,
                title: 'Продолжить',
                onClick: () {
                  context.read<PhoneBloc>().add(const PhoneEvent.pressedBtn());
                },
              );
            }),
            notificationMessageContent: const Text(
              "Вам придёт сообщение с кодом.\nНикому его не говорите.",
            ),
          )),
    );
  }
}
