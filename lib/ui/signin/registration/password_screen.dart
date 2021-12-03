import 'package:astra_app/bloc/password/password_cubit.dart';
import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/glodal/widgets/buttons/astra_gradient_button.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/save_scaffold.dart';
import 'package:astra_app/ui/signin/registration/sms_code_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repeate_password_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  static const String routeName = '/passwordscreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const PasswordScreen(),
    );
  }

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
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
        isCorrectPassword = true;
      } else {
        isCorrectPassword = false;
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
          Navigator.of(context).popAndPushNamed(SmsCodeScreen.routeName);
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
                'Создание пароля',
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
              SizedBox(height: MediaQuery.of(context).size.height / 4),
              (isCorrectPassword)
                  ? Align(
                      alignment: Alignment.center,
                      child: AstraGradientButton(
                          title: 'Продолжить',
                          onTap: () {
                            final psw =
                                '${controller1.text}${controller2.text}${controller3.text}${controller4.text}';
                            context.read<PasswordCubit>().onChangePassword(psw);
                            Navigator.pushNamed(
                                context, RepeatePasswordScreen.routeName);
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
    );
  }
}
