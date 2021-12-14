import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/theming/gradients.dart';
import 'package:flutter/material.dart';

class BottomHideBar extends StatelessWidget {
  const BottomHideBar({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: 17,
        decoration: BoxDecoration(
          border: Border.all(
            color: AstraColors.golden08,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          gradient: const LinearGradient(
            colors: Gradients.blueGradient,
          ),
        ),
        child: const Divider(
          endIndent: 25,
          indent: 25,
          thickness: 3,
          color: AstraColors.white04,
        ),
      ),
    );
  }
}
