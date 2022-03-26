import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:flutter/material.dart';

class AboutButton extends StatelessWidget {
  /// Custom button
  const AboutButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  /// Text displayed on the button
  final String title;

  /// Callback that is called when button is pressed
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 70),
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
          elevation: MaterialStateProperty.all(3),
          side: MaterialStateProperty.all(
            BorderSide.none,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
