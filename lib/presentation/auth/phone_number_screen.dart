import 'package:astra_app/application/auth/phone/phone_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/widgets/buttons/astra_elevated_button.dart';
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
              // context.read<PhoneBloc>().add(const PhoneEvent.resetStates());
            }
            if (listenState.redirectConfirmCode) {
              //todo: Remove when back (registration) will be ready.
              showSnackBar(context,
                  title: "Регистрация в данный момент не доступна");
              //todo: Uncomment when back (registration) will be ready.
              // AutoRouter.of(context).push(
              //   CodeScreenRoute(phoneNumber: state.phoneNumber),
              // );
              // context.read<PhoneBloc>().add(const PhoneEvent.resetStates());
            }
            if (listenState.isNoConnection) {
              showSnackBar(context);
              // context.read<PhoneBloc>().add(const PhoneEvent.resetStates());
            }
          },
          child: ScreenContent(
            title: "Мой номер телефона",
            textFieldContent: BlocBuilder<PhoneBloc, PhoneState>(
                // buildWhen: (previous, current) =>
                // previous.phoneNumber != current.phoneNumber,
                builder: (context, state) {
              return TextFormField(
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
