import 'package:astra_app/bloc/login/login_cubit.dart';
import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/glodal/widgets/buttons/astra_gradient_button.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/save_scaffold.dart';
import 'package:astra_app/ui/signin/registration/first_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'password_screen.dart';
import 'timer_text_widget.dart';

class SmsCodeScreen extends StatefulWidget {
  const SmsCodeScreen({Key? key}) : super(key: key);

  static const String routeName = '/smscodescreen';

  static Route route() {
    return PageRouteBuilder(
      settings: const RouteSettings(name: routeName),
      transitionDuration: const Duration(seconds: 0),
      pageBuilder: (context, animation, secondaryAnimation) =>
          BlocProvider<LoginCubit>.value(
        value: BlocProvider.of<LoginCubit>(context)..getSmsCode(),
        child: const SmsCodeScreen(),
      ),
    );
  }

  @override
  State<SmsCodeScreen> createState() => _SmsCodeScreenState();
}

class _SmsCodeScreenState extends State<SmsCodeScreen> {
  bool isCorrectSms = true;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  @override
  void initState() {
    focusNode1.requestFocus();
    super.initState();
  }

  _validate(String value) {
    if (value.isNotEmpty) {
      final smscode =
          '${controller1.text}${controller2.text}${controller3.text}${controller4.text}';
      final resivedSms = context.read<LoginCubit>().state.smsCode;
      if (resivedSms == smscode) {
        isCorrectSms = true;
      } else {
        isCorrectSms = false;
      }

      setState(() {});
    }
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      appBar: AstraAppBar(
        elevation: 0,
        title: '',
        onPressed: () {
          Navigator.of(context).popAndPushNamed(FirstSignin.routeName);
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Код из сообщения',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: TextFormField(
                    controller: controller1,
                    focusNode: focusNode1,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 24,
                      color: AstraColors.color_24_24_24_1,
                    ),
                    decoration: const InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        color: AstraColors.color_24_24_24_1,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _validate(value);
                        focusNode1.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: TextFormField(
                    controller: controller2,
                    focusNode: focusNode2,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 24,
                      color: AstraColors.color_24_24_24_1,
                    ),
                    decoration: const InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        color: AstraColors.color_24_24_24_1,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _validate(value);
                        focusNode2.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 24,
                      color: AstraColors.color_24_24_24_1,
                    ),
                    decoration: const InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        color: AstraColors.color_24_24_24_1,
                      ),
                    ),
                    controller: controller3,
                    focusNode: focusNode3,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _validate(value);
                        focusNode3.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 24,
                      color: AstraColors.color_24_24_24_1,
                    ),
                    decoration: const InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        color: AstraColors.color_24_24_24_1,
                      ),
                    ),
                    controller: controller4,
                    focusNode: focusNode4,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _validate(value);
                        focusNode4.nextFocus();
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            (isCorrectSms)
                ? Text(
                    'Отправить повторно',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontSize: 12,
                          color: AstraColors.color_24_24_24_04,
                        ),
                  )
                : Text(
                    'Не правильный код.',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AstraColors.color_198_81_65_1,
                        ),
                  ),
            (isCorrectSms)
                ? const TimerTextWidget()
                : Text(
                    'Повторите пожалуйста еще раз.',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AstraColors.color_198_81_65_1,
                        ),
                  ),
            SizedBox(height: MediaQuery.of(context).size.height / 4),
            (isCorrectSms)
                ? Align(
                    alignment: Alignment.center,
                    child: AstraGradientButton(
                        title: 'Продолжить',
                        onTap: () {
                          Navigator.pushNamed(
                              context, PasswordScreen.routeName);
                        },
                        type: ButtonType.success),
                  )
                : Align(
                    alignment: Alignment.center,
                    child: AstraGradientButton(
                        title: 'Продолжить',
                        onTap: () {},
                        type: ButtonType.waiting),
                  ),
          ],
        ),
      ),
    );
  }
}
