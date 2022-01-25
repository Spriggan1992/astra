import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';


///Opens when clicking on the button [Подробная анкета].
///
///Detailed application form of the applicant, 
///Shows data such as characteristic,capabilities e.t.s 
class ApplicantDetailScreen extends StatelessWidget {
  const ApplicantDetailScreen({Key? key, required this.applicant, required this.image}) : super(key: key);

  ///Applicant main profile image
  final Profile applicant; 
   
  ///Applicant image path for display 
  final String image; 

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
                image: Image.asset(image).image, fit: BoxFit.cover),
          ),
          child:ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 16, left: 15, right: 15, bottom: 60),
            itemCount: 10,//applicant.additionalInfo.length,
            itemBuilder: (context, index) {
              //final additionalInfo = applicant.additionalInfo.elementAt(index); 
            return Padding(
              padding: const EdgeInsets.only(top:8.0, bottom:16 ),
              child: Text(applicant.profileInfo),//ApplicantInfoCard(title: additionalInfo.title,desc: additionalInfo.desc),
            ); 
          },) 
      ),
    );
  }
}
