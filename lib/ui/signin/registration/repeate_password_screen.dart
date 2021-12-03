import 'package:astra_app/bloc/password/password_cubit.dart';
import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/glodal/widgets/buttons/astra_gradient_button.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/save_scaffold.dart';

import 'package:astra_app/ui/signin/registration/password_screen.dart';

import 'package:astra_app/ui/signin/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepeatePasswordScreen extends StatefulWidget {
  const RepeatePasswordScreen({Key? key}) : super(key: key);

  static const String routeName = '/repeatepasswordscreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const RepeatePasswordScreen(),
    );
  }

  @override
  State<RepeatePasswordScreen> createState() => _RepeatePasswordScreenState();
}

class _RepeatePasswordScreenState extends State<RepeatePasswordScreen> {
  bool isCorrectPassword = true;
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
      final psw =
          '${controller1.text}${controller2.text}${controller3.text}${controller4.text}';
      if (psw.length == 4) {
        final firstPsw = context.read<PasswordCubit>().state.password;
        if (psw == firstPsw) {
          isCorrectPassword = true;
        } else {
          isCorrectPassword = false;
        }
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
          Navigator.of(context).popAndPushNamed(PasswordScreen.routeName);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Повторите пароль',
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
                      style: const TextStyle(
                        fontSize: 24,
                        color: AstraColors.color_24_24_24_1,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '*',
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
                      style: const TextStyle(
                        fontSize: 24,
                        color: AstraColors.color_24_24_24_1,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '*',
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
                      controller: controller3,
                      focusNode: focusNode3,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: const TextStyle(
                        fontSize: 24,
                        color: AstraColors.color_24_24_24_1,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '*',
                        hintStyle: TextStyle(
                          fontSize: 24,
                          color: AstraColors.color_24_24_24_1,
                        ),
                      ),
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
                      controller: controller4,
                      focusNode: focusNode4,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: const TextStyle(
                        fontSize: 24,
                        color: AstraColors.color_24_24_24_1,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '*',
                        hintStyle: TextStyle(
                          fontSize: 24,
                          color: AstraColors.color_24_24_24_1,
                        ),
                      ),
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
              (!isCorrectPassword) ? const SizedBox(height: 18) : Container(),
              (!isCorrectPassword)
                  ? Text(
                      'Неправильный пароль.\nПовторите пожалуйста еще раз.',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AstraColors.color_223_54_54_1,
                          ),
                    )
                  : Container(),
              (!isCorrectPassword)
                  ? SizedBox(
                      height: (MediaQuery.of(context).size.height / 4) - 18)
                  : SizedBox(height: MediaQuery.of(context).size.height / 4),
              (!isCorrectPassword)
                  ? Align(
                      alignment: Alignment.center,
                      child: AstraGradientButton(
                          title: 'Продолжить',
                          onTap: () {},
                          type: ButtonType.waiting),
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: AstraGradientButton(
                          title: 'Продолжить',
                          onTap: () {
                            context.read<PasswordCubit>().savePassword();
                            Navigator.pushNamed(
                                context, SplashScreen.routeName);
                          },
                          type: ButtonType.success),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
