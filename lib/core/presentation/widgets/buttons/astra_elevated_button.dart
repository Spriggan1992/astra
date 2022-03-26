import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:flutter/material.dart';

/// Represent main reusable button.
class AstraElevatedButton extends StatelessWidget {
  /// Button title to display.
  final String title;

  /// Button click event handler.
  final VoidCallback? onClick;

  /// A flag responsible for enabling button.
  final bool isEnableButton;

  /// A flag responsible for showing progress indicator when loading data.
  final bool isLoading;

  const AstraElevatedButton({
    Key? key,
    required this.onClick,
    required this.title,
    this.isEnableButton = true,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor:
              !isEnableButton ? AstraColors.disableBtn : AstraColors.blue,
        ),
        onPressed: isEnableButton ? onClick : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            width: isLoading ? 20 : null,
            height: 20,
            child: isLoading
                ? const CircularProgressIndicator(
                    color: AstraColors.white,
                    strokeWidth: 2,
                  )
                : Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
