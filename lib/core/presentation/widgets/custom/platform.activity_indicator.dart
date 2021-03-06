import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformActivityIndicator extends StatelessWidget {
  final bool isCupertinoDarkTheme;
  final Color? materialIndicatorColor;
  const PlatformActivityIndicator(
      {Key? key,
      this.isCupertinoDarkTheme = false,
      this.materialIndicatorColor})
      : super(key: key);

  /// Индикатор загрузки платформы, на которой запущено приложение
  @override
  Widget build(BuildContext context) {
    final ios = Platform.isIOS || Platform.isMacOS;
    return ios
        ? CupertinoTheme(
            data: CupertinoTheme.of(context).copyWith(
                brightness:
                    isCupertinoDarkTheme ? Brightness.dark : Brightness.light),
            child: const CupertinoActivityIndicator())
        : Center(
            child: CircularProgressIndicator(color: materialIndicatorColor));
  }
}
