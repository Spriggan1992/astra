import 'package:astra_app/core/presentation/constants/app_tests.dart';
import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/theming/gradients.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/astra_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HowToGetClubScreen extends StatelessWidget {
  const HowToGetClubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: Gradients.blueGradient,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                tileMode: TileMode.decal,
                stops: [0.0, 1.0],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40)
                        .add(const EdgeInsets.only(top: 70)),
                    child: const Text(
                      AppTexts.howToGetClubWithowtQuestion,
                      style: TextStyle(color: AstraColors.white, fontSize: 28),
                    ),
                  ),
                  _buildLineText(AppTexts.realPeople),
                  _buildLineText(AppTexts.realPeopleGoal),
                  _buildLineText(
                    AppTexts.realPeopleWhantsWhat,
                  ),
                  _buildLineText(AppTexts.weSupportRealPeople),
                  _buildLineText(AppTexts.realPeopleRegistratedInOffice),
                  _buildLineText(AppTexts.realPeopleRegistrationIsPaid),
                  _buildLineText(AppTexts.realPeopleContactUs),
                ],
              ),
            ),
          ),
          AstraAppBar(
            iconColor: AstraColors.white02,
            elevation: 0,
            bgColor: Colors.transparent,
            onPressed: () => context.router.pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildLineText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: const TextStyle(
          color: AstraColors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
