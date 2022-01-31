import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformActivityIndicator extends StatelessWidget {
  final bool isCapertinoDarkTheme;
  final Color? materialIndicatorColor;
  const PlatformActivityIndicator(
      {Key? key,
      this.isCapertinoDarkTheme = false,
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
                    isCapertinoDarkTheme ? Brightness.dark : Brightness.light),
            child: const CupertinoActivityIndicator())
        : CircularProgressIndicator(color: materialIndicatorColor);
  }
}
