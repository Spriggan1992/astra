import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformActivityIndicator extends StatelessWidget {
  const PlatformActivityIndicator({Key? key}) : super(key: key);

  /// Индикатор загрузки платформы, на которой запущено приложение
  @override
  Widget build(BuildContext context) {
    //final platformInfo = PlatformInfo();
    final ios = Platform.isIOS || Platform.isMacOS;
    return ios
        ? const CupertinoActivityIndicator()
        : const CircularProgressIndicator();
  }
}
