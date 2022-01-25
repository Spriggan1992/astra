import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/custom/blur_mask.dart';
import 'package:flutter/material.dart';

/// Defines icon that responsible for doing action with user.
class FavoriteActionIcon extends StatelessWidget {
  /// A flag resposible for removing user from stop list.
  final bool isRemovedFromStopList;

  /// A flag responsible for users mutual sympathy.
  final bool mutualSympathy;

  /// Favorite screen tab qualifier.
  final FavoriteScreenType favotieType;

  const FavoriteActionIcon(
      {Key? key,
      required this.favotieType,
      required this.mutualSympathy,
      required this.isRemovedFromStopList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mutualSympathy ||
          favotieType == FavoriteScreenType.stopList ||
          favotieType == FavoriteScreenType.think,
      child: Positioned(
        bottom: 24,
        right: 10,
        child: _getFavoriteIcon(favotieType, isRemovedFromStopList),
      ),
    );
  }

  Widget _getFavoriteIcon(
      FavoriteScreenType favoriteType, bool isRemovedFromStopList) {
    if (favoriteType == FavoriteScreenType.likesForYou ||
        favoriteType == FavoriteScreenType.yourLikes) {
      return _FavoriteRoundedBluredIcon(
        favoriteType: favoriteType,
      );
    } else if (favoriteType == FavoriteScreenType.stopList) {
      if (isRemovedFromStopList) {
        return _FavoriteRoundedBluredIcon(
          icon: Icons.check,
          favoriteType: favoriteType,
        );
      } else {
        return _FavoriteRoundedBluredIcon(
          icon: Icons.add,
          favoriteType: favoriteType,
        );
      }
    }
    return const SizedBox.shrink();
  }
}

class _FavoriteRoundedBluredIcon extends StatelessWidget {
  final FavoriteScreenType favoriteType;
  final IconData? icon;
  const _FavoriteRoundedBluredIcon(
      {Key? key, this.icon, required this.favoriteType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurMask(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        decoration: BoxDecoration(
            color: AstraColors.white03.withOpacity(0.1),
            border: Border.all(color: AstraColors.white03.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(100)),
        height: 36,
        width: 36,
        child: favoriteType == FavoriteScreenType.likesForYou ||
                favoriteType == FavoriteScreenType.yourLikes ||
                icon == null
            ? Image.asset(
                'assets/paper_plane.png',
                color: Colors.white,
                scale: 0.8,
              )
            : Icon(
                icon,
                color: AstraColors.white,
              ),
      ),
    );
  }
}
