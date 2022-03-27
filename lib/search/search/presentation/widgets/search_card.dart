import 'package:astra_app/core/application/enums/favorite_screen_type.dart';
import 'package:astra_app/core/domain/models/profile_model.dart';
import 'package:astra_app/core/presentation/widgets/images/astra_network_image.dart';
import 'package:astra_app/favorites/presentation/favorite_info_card.dart';
import 'package:astra_app/favorites/presentation/info_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Search card for every applicant
class SearchCard extends StatelessWidget {
  final FavoriteScreenType? favoriteType;
  // final String desc;
  final ProfileModel profile;

  /// Button click event handler to swipe left.
  final VoidCallback onTapDislike;

  /// Button click event handler to show information about applicant.
  final VoidCallback onTapInfo;

  /// Question click event handler.
  final VoidCallback onTapStop;

  /// Like button click event handler.
  final VoidCallback onTapLike;

  /// Dislike button click event handler.
  final VoidCallback? onTapPhoto;

  const SearchCard({
    Key? key,
    required this.profile,
    required this.onTapDislike,
    required this.onTapInfo,
    required this.onTapLike,
    required this.onTapPhoto,
    required this.onTapStop,
    this.favoriteType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTapPhoto,
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
              FavoriteInfoCard(
                name: profile.firstname,
                location: profile.userLocation,
                description: profile.profileInfo,
                onCardTap: onTapInfo,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoButton(
                      onTap: onTapDislike,
                      icon: Icons.close,
                    ),
                    Visibility(
                      visible: favoriteType != FavoriteScreenType.think,
                      child: InfoButton(
                        onTap: onTapStop,
                        icon: CupertinoIcons.question,
                        iconSize: 30,
                        height: 52,
                        width: 90,
                      ),
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
      ],
    );
  }
}
