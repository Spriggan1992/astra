import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

/// Mask for promocode text field.
final maskPromocodeFormatter = MaskTextInputFormatter(
  mask: '####-####-####',
  filter: {
    "#": RegExp(r'^[a-zA-Z0-9_.-]*$'),
  },
);
