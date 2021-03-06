import 'package:astra_app/core/presentation/widgets/buttons/astra_bordered_button.dart';
import 'package:astra_app/shared/features/store/domain/models/like.dart';
import 'package:flutter/material.dart';

/// Defines buttons for selecting like package.
class GroupedSelectedLikePackages extends StatelessWidget {
  /// Initial like packages.
  final List<Like> likes;

  /// Selected like.
  final Like selectedLike;

  /// Event handler of selecting like package.
  final Function(Like) onSelectLike;
  const GroupedSelectedLikePackages(
      {Key? key,
      required this.likes,
      required this.selectedLike,
      required this.onSelectLike})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: likes
            .map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: AstraBorderedButton(
                    enableRippleEffect: false,
                    onTap: () => onSelectLike(item),
                    title: item.likeInfo,
                    withBorder: item.id != selectedLike.id,
                  ),
                ))
            .toList());
  }
}
