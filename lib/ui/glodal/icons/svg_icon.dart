import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({Key? key, required this.asset, this.color, this.height})
      : super(key: key);
  final String asset;
  final Color? color;
  final double? height;

  static const String logo = 'assets/logo/logo.svg';
  static const String logoWithText = 'assets/logo/logo_with_text.svg';
  static const String profile = 'assets/icons/profile.svg';

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      color: color,
      height: height,
    );
  }
}
