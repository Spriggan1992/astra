import 'package:astra_app/core/domain/models/curator_model.dart';
import 'package:astra_app/core/presentation/constants/app_tests.dart';
import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/theming/icons/svg_icon.dart';
import 'package:astra_app/core/presentation/widgets/images/astra_file_image.dart';
import 'package:flutter/material.dart';

/// Represent widget that display information about curator.
class SupportCuratorListTile extends StatelessWidget {
  const SupportCuratorListTile({
    Key? key,
    required this.trailingRadius,
    required this.onPressed,
    required this.curator,
  }) : super(key: key);

  /// Curator  information.
  final CuratorModel curator;

  /// Button click  event handler.
  final VoidCallback onPressed;

  /// Trailing icon radius.
  final double trailingRadius;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              AstraFileImage(
                image: curator.profilePhoto,
                height: 48,
                width: 48,
                border: false,
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    curator.curatorFullname,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AstraColors.black,
                    ),
                  ),
                  const Text(
                    AppTexts.curator,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AstraColors.black06,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: GestureDetector(
            onTap: onPressed,
            child: CircleAvatar(
              radius: trailingRadius,
              backgroundColor: AstraColors.black,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: trailingRadius - 1,
                child: const SvgIcon(
                  asset: 'assets/icons/paper-plane.svg',
                  color: AstraColors.black,
                  height: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
