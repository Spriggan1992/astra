import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField(
      {Key? key,
      required this.controller,
      required this.onChanged,
      this.leftSymbols})
      : super(key: key);

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final int? leftSymbols;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Краткое описание:',
            style: TextStyle(
              color: AstraColors.black04,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextFormField(
            controller: controller,
            maxLines: 3,
            style: const TextStyle(
              color: AstraColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            onChanged: onChanged,
          ),
          Visibility(
            visible: (leftSymbols! <= 20),
            child: Text(
              'Осталось символов: $leftSymbols',
              style: const TextStyle(
                color: Color.fromRGBO(222, 66, 66, 1),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
