import 'package:astra_app/application/core/enums/search_state_type.dart';
import 'package:astra_app/application/search/profile_properties/profile_properties_bloc.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/custom/platform.activity_indicator.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_app/presentation/core/widgets/screens/user_info/widgets/user_info_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent detailed information about user.
class UserInfoDetailScreen extends StatelessWidget {
  /// Profile of the applicant
  final Profile userInfo;

  const UserInfoDetailScreen({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilePropertiesBloc>(
      create: (context) => getIt<ProfilePropertiesBloc>()
        ..add(
          ProfilePropertiesEvent.load(userInfo.id),
        ),
      child: Scaffold(
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
            if (state.stateType == SearchStateType.failure) {
              return ErrorScreen(
                failure: state.isUnexpectedError
                    ? const AstraFailure.api()
                    : const AstraFailure.noConnection(),
                onTryAgain: () {
                  context
                      .read<ProfilePropertiesBloc>()
                      .add(ProfilePropertiesEvent.load(userInfo.id));
                },
              );
            } else {
              return Stack(
                children: [
                  AstraNetworkImage(
                    imageUrl: userInfo.profilePhotos.first.imageUrl,
                    isOverlayBackground: true,
                    fileImage:
                        userInfo.profilePhotos.first.cachedImage?.fullImage ==
                                null
                            ? null
                            : Image.file(userInfo.profilePhotos.first
                                    .cachedImage!.fullImage!)
                                .image,
                  ),
                  _UserInfoDetailStackContent(state: state)
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class _UserInfoDetailStackContent extends StatelessWidget {
  final ProfilePropertiesState state;
  const _UserInfoDetailStackContent({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.stateType == SearchStateType.success) {
      if (state.profileProperties.isEmpty) {
        return const Center(
          child: Text(
            'Пользователь не заполнил\nподробную информацию',
            style: TextStyle(color: AstraColors.white),
          ),
        );
      } else {
        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding:
              const EdgeInsets.only(top: 16, left: 15, right: 15, bottom: 60),
          itemCount: state.profileProperties.length,
          itemBuilder: (context, index) {
            final additionalInfo = state.profileProperties[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16),
              child: UserInfoCard(
                title: additionalInfo.title,
                desc: additionalInfo.value,
              ),
            );
          },
        );
      }
    } else {
      return const Center(
        child: PlatformActivityIndicator(),
      );
    }
  }
}
