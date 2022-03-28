import 'package:astra_app/core/domain/models/image_models.dart';
import 'package:astra_app/core/presentation/constants/app_tests.dart';
import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/widgets/custom/blur_mask.dart';
import 'package:astra_app/core/presentation/widgets/images/astra_network_image.dart';
import 'package:flutter/cupertino.dart';

/// Temporary Curator tile widget to display

class CuratorTile extends StatelessWidget {
  const CuratorTile({
    Key? key,
    required this.curatorFullName,
    required this.curatorImage,
  }) : super(key: key);

  /// A Curator full name.
  final String curatorFullName;

  /// A curator image.
  final ImageModel curatorImage;

  @override
  Widget build(BuildContext context) {
    return BlurMask(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AstraColors.darken,
          border: Border.all(
            color: AstraColors.white02,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  AstraNetworkImage(
                    imageUrl: curatorImage.imageUrl,
                    fileImage: curatorImage.cachedImage?.fullImage == null
                        ? null
                        : Image.file(
                            curatorImage.cachedImage!.fullImage!,
                          ).image,
                    height: 48,
                    width: 48,
                    boxShape: BoxShape.circle,
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
                          color: AstraColors.white,
                        ),
                      ),
                      const Text(
                        AppTexts.curator,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AstraColors.white05,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: AstraColors.white08,
                  )),
              child: const Icon(
                CupertinoIcons.paperplane,
                color: AstraColors.white08,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
