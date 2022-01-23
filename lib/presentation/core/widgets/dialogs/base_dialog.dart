import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

/// Base class for dialogs.
class BaseDialog extends StatelessWidget {
  const BaseDialog(
    Key? key,
    this.dialogTitle,
    this.dialogAction,
  ) : super(key: key);

  /// Base dialog action.
  final Widget dialogAction;

  /// Base dialog title.
  final String dialogTitle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 1.0,
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Text(
                dialogTitle,
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              color: AstraColors.dividerDialogColor,
              height: 1,
              thickness: 1,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: dialogAction),
            const SizedBox(height: 4)
          ],
        ),
      ),
    );
  }
}
