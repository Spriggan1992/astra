import 'package:astra_app/presentation/core/widgets/buttons/astra_button.dart';
import 'package:flutter/material.dart';

const _error = 'Что-то пошло не так....';

/// Defines screen, that usually showing she get unexpected failure.
class ErrorScreen extends StatelessWidget {
  /// Error title to display.
  final String errorTitle;

  /// Event handler for clicking the "repeat again" button.
  final VoidCallback onTryAgain;
  const ErrorScreen({
    Key? key,
    this.errorTitle = _error,
    required this.onTryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorTitle,
            textAlign: TextAlign.center,
          ),
          AstraButton(
            title: 'Попробовать снова',
            onTap: onTryAgain,
          )
        ],
      ),
    ));
  }
}
