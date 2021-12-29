import 'package:flutter/material.dart';

/// Widget gradient collor wrapper.
class RadiantGradientMask extends StatelessWidget {
  /// Gradient colors.
  final List<Color> colors;

  /// Widget.
  final Widget child;

  /// The offset at which stop 0.0 of the gradient is placed.
  final AlignmentGeometry begin;

  ///The offset at which stop 1.0 of the gradient is placed.
  final AlignmentGeometry end;

  const RadiantGradientMask({
    Key? key,
    required this.child,
    required this.colors,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors,
      ).createShader(bounds),
      child: child,
    );
  }
}
