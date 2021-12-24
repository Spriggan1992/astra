import 'package:flutter/material.dart';

const _error = 'Что-то пошло не так....';

/// Defines screen, that usually showing she get unexpected failure.
class ErrorScreen extends StatelessWidget {
  final String errorTitle;
  const ErrorScreen({Key? key, this.errorTitle = _error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(errorTitle),
    ));
  }
}
