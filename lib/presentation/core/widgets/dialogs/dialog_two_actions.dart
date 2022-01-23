import 'package:astra_app/presentation/core/widgets/dialogs/base_dialog.dart';
import 'package:flutter/material.dart';

/// Defines dialog with two actions.
class DialogTwoActions extends BaseDialog {
  /// Dialog title to display.
  final String title;

  /// Negative dialog action.
  final Widget action1;

  /// Positive dialog action.
  final Widget action2;
  DialogTwoActions({
    Key? key,
    required this.title,
    required this.action1,
    required this.action2,
  }) : super(
          key,
          title,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: action1,
              ),
              const SizedBox(
                height: 25,
                child: VerticalDivider(
                  color: Color.fromRGBO(24, 24, 24, 0.1),
                  width: 1,
                  thickness: 2,
                ),
              ),
              SizedBox(child: action2),
            ],
          ),
        );
}
