import 'dart:io';

import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

final _border = Border.all(color: AstraColors.golden08);

/// Represents widget that display image from file.
class AstraFileImage extends StatelessWidget {
  const AstraFileImage({
    Key? key,
    required this.image,
    this.width = 90,
    this.height = 130,
    this.border,
  }) : super(key: key);

  /// File where image stored.
  final File image;

  /// Image container width.
  ///
  /// By default `90px`
  final double width;

  /// Image container height.
  ///
  /// By default `130px`
  final double height;

  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: border == null ? null : _border,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: FileImage(image),
          filterQuality: FilterQuality.none,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
