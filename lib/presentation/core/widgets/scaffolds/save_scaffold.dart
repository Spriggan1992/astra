import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

/// [Scaffold] wrapped in [SafeArea] and [KeyboardDismisser]
class SafeScaffold extends StatelessWidget {
  const SafeScaffold({
    this.scaffoldKey,
    required this.body,
    this.appBar,
    this.backgroundColor,
    this.safeAreaSettings,
  });

  /// Ключ, для идентификации виджета
  final Key? scaffoldKey;

  /// Делегирование [Scaffold.body]
  final Widget body;

  /// Делегирование [Scaffold.appBar]
  final PreferredSizeWidget? appBar;

  /// Делегирование [Scaffold.backgroundColor]
  final Color? backgroundColor;

  /// Делегирование [SafeArea.safeAreaSettings]
  final SafeAreaSettings? safeAreaSettings;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: SafeArea(
        top: safeAreaSettings?.top ?? false,
        bottom: safeAreaSettings?.bottom ?? true,
        left: safeAreaSettings?.left ?? true,
        right: safeAreaSettings?.right ?? true,
        child: Scaffold(
          key: scaffoldKey,
          appBar: appBar,
          body: body,
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}

class SafeAreaSettings {
  SafeAreaSettings({
    this.left,
    this.top,
    this.right,
    this.bottom,
  });

  final bool? left;
  final bool? top;
  final bool? right;
  final bool? bottom;
}
