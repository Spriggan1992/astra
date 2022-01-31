import 'package:astra_app/domain/profile/models/curator_model.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_file_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Represent widget that display information about curator.
class CuratorListTile extends StatelessWidget {
  const CuratorListTile(
      {Key? key,
      required this.trallingRadius,
      required this.onPressed,
      required this.curator})
      : super(key: key);

  /// Curator  information.
  final CuratorModel curator;

  /// Button click  event handler.
  final VoidCallback onPressed;

  /// Traling icon radius.
  final double trallingRadius;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              AstraFileImage(
                image: curator.profilePhoto.fileImage!,
                height: 48,
                width: 48,
                border: null,
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
              radius: trallingRadius,
              backgroundColor: AstraColors.black,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: trallingRadius - 1,
                child: const Icon(CupertinoIcons.paperplane),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
