import 'package:astra_app/bloc/login/login_cubit.dart';
import 'package:astra_app/routes/app_router.gr.dart';
import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/glodal/widgets/buttons/astra_gradient_button.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/save_scaffold.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'timer_text_widget.dart';

class SmsCodeScreen extends StatefulWidget {
  const SmsCodeScreen({Key? key}) : super(key: key);

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
      final recivedSms = context.read<LoginCubit>().state.smsCode;
      if (recivedSms == smscode) {
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
    return BlocProvider(
        create: (_) => BlocProvider.of<LoginCubit>(context)..getSmsCode(),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) => SafeScaffold(
            appBar: AstraAppBar(
              elevation: 0,
              title: '',
              onPressed: () {
                AutoRouter.of(context).pop();
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
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 24,
                            color: AstraColors.black,
                          ),
                          decoration: const InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(
                              fontSize: 24,
                              color: AstraColors.black,
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
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 24,
                            color: AstraColors.black,
                          ),
                          decoration: const InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(
                              fontSize: 24,
                              color: AstraColors.black,
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
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            color: AstraColors.black,
                          ),
                          decoration: const InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(
                              fontSize: 24,
                              color: AstraColors.black,
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
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            color: AstraColors.black,
                          ),
                          decoration: const InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(
                              fontSize: 24,
                              color: AstraColors.black,
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
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontSize: 12,
                                    color: AstraColors.grey,
                                  ),
                        )
                      : Text(
                          'Не правильный код.',
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: AstraColors.orange,
                                  ),
                        ),
                  (isCorrectSms)
                      ? const TimerTextWidget()
                      : Text(
                          'Повторите пожалуйста еще раз.',
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: AstraColors.orange,
                                  ),
                        ),
                  SizedBox(height: MediaQuery.of(context).size.height / 4),
                  (isCorrectSms)
                      ? Align(
                          alignment: Alignment.center,
                          child: AstraGradientButton(
                              title: 'Продолжить',
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(const PasswordScreenRoute());
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
          ),
        ));
  }
}
