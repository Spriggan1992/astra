import 'package:astra_app/core/application/enums/favorite_screen_type.dart';
import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/theming/icons/svg_icon.dart';
import 'package:astra_app/core/presentation/widgets/custom/blur_mask.dart';
import 'package:astra_app/favorites/domain/match_status.dart';
import 'package:flutter/material.dart';

/// Defines icon that responsible for doing action with user.
class FavoriteActionIcon extends StatelessWidget {
  /// A flag responsible for removing user from stop list.
  final bool isRemovedFromStopList;

  /// A flag responsible for users mutual sympathy.
  final MatchStatus matchStatus;

  /// Favorite screen tab qualifier.
  final FavoriteScreenType favoriteType;

  const FavoriteActionIcon({
    Key? key,
    required this.favoriteType,
    required this.matchStatus,
    required this.isRemovedFromStopList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: favoriteType == FavoriteScreenType.match ||
          favoriteType == FavoriteScreenType.stopList,
      child: Positioned(
        bottom: 24,
        right: 10,
        child: _FavoriteRoundedBlurredIcon(
          favoriteType: favoriteType,
          matchStatus: matchStatus,
          isRemovedFromStopList: isRemovedFromStopList,
        ),
      ),
    );
  }
}

class _FavoriteRoundedBlurredIcon extends StatelessWidget {
  final bool isRemovedFromStopList;
  final FavoriteScreenType favoriteType;
  final MatchStatus matchStatus;
  const _FavoriteRoundedBlurredIcon({
    Key? key,
    required this.favoriteType,
    required this.matchStatus,
    this.isRemovedFromStopList = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurMask(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding:
            matchStatus == MatchStatus.success ? const EdgeInsets.all(8) : null,
        decoration: BoxDecoration(
            color: AstraColors.white03.withOpacity(0.1),
            border: Border.all(color: AstraColors.white03.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(100)),
        height: 36,
        width: 36,
        child: _getIcon(),
      ),
    );
  }

  Widget _getIcon() {
    if (favoriteType == FavoriteScreenType.match) {
      return _MatchStatusIcon(matchStatus: matchStatus);
    } else if (favoriteType == FavoriteScreenType.stopList) {
      return _StopListIcon(
        isRemovedFromStopList: isRemovedFromStopList,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _MatchStatusIcon extends StatelessWidget {
  final MatchStatus matchStatus;
  const _MatchStatusIcon({
    Key? key,
    required this.matchStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (matchStatus == MatchStatus.success) {
      return const SvgIcon(
        asset: 'assets/icons/paper-plane.svg',
        height: 1,
      );
    } else {
      return const Icon(
        Icons.question_mark,
        color: AstraColors.white,
      );
    }
  }
}

class _StopListIcon extends StatelessWidget {
  /// A flag responsible for removing user from stop list.
  final bool isRemovedFromStopList;

  const _StopListIcon({
    Key? key,
    required this.isRemovedFromStopList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isRemovedFromStopList) {
      return const Icon(
        Icons.check,
        color: AstraColors.white,
      );
    } else {
      return const Icon(
        Icons.add,
        color: AstraColors.white,
      );
    }
  }
}
