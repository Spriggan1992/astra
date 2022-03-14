import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/buttons/dialog_action_button.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/dialog_one_actions.dart';
import 'package:flutter/material.dart';

/// Show custom dialog with one action button.
void showOneActionDialog({
  /// A handle to the location of a widget in the widget tree.
  required BuildContext context,

  /// The title of dialog to display.
  required String dialogTitle,

  /// The title of action button to display.
  required String btnTitle,

  /// Button click event handler.
  required Function(BuildContext dialogContext) onClick,

  /// The visual properties that most buttons have in common.
  ButtonStyle? buttonStyle,

  /// Whether to close dialog by clicking outside dialog.
  bool barrierDismissible = true,
}) {
  showDialog(
    barrierColor: AstraColors.black01,
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (dialogContext) => DialogOneAction(
      content: Text(
        dialogTitle,
        textAlign: TextAlign.center,
      ),
      action: DialogActionButton(
        title: btnTitle,
        buttonStyle:
            buttonStyle ?? TextButton.styleFrom(primary: AstraColors.blue),
        onClick: () => onClick(dialogContext),
      ),
    ),
  );
}
