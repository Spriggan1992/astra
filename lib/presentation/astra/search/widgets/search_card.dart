import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/astra/favorite/favorite_info_card.dart';
import 'package:astra_app/presentation/astra/favorite/info_button.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
    required this.profile,
    required this.onClose,
    required this.onTapInfo,
    required this.onTapLike,
  }) : super(key: key);

  // final String desc;
  final Profile profile;

  /// Button click event handler to swipe left.
  final VoidCallback onClose;

  /// Button click event handler to show information about applicant.
  final VoidCallback onTapInfo;

  /// Button click event handler to add applicant (swipe right).
  final VoidCallback onTapLike;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      AstraNetworkImage(
        imageUrl: profile.profilePhotos.first.imageUrl,
        borderRadius: BorderRadius.circular(0),
        border: Border.all(color: AstraColors.golden, width: 1.5),
        fit: BoxFit.cover,
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: kToolbarHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FavoriteInfoCard(
              name: profile.firstname,
              location: profile.userLocation,
              description: profile.profileInfo,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoButton(
                    onTap: onClose,
                    icon: Icons.close,
                  ),
                  InfoButton(
                    onTap: onTapInfo,
                    icon: CupertinoIcons.question,
                    iconSize: 30,
                    height: 52,
                    width: 90,
                  ),
                  InfoButton(
                    onTap: onTapLike,
                    icon: Icons.check,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
