import 'package:astra_app/domain/core/models/image_models.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

final _border = Border.all(color: AstraColors.golden08, width: 1);

/// Represents widget that display image from file.
class AstraFileImage extends StatelessWidget {
  const AstraFileImage({
    Key? key,
    required this.image,
    this.width = 90,
    this.height = 90,
    this.border = true,
  }) : super(key: key);

  /// File where image stored.
  final ImageModel image;

  /// Image container width.
  ///
  /// By default `90px`
  final double width;

  /// Image container height.
  ///
  /// By default `130px`
  final double height;

  /// Whether to show border.
  final bool border;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: border
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(height),
              border: _border,
            )
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height),
        child: Image.file(
          image.cachedImage!.thumbnailImage!,
          filterQuality: FilterQuality.low,
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
