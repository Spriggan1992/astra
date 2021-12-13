import 'package:astra_app/ui/glodal/widgets/buttons/astra_elevated_button.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/material.dart';

/// Represent content for screens.
class ScreenContent extends StatelessWidget {
  /// A header title of page content to display.
  final String title;

  /// A text field to display.
  final Widget textFieldContent;

  /// Button click event handler.
  final VoidCallback? clickButton;

  /// App bar backpress click event handler.
  final VoidCallback? onBackPresed;

  /// A notification message to display.
  final Widget? notificationMessageContent;

  final bool isEnableButton;
  const ScreenContent({
    Key? key,
    required this.title,
    required this.textFieldContent,
    required this.clickButton,
    this.notificationMessageContent,
    this.onBackPresed,
    this.isEnableButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AstraAppBar(
        elevation: 0,
        onPressed: onBackPresed ?? () {},
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                        ),
                  ),
                  const SizedBox(height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldContent,
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: notificationMessageContent,
                      )
                    ],
                  ),
                ],
              ),
            ),
            AstraElevatedButton(
              isEnableButton: isEnableButton,
              title: 'Продолжить',
              onClick: clickButton,
            )
          ],
        ),
      ),
    );
  }
}
