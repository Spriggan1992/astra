import 'package:flutter/material.dart';

/// Represent Widget wrapper for detecting open/close keyboard.
class KayboardVisibility extends StatefulWidget {
  /// Returns widget.
  final Widget Function(bool) child;

  /// Scaffold context, needed for detecting opening keyboard. Outside scaffold context `MediaQuery.of` won't work.
  final BuildContext scaffoldContext;
  const KayboardVisibility(
      {Key? key, required this.child, required this.scaffoldContext})
      : super(key: key);

  @override
  State<KayboardVisibility> createState() => _KayboardVisibilityState();
}

class _KayboardVisibilityState extends State<KayboardVisibility> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return widget
        .child(MediaQuery.of(widget.scaffoldContext).viewInsets.bottom != 0);
  }
}
