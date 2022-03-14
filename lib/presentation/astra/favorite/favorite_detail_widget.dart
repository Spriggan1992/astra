import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/custom/blur_mask.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:astra_app/presentation/core/theming/borders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'favorite_action_icon.dart';

/// Defines the card that contains short user information and image.
class FavoriteDetailWidget extends HookWidget {
  const FavoriteDetailWidget({
    Key? key,
    required this.profile,
    required this.onTap,
    required this.favoriteType,
    this.isRemovedFromStopList = false,
  }) : super(key: key);

  /// Users profile information.
  final Profile profile;

  /// Favorite screen type.
  final FavoriteScreenType favoriteType;

  /// Сard click event handler.
  final VoidCallback onTap;

  /// The flag responsible transfer of the user from the stop list category to think.
  final bool isRemovedFromStopList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Stack(
            children: [
              AstraNetworkImage(
                imageUrl: profile.profilePhotos.first.imageUrl,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: AstraColors.golden, width: 1.5),
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BlurMask(
                  borderRadius: Borders.favoriteCardBorder,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 42,
                    decoration: const BoxDecoration(
                      borderRadius: Borders.favoriteCardBorder,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          profile.userNameAge,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          profile.userLocation,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AstraColors.white05,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          FavoriteActionIcon(
            favoriteType: favoriteType,
            isRemovedFromStopList: isRemovedFromStopList,
            matchStatus: profile.matchStatus,
          ),
        ],
      ),
    );
  }
}
