import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/astra/favorite/favorite_info_card.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// User application form info card.
class MyFormCard extends StatelessWidget {
  // final String desc;
  final Profile profile;

  /// Button click event handler on tap favorite card.
  final VoidCallback onTap;

  const MyFormCard({
    Key? key,
    required this.profile,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => context.navigateTo(ShowImageFullScreenRoute(
            images: profile.profilePhotos,
            enableDeleteButton: false,
          )),
          child: AstraNetworkImage(
            imageUrl: profile.profilePhotos.first.imageUrl,
            borderRadius: BorderRadius.circular(16),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: kToolbarHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: onTap,
                child: FavoriteInfoCard(
                  name: profile.firstname,
                  location: profile.userLocation,
                  description: profile.profileInfo,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
