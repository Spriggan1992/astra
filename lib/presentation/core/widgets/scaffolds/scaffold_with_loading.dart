import 'package:astra_app/presentation/core/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/material.dart';

/// Defines scaffold with loading indicator.
class ScaffoldWithLoading extends StatelessWidget {
  /// Appbar
  final AstraAppBar appBar;

  /// Body content.
  final Widget body;

  /// Loading state.
  final bool isLoading;

  /// Scaffold background color.
  final Color backgroundColor;
  const ScaffoldWithLoading(
      {Key? key,
      required this.isLoading,
      required this.appBar,
      required this.body,
      this.backgroundColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: backgroundColor,
          appBar: appBar,
          body: body,
        ),
        if (isLoading)
          Container(
              alignment: Alignment.center,
              color: Colors.black54,
              child: const CircularProgressIndicator(
                color: Colors.white,
              )),
      ],
    );
  }
}
