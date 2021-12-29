import 'dart:ui';

import 'package:flutter/material.dart';

/// Represents blur mask for widgets.
class BlurMask extends StatelessWidget {
  /// Creates an image filter that applies a Gaussian blur.
  final double sigmaX;

  /// Creates an image filter that applies a Gaussian blur.
  final double sigmaY;

  /// Border radius for blur mask.
  final BorderRadius? borderRadius;

  /// Child widget.
  final Widget child;
  const BlurMask(
      {Key? key,
      this.sigmaX = 10.0,
      this.sigmaY = 10.0,
      this.borderRadius,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: child,
      ),
    );
  }
}
