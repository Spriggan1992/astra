import 'package:astra_app/presentation/core/widgets/dialogs/base_dialog.dart';
import 'package:flutter/material.dart';

/// Defines dialog with one action.
class DialogOneAction extends BaseDialog {
  /// Dialog title to display.
  final String title;

  /// Dialog action.
  final Widget action;
  const DialogOneAction({
    Key? key,
    required this.title,
    required this.action,
  }) : super(
          key,
          title,
          action,
        );
}
