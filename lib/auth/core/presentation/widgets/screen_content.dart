import 'package:astra_app/core/presentation/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/material.dart';

/// Represent content for screens.
class ScreenContent extends StatelessWidget {
  /// A header title of page content to display.
  final String title;

  /// A text field to display.
  final Widget textFieldContent;

  /// Button widget.
  final Widget button;

  /// App bar back press click event handler.
  final VoidCallback? onBackPressed;

  /// A notification message to display.
  final Widget? notificationMessageContent;

  const ScreenContent({
    Key? key,
    required this.title,
    required this.textFieldContent,
    required this.button,
    this.notificationMessageContent,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AstraAppBar(
        elevation: 0,
        onPressed: onBackPressed ?? () {},
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
            button
          ],
        ),
      ),
    );
  }
}
