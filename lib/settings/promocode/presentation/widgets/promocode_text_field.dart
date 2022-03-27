import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/settings/promocode/presentation/constants.dart';
import 'package:flutter/material.dart';

final _defaultBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(
    color: Colors.transparent,
  ),
);
final _errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(
    color: AstraColors.red,
  ),
);

/// Represent promocode text field.
class PromocodeTextField extends StatefulWidget {
  /// The event handler for changing the value entered in the text field.
  final Function(String) onChange;

  /// The flag responsible for showing error if promocode is not valid.
  final bool isShowError;
  const PromocodeTextField({
    Key? key,
    required this.onChange,
    this.isShowError = true,
  }) : super(key: key);

  @override
  State<PromocodeTextField> createState() => _PromocodeTextFieldState();
}

class _PromocodeTextFieldState extends State<PromocodeTextField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      inputFormatters: [filteringTextInputFormatter],
      controller: _controller,
      onChanged: (value) {
        _controller.value = TextEditingValue(
            text: value.toUpperCase(), selection: _controller.selection);
        widget.onChange(_controller.value.text);
      },
      decoration: InputDecoration(
        fillColor: AstraColors.promocodeScreenTextFieldColor,
        filled: true,
        hintText: 'Промокод',
        errorBorder: _errorBorder,
        focusedBorder: widget.isShowError ? _errorBorder : _defaultBorder,
        enabledBorder: widget.isShowError ? _errorBorder : _defaultBorder,
        border: InputBorder.none,
      ),
    );
  }
}
