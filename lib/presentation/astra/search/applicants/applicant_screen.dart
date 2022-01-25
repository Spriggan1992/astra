import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/astra/search/applicants/applicant_detail_screen.dart';
import 'package:astra_app/presentation/astra/search/applicants/widgets/applicant_main_card.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';


import 'widgets/applicant_elevated_button.dart';
import 'widgets/curator_tail.dart';

///Applicant screen, shows the detail info about applicant
class ApplicantScreen extends StatelessWidget {
  const ApplicantScreen({Key? key, required this.applicant, required this.image}) : super(key: key);

  ///Applicant data 
  final Profile applicant;

  /// Applicant main profile image
  final String image; 
  
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
              image: Image.asset(image).image,
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
                    return ApplicantDetailScreen(applicant: applicant, image: image);
                  },
                ));
              },
              isEnableButton: applicant.showInfo,
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
