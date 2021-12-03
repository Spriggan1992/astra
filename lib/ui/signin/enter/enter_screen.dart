import 'package:astra_app/bloc/login/login_cubit.dart';
import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/glodal/widgets/buttons/astra_gradient_button.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/save_scaffold.dart';
import 'package:astra_app/ui/signin/registration/sms_code_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterScreen extends StatelessWidget {
  const EnterScreen({Key? key}) : super(key: key);

  static const String routeName = '/enterscreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const EnterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon:
              const Icon(CupertinoIcons.back, color: Colors.black26, size: 30),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Мой номер телефона',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: AstraColors.color_24_24_24_1,
                ),
                decoration: const InputDecoration(
                  helperStyle: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(24, 24, 24, 1),
                  ),
                  hintText: '+79114327',
                  hintStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: AstraColors.color_24_24_24_1,
                  ),
                ),
                onChanged: (value) {
                  //context.read<LoginCubit>().changePhoneNumber(value);
                },
              ),
            ),
            const SizedBox(height: 100),
            Align(
              alignment: Alignment.center,
              child: AstraGradientButton(
                  title: 'Продолжить',
                  onTap: () {
                    Navigator.pushNamed(context, SmsCodeScreen.routeName);
                  },
                  type: ButtonType.success),
            ),
          ],
        ),
      ),
    );
  }
}
