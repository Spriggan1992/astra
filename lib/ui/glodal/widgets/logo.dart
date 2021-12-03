import 'package:astra_app/ui/config/gradients.dart';
import 'package:astra_app/ui/glodal/icons/svg_icon.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, this.logoWithText = false}) : super(key: key);

  final bool logoWithText;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: Gradients.goldenGradient,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ).createShader(bounds);
      },
      child:
          SvgIcon(asset: (logoWithText) ? SvgIcon.logoWithText : SvgIcon.logo),
    );
  }
}
