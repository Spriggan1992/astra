import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({Key? key, required this.asset}) : super(key: key);
  final String asset;

  static const String logo = 'assets/logo/logo.svg';
  static const String logoWithText = 'assets/logo/logo_with_text.svg';

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
    );
  }
}
