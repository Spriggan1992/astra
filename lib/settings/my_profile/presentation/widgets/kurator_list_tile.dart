import 'package:astra_app/core/domain/models/image_models.dart';
import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/theming/icons/svg_icon.dart';
import 'package:astra_app/core/presentation/widgets/images/astra_file_image.dart';
import 'package:flutter/material.dart';

/// Represent widget that display information about curator.
class CuratorListTile extends StatelessWidget {
  const CuratorListTile({
    Key? key,
    required this.trailingRadius,
    required this.onPressed,
    required this.curatorPhoto,
    required this.curatorFullName,
    // required this.curator,
  }) : super(key: key);

  /// Curator photo to display.
  final ImageModel curatorPhoto;

  /// The curator full name to display.
  final String curatorFullName;

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
                image: curatorPhoto,
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
                    curatorFullName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AstraColors.black,
                    ),
                  ),
                  const Text(
                    'Куратор',
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
