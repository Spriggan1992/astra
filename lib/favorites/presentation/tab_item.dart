import 'package:flutter/material.dart';

/// Defines tab.
class TabItem extends StatelessWidget {
  /// Tab title to display.
  final String title;
  const TabItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
