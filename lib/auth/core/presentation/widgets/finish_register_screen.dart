import 'package:astra_app/auth/core/application/auth_bloc.dart';
import 'package:astra_app/core/presentation/constants/app_tests.dart';
import 'package:astra_app/core/presentation/routes/app_router.gr.dart';
import 'package:astra_app/core/presentation/widgets/buttons/astra_button.dart';
import 'package:astra_app/core/presentation/widgets/logo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishRegisterScreen extends StatelessWidget {
  const FinishRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromRGBO(24, 38, 71, 1),
                Color.fromRGBO(30, 49, 90, 1),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.decal,
              stops: [0.0, 1.0]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 5,
              child: const Logo(logoWithText: true),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/left_girl.png'),
                      const SizedBox(width: 40),
                      Image.asset('assets/right_girl.png'),
                    ],
                  ),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width / 7,
                  top: -20,
                  child: Image.asset('assets/middle_girl.png'),
                ),
              ],
            ),
            const Text(
              AppTexts.accessOpened,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            AstraButton(
              title: AppTexts.startBrowsing,
              onTap: () {
                context.read<AuthBloc>().add(const AuthEvent.firstAuthSet());
                context.router.push(const HomeScreenRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
