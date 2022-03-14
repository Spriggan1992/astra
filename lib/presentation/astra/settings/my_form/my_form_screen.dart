import 'package:astra_app/application/settings/application/application_cubit.dart';
import 'package:astra_app/domain/favorites/match_status.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/astra/settings/my_form/widgets/my_form_card.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/widgets/custom/platform.activity_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Defines application form screen
class MyFormScreen extends StatelessWidget {
  final MatchStatus matchStatus;
  const MyFormScreen({
    Key? key,
    this.matchStatus = MatchStatus.initial,
  }) : super(key: key);

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
                  MyFormCard(
                    onTap: () {
                      context.router.push(
                        SettingsUserInfoScreenRouter(
                          applicant: state.profile,
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
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        leading: IconButton(
                          onPressed: () {
                            context.popRoute();
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
