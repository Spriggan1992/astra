import 'package:astra_app/application/core/enums/search_state_type.dart';
import 'package:astra_app/application/search/profile_properties/profile_properties_bloc.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/astra/search/applicants/widgets/applicant_info_card.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/custom/platform.activity_indicator.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Opens when clicking on the button [Подробная анкета].
///
/// Detailed application form of the applicant,
/// Shows data such as characteristic,capabilities e.t.s
class ApplicantDetailScreen extends StatelessWidget {
  const ApplicantDetailScreen(
      {Key? key, required this.applicant, required this.image})
      : super(key: key);

  /// Profile of the applicant
  final Profile applicant;

  /// Applicant image path for display
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AstraColors.blackMetallic07,
        centerTitle: true,
        title: const Text(
          'Подробная анкета',
          style: TextStyle(color: AstraColors.white, fontSize: 17),
        ),
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(Icons.arrow_back_ios, color: AstraColors.white),
        ),
      ),
      body: BlocBuilder<ProfilePropertiesBloc, ProfilePropertiesState>(
        builder: (context, state) {
          if (state.stateType == SearchStateType.success) {
            return state.profileProperties.isEmpty
                ? const Center(child: Text('Список пуст.'))
                : DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(
                          top: 16, left: 15, right: 15, bottom: 60),
                      itemCount: state.profileProperties.length,
                      itemBuilder: (context, index) {
                        final additionalInfo = state.profileProperties[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                          child: ApplicantInfoCard(
                            title: additionalInfo.title,
                            desc: additionalInfo.value,
                          ),
                        );
                      },
                    ),
                  );
          } else if (state.stateType == SearchStateType.failure) {
            return ErrorScreen(
              failure: state.isUnexpectedError
                  ? const AstraFailure.api()
                  : const AstraFailure.noConnection(),
              onTryAgain: () {
                getIt<ProfilePropertiesBloc>()
                    .add(ProfilePropertiesEvent.load(applicant.id));
              },
            );
          } else {
            return const Scaffold(
              body: Center(
                child: PlatformActivityIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
