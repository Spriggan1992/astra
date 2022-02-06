import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/error_screens/base_error_screen.dart';
import 'package:flutter/material.dart';

const _error = 'Попробовать снова';

/// Defines screen, that usually showing she get unexpected failure.
class ErrorScreen extends BaseErrorScreen {
  /// Error title to display.
  final String errorTitle;

  /// Event handler for clicking the "repeat again" button.
  final VoidCallback? onTryAgain;
  ErrorScreen({
    Key? key,
    this.errorTitle = _error,
    required this.onTryAgain,
  }) : super(
          key,
          errorTitle,
          GestureDetector(
            onTap: onTryAgain,
            child: const Text(
              'Попробовать снова',
              style: TextStyle(
                color: AstraColors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
}
