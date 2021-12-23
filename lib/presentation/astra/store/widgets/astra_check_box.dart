import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

/// Simple checknox.
class AstraChekBox extends StatefulWidget {
  const AstraChekBox({
    Key? key,
  }) : super(key: key);

  @override
  State<AstraChekBox> createState() => _AstraChekBoxState();
}

class _AstraChekBoxState extends State<AstraChekBox> {
  bool chekBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: chekBoxValue,
            side: MaterialStateBorderSide.resolveWith(
              (states) =>
                  const BorderSide(width: 1.0, color: AstraColors.darkGrey),
            ),
            fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            checkColor: AstraColors.darkGrey,
            onChanged: (value) {
              chekBoxValue = value!;
              setState(() {});
            },
          ),
          const Text(
            'Автоматически обновлять покупку когда \nзакончатся лайки',
            style: TextStyle(color: AstraColors.darkGrey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
