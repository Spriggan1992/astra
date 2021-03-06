import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/widgets/images/astra_file_image.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/astra_appbar.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/loading_screen.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/settings/my_profile/domain/models/profile_short_model.dart';
import 'package:astra_app/settings/settings/application/settings_bloc.dart';
import 'package:astra_app/settings/settings/presentation/widgets/settings_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Defines settings screen.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<SettingsBloc>()..add(const SettingsEvent.profileLoaded()),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loadInProgress: (_) => const LoadingScreen(),
            loadFailure: (state) => ErrorScreen(
              failure: state.failure,
              onTryAgain: () => context.read<SettingsBloc>()
                ..add(const SettingsEvent.profileLoaded()),
            ),
            loadSuccess: (state) =>
                SettingsScreenBodyContent(profile: state.profile),
          );
        },
      ),
    );
  }
}

/// Defines content for SettingsScreen.
class SettingsScreenBodyContent extends StatelessWidget {
  /// Profile information.
  final ProfileShortModel profile;
  const SettingsScreenBodyContent({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const AstraAppBar(
          title: '??????????????????',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color.fromRGBO(240, 241, 243, 1),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  leading: AstraFileImage(
                    image: profile.avatar,
                    height: 55,
                    width: 55,
                  ),
                  title: Text(
                    profile.userInfo,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AstraColors.black,
                    ),
                  ),
                  subtitle: Text(
                    profile.userLocation,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AstraColors.black06,
                    ),
                  ),
                ),
              ),
              SettingsItems(
                profile: profile,
              )
            ],
          ),
        ),
      ),
    );
  }
}
