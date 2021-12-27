import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

class AboutButton extends StatelessWidget {
  const AboutButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.isBigButton = false})
      : super(key: key);

  final String title;
  final VoidCallback onTap;
  final bool isBigButton;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: OutlinedButton(
        onPressed: onTap,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: AstraColors.black,
            ),
          ),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(20),
          ),
          elevation: MaterialStateProperty.all(2),
          side: MaterialStateProperty.all(
            BorderSide.none,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          minimumSize: MaterialStateProperty.all(Size(
              MediaQuery.of(context).size.width / 1.5,
              (isBigButton) ? 66 : 50)),
          maximumSize: MaterialStateProperty.all(Size(
              MediaQuery.of(context).size.width / 1.5,
              (isBigButton) ? 75 : 55)),
        ),
      ),
    );
  }
}
