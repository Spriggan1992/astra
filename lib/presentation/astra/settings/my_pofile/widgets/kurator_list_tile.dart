import 'package:astra_app/domain/image_picker/models/image.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KuratorListTile extends StatelessWidget {
  const KuratorListTile(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.leadingRadius,
      required this.trallingRadius,
      required this.onPressed})
      : super(key: key);

  final String imageUrl;
  final String name;
  final VoidCallback onPressed;
  final double leadingRadius;
  final double trallingRadius;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              AstraNetworkImage(
                imageUrl: imageUrl,
                boxShape: BoxShape.circle,
                height: 48,
                width: 48,
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
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
