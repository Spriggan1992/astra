import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:flutter/material.dart';

/// Simple checkbox.
class AstraCheckBox extends StatefulWidget {
  const AstraCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  State<AstraCheckBox> createState() => _AstraCheckBoxState();
}

class _AstraCheckBoxState extends State<AstraCheckBox> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: checkBoxValue,
            side: MaterialStateBorderSide.resolveWith(
              (states) =>
                  const BorderSide(width: 1.0, color: AstraColors.darkGrey),
            ),
            fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            checkColor: AstraColors.darkGrey,
            onChanged: (value) {
              checkBoxValue = value!;
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
