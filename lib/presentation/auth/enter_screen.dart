import 'package:astra_app/presentation/core/theming/gradients.dart';
import 'package:astra_app/presentation/core/widgets/buttons/astra_button.dart';
import 'package:astra_app/presentation/core/widgets/logo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

/// Screen that appears after splash screen and before phone screen
class EnterScreen extends StatelessWidget {
  const EnterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: Gradients.blueGradient,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(logoWithText: true),
            const SizedBox(height: 140),
            AstraButton(
              title: "Войти",
              onTap: () => context.router.push(const PhoneNumberScreenRoute()),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => context.router.push(const HowToGetClubScreenRoute()),
              child: const Text(
                "Как вступить в клуб?",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
