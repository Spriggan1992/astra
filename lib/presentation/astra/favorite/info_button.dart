import 'dart:ui';

import 'package:astra_app/presentation/core/theming/gradients.dart';
import 'package:astra_app/presentation/core/widgets/custom/radiant_gradient_mask.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

/// Representы info button for showing info or make decision.
class InfoButton extends StatelessWidget {
  const InfoButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.height = 68,
    this.width = 112,
    this.iconSize = 40,
  }) : super(key: key);

  /// Button click event handler.
  final VoidCallback onTap;

  /// Icon data to display.
  final IconData icon;

  /// Icon button height.
  final double height;

  /// Icon button width.
  final double width;

  /// Icon size.
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: OutlineGradientButton(
            onTap: onTap,
            child: RadiantGradientMask(
              colors: Gradients.goldenGradient,
              child: Icon(
                icon,
                color: Colors.white,
                size: iconSize,
              ),
            ),
            inkWell: true,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: Gradients.goldenGradient,
            ),
            strokeWidth: 1,
            radius: const Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
