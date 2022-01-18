import 'package:astra_app/domain/applicant/applicant.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

import 'widgets/applicant_info_card.dart';

///Opens when clicking on the button [Подробная анкета].
///
///Detailed application form of the applicant, 
///Shows data such as characteristic,capabilities e.t.s 
class ApplicantDetailScreen extends StatelessWidget {
  const ApplicantDetailScreen({Key? key, required this.applicant}) : super(key: key);

  final Applicant applicant; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AstraColors.blackMetallic07,
        centerTitle: true,
        title:const  Text(
          'Подробная анкета',
          style: TextStyle(color: AstraColors.white, fontSize: 17),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios, color: AstraColors.white),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset(applicant.mainImage).image, fit: BoxFit.cover),
          ),
          child:ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 16, left: 15, right: 15, bottom: 60),
            itemCount: applicant.additionalInfo.length,
            itemBuilder: (context, index) {
              final additionalInfo = applicant.additionalInfo.elementAt(index); 
            return Padding(
              padding: const EdgeInsets.only(top:8.0, bottom:16 ),
              child: ApplicantInfoCard(title: additionalInfo.title,desc: additionalInfo.desc),
            ); 
          },) 
      ),
    );
  }
}
