import 'package:astra_app/application/settings/application/application_cubit.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/astra/settings/application_form/widgets/application_form_card.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/widgets/custom/platform.activity_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Defines application form screen
class ApplicationFormScreen extends StatelessWidget {
  const ApplicationFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApplicationCubit>(
      create: (context) => getIt<ApplicationCubit>()..getProfileWithImages(),
      child: Scaffold(
        body: BlocBuilder<ApplicationCubit, ApplicationState>(
          builder: (context, state) {
            if (state.isSuccess) {
              return Stack(
                children: [
                  ApplicationFormCard(
                    onTap: () {
                      context.router.push(
                        ApplicantScreenFromSettingsRouter(
                          applicant: state.profile,
                          image: (state.profileImage == null)
                              ? Image.asset('assets/girl.png').image
                              : Image.file(state.profileImage!).image,
                          curatorImage: (state.curatorImage == null)
                              ? Image.asset('assets/girl.png').image
                              : Image.file(state.curatorImage!).image,
                        ),
                      );
                    },
                    profile: state.profile,
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
              );
            } else {
              return const Center(child: PlatformActivityIndicator());
            }
          },
        ),
      ),
    );
  }
}
