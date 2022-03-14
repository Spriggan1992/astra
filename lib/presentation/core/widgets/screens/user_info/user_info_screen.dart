import 'dart:developer';

import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:astra_app/presentation/core/widgets/screens/user_info/widgets/user_info_main_card.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import 'widgets/user_info_elevated_button.dart';
import 'widgets/curator_tail.dart';

/// Applicant screen, shows the detail info about applicant
class UserInfoScreen extends StatelessWidget {
  /// Applicant data
  final Profile applicant;

  const UserInfoScreen({
    Key? key,
    required this.applicant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          AstraNetworkImage(
              imageUrl: applicant.profilePhotos.first.imageUrl,
              isOverlayBackground: true,
              fileImage: applicant.profilePhotos.first.cachedImage?.fullImage ==
                      null
                  ? null
                  : FileImage(
                      applicant.profilePhotos.first.cachedImage!.fullImage!)),
          CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UserInfoMainCardScreen(
                          applicant: applicant,
                          onClose: () {
                            context.router.pop();
                          }),
                      const SizedBox(height: 16),
                      CuratorTile(
                        curatorFullName: applicant.curatorFullName,
                        curatorImage: applicant.curatorPhotos.first,
                      ),
                      const SizedBox(height: 48),
                      UserInfoElevatedButton(
                        onClick: () =>
                            _navigateToUserInfoDetailScreen(context, applicant),
                        isEnableButton: applicant.showInfo,
                      ),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _navigateToUserInfoDetailScreen(
    BuildContext context,
    Profile userInfo,
  ) {
    final routeName = context.router.current.name;
    log(routeName);
    if (routeName == 'SearchUserInfoRouter') {
      context.navigateTo(SearchUserInfoDetailRouter(userInfo: userInfo));
    }
    if (routeName == 'FavoritesUserInfoRouter') {
      context.navigateTo(FavoritesUserInfoDetailRouter(userInfo: userInfo));
    }
    if (routeName == 'SettingsUserInfoScreenRouter') {
      context.navigateTo(SettingsUserInfoDetailRouter(userInfo: userInfo));
    }
  }
}
