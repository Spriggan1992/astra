import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/config/gradients.dart';
import 'package:flutter/material.dart';

class AstraBottomBarItem extends StatelessWidget {
  const AstraBottomBarItem({
    Key? key,
    required this.icon,
    required this.onTap,
    this.isTapped = false,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;
  final bool isTapped;

  @override
  Widget build(BuildContext context) {
    return (isTapped)
        ? ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(colors: Gradients.goldenGradient)
                  .createShader(bounds);
            },
            child: IconButton(
              onPressed: onTap,
              icon: Icon(
                icon,
                color: AstraColors.goldenColor,
              ),
            ),
          )
        : IconButton(
            onPressed: onTap,
            icon: Icon(
              icon,
              color: AstraColors.goldenColorWithOpactity03,
            ),
          );
  }
}
