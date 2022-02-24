import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/astra/favorite/favorite_info_card.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:flutter/material.dart';

/// User application form info card.
class ApplicationFormCard extends StatelessWidget {
  const ApplicationFormCard({
    Key? key,
    required this.profile,
    required this.onTap,
  }) : super(key: key);

  // final String desc;
  final Profile profile;

  /// Button click event handler on tap favorite card.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AstraNetworkImage(
        imageUrl: profile.profilePhotos.first.imageUrl,
        borderRadius: BorderRadius.circular(16),
        fit: BoxFit.cover,
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
    ]);
  }
}
