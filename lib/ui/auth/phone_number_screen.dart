import 'package:astra_app/api/auth/application/phone/phone_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/routes/app_router.gr.dart';
import 'package:astra_app/ui/auth/constants/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/screen_content.dart';

/// Phone number entry screen.
class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhoneBloc>(
      create: (_) => getIt<PhoneBloc>()..add(const PhoneEvent.initialized()),
      child: BlocConsumer<PhoneBloc, PhoneState>(
        listener: (context, state) {
          if (state.redirectToPasswordScreen) {
            AutoRouter.of(context).push(
              PasswordScreenRoute(phoneNumber: state.phoneNumber),
            );
          }
          if (state.redirectConfirmCode) {
            AutoRouter.of(context).push(
              CodeScreenRoute(phoneNumber: state.phoneNumber),
            );
          }
        },
        builder: (context, state) {
          return ScreenContent(
            title: "Мой номер телефона",
            textFieldContent: TextFormField(
              style: const TextStyle(fontSize: 24),
              inputFormatters: [maskFormatter],
              autofocus: true,
              decoration:
                  const InputDecoration(hintText: "Введите номер телефона"),
              onChanged: (value) {
                context.read<PhoneBloc>().add(
                      PhoneEvent.changedTextValue(value),
                    );
              },
              autovalidateMode: AutovalidateMode.disabled,
            ),
            isEnableButton: state.isEnableBtn,
            clickButton: () {
              context.read<PhoneBloc>().add(const PhoneEvent.pressedBtn());
              context.read<PhoneBloc>().add(const PhoneEvent.resetStates());
            },
            notificationMessageContent: const Text(
              "Вам придёт сообщение с кодом.\nНикому его не говорите.",
            ),
          );
        },
      ),
    );
  }
}
