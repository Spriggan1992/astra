import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.height,
    required this.width,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      child: Icon(
        icon,
        color: Color.fromRGBO(100, 72, 33, 1),
        size: 40,
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: width, vertical: height),
        ),
        backgroundColor: MaterialStateProperty.all(
          Color.fromRGBO(85, 85, 85, 0.5),
        ),
        side: MaterialStateProperty.all(
            BorderSide(color: Color.fromRGBO(217, 191, 131, 0.8))),
      ),
    );
  }
}
