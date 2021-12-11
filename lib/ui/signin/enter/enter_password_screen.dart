import 'package:astra_app/bloc/auth/auth_bloc.dart';
import 'package:astra_app/bloc/password/password_cubit.dart';
import 'package:astra_app/routes/app_router.gr.dart';
import 'package:astra_app/ui/astra/store_screen.dart';
import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/glodal/widgets/buttons/astra_gradient_button.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/save_scaffold.dart';
import 'package:astra_app/ui/signin/enter/enter_screen.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astra_app/api/api.dart';

class EnterPasswordScreen extends StatefulWidget {
  const EnterPasswordScreen({Key? key}) : super(key: key);

  static const String routeName = '/enterpasswordscreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const EnterPasswordScreen(),
    );
  }

  @override
  State<EnterPasswordScreen> createState() => _EnterasswordScreenState();
}

// var api = API.auth.

class _EnterasswordScreenState extends State<EnterPasswordScreen> {
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
        final firstPsw = context.read<AuthBloc>().state.password;
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
          AutoRouter.of(context).push(const EnterScreenRoute());
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
                'Введите пароль',
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
                        color: AstraColors.black,
                      ),
                      textAlign: TextAlign.center,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        // hintText: '*',
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
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: const TextStyle(
                        fontSize: 24,
                        color: AstraColors.black,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '*',
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
                      controller: controller3,
                      focusNode: focusNode3,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: const TextStyle(
                        fontSize: 24,
                        color: AstraColors.black,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '*',
                        hintStyle: TextStyle(
                          fontSize: 24,
                          color: AstraColors.black,
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
                        color: AstraColors.black,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '*',
                        hintStyle: TextStyle(
                          fontSize: 24,
                          color: AstraColors.black,
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
                            color: AstraColors.red,
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
                            context.read<PasswordCubit>().enterToApp();
                            AutoRouter.of(context)
                                .push(const StoreScreenRoute());
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
