import 'package:astra_app/domain/applicant/applicant.dart';
import 'package:astra_app/presentation/astra/search/applicants/applicant_detail_screen.dart';
import 'package:astra_app/presentation/astra/search/applicants/widgets/applicant_main_card.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';


import 'widgets/applicant_elevated_button.dart';
import 'widgets/curator_tail.dart';

///Applicant screen, shows the detail info about applicant
class ApplicantScreen extends StatelessWidget {
  const ApplicantScreen({Key? key, required this.applicant}) : super(key: key);

  ///Applicant data
  final Applicant applicant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody:true ,
      appBar: AppBar(
        backgroundColor: AstraColors.blackMetallic07,
        leading: Container(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset(applicant.mainImage).image,
              fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ApplicationMainCardScreen(
                applicant: applicant,
                onClose: () {
                  AutoRouter.of(context).pop();
                }),
            const SizedBox(height: 16),
            const CuratorTile(),
            const SizedBox(height: 48),
            ApplicantElevatedButton(
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return ApplicantDetailScreen(applicant: applicant);
                  },
                ));
              },
              isEnableButton: true,
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
