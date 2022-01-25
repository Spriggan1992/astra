import 'package:flutter/material.dart';

/// Defines screen, that usually showing she get unexpected failure.
class BaseErrorScreen extends StatelessWidget {
  /// Error title to display.
  final String baseTitle;

  /// Error screen action.
  final Widget action;

  const BaseErrorScreen(
    Key? key,
    this.baseTitle,
    this.action,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            baseTitle,
            textAlign: TextAlign.center,
          ),
          action
        ],
      ),
    ));
  }
}
