import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const _inputMaxLength = 130;

class ProfileTextField extends HookWidget {
  const ProfileTextField(
      {Key? key,
      required this.isEditingMode,
      required this.onChanged,
      this.leftSymbols,
      required this.description})
      : super(key: key);

  final String description;
  final ValueChanged<String> onChanged;
  final int? leftSymbols;
  final bool isEditingMode;

  @override
  Widget build(BuildContext context) {
    final _controller = useTextEditingController(text: description);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            enabled: isEditingMode,
            maxLength: 130,
            controller: _controller,
            maxLines: null,
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: UnderlineInputBorder(),
              label: Text(
                'Краткое описание:',
                style: TextStyle(
                  color: AstraColors.black04,
                  fontSize: 14,
                ),
              ),
              counterText: "",
            ),
            style: const TextStyle(
              color: AstraColors.black,
              fontSize: 15,
            ),
            onChanged: onChanged,
          ),
          Visibility(
            visible: (_controller.text.length >= 110 && isEditingMode),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Осталось символов: ${_inputMaxLength - _controller.text.length}',
                style: const TextStyle(
                  color: Color.fromRGBO(222, 66, 66, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
