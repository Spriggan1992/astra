import 'dart:io';

import 'package:astra_app/domain/core/services/i_user_unfo_service.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/astra/search/applicants/applicant_screen.dart';
import 'package:astra_app/presentation/astra/settings/application_form/widgets/application_form_card.dart';


import 'package:flutter/material.dart';

/// Defines application form screen
class ApplicationFormScreen extends StatefulWidget {
  const ApplicationFormScreen({Key? key}) : super(key: key);

  @override
  State<ApplicationFormScreen> createState() => _ApplicationFormScreenState();
}

class _ApplicationFormScreenState extends State<ApplicationFormScreen> {
  final Profile profile = getIt<IUserInfoService>().userProfile;

  File? profileImage;
  File? curatorImage;

  @override
  void initState() {
    super.initState();
    final profileImage = profile.profilePhotos.first.fileImage;
    final curatorImage = profile.curatorPhotos.first.fileImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ApplicationFormCard(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return ApplicantScreen(
                        applicant: profile, // //

                        image: (profileImage == null)
                            ? Image.asset('assets/girl.png').image
                            : Image.file(profileImage!).image,
                        curatorImage: (curatorImage == null)
                            ? Image.asset('assets/girl.png').image
                            : Image.file(curatorImage!).image);
                  },
                ),
              );
            },
            profile: getIt<IUserInfoService>().userProfile,
          ),
          AnimatedOpacity(
            opacity: 1,
            duration: const Duration(milliseconds: 100),
            child: SizedBox(
              height: 80,
              child: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
