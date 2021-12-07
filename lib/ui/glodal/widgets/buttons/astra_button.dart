import 'package:astra_app/ui/config/colors.dart';
import 'package:flutter/material.dart';

class AstraButton extends StatelessWidget {
  const AstraButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      child: Text(
        title,
        style:
            const TextStyle(color: AstraColors.blue, fontSize: 14),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: AstraColors.color_244_244_244_1,
            width: 1,
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(
              MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width / 5),
              45),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
      ),
    );
  }
}
