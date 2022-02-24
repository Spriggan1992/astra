import 'package:astra_app/application/search/profile_properties/profile_properties_bloc.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/astra/search/applicants/applicant_detail_screen.dart';
import 'package:astra_app/presentation/astra/search/applicants/widgets/applicant_main_card.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import 'widgets/applicant_elevated_button.dart';
import 'widgets/curator_tail.dart';

/// Applicant screen, shows the detail info about applicant
class ApplicantScreen extends StatelessWidget {
  const ApplicantScreen(
      {Key? key,
      required this.applicant,
      required this.image,
      required this.curatorImage})
      : super(key: key);

  /// Applicant data
  final Profile applicant;

  /// Applicant main profile image
  final ImageProvider image;

  /// Currator image.
  final ImageProvider? curatorImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AstraColors.blackMetallic07,
        leading: Container(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ApplicationMainCardScreen(
                applicant: applicant,
                onClose: () {
                  context.router.pop();
                }),
            const SizedBox(height: 16),
            CuratorTile(
                curatorFullName: applicant.curatorFullName,
                curatorImage: curatorImage!),
            const SizedBox(height: 48),
            ApplicantElevatedButton(
              onClick: () {
                getIt<ProfilePropertiesBloc>()
                    .add(ProfilePropertiesEvent.load(applicant.id));

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return ApplicantDetailScreen(
                        applicant: applicant,
                        image: image,
                      );
                    },
                  ),
                );

                ///TODO Убрать комментарий и использовать код в комменте. Но сейчас почему то выходить ошибка.
                // context.router.push(
                //   ApplicantDetailScreenRoute(
                //     applicant: applicant,
                //     image: image,
                //   ),
                // );
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
