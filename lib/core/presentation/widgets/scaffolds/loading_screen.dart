import 'package:astra_app/core/presentation/widgets/custom/platform.activity_indicator.dart';
import 'package:flutter/material.dart';

/// Defines screen, when data loading.
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: PlatformActivityIndicator(),
      ),
    );
  }
}
