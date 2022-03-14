import 'package:astra_app/presentation/core/widgets/buttons/dialog_action_button.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/dialog_two_actions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

void showTwoActionDialog({
  /// A handle to the location of a widget in the widget tree.
  required BuildContext context,

  /// The title of dialog to display.
  required String dialogTitle,

  /// The title of action1 button to display.
  ///
  /// By default `Отмена`.
  String negativeBtnTitle = 'Отмена',

  /// The title of action2 button to display.
  required String positiveBtnTitle,

  /// Positive button click event handler.
  required Function(BuildContext dialogContext) onPositiveBtnClick,

  /// Negative button click event handler.
  Function(BuildContext dialogContext)? onNegativeBtnClick,

  /// The visual properties that most buttons have in common.
  ButtonStyle? buttonStyle,

  /// Whether to close dialog by clicking outside dialog.
  bool barrierDismissible = true,
}) {
  showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (dialogContext) {
      return DialogTwoActions(
        content: Text(
          dialogTitle,
          textAlign: TextAlign.center,
        ),
        action1: DialogActionButton(
          title: negativeBtnTitle,
          onClick: onNegativeBtnClick != null
              ? () => onNegativeBtnClick(dialogContext)
              : () => dialogContext.popRoute(),
        ),
        action2: DialogActionButton(
          title: positiveBtnTitle,
          onClick: () => onPositiveBtnClick(dialogContext),
        ),
      );
    },
  );
}
