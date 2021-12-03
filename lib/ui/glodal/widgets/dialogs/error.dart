import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WidgetError extends StatelessWidget {
  /// Виджет, сообщающий об ошибках
  /// В Debug моде возвращает саму ошибку
  const WidgetError({Key? key, this.debugMessage}) : super(key: key);

  /// Сообщение, которое будет выведено
  /// при ошибке на экран
  final String? debugMessage;

  @override
  Widget build(BuildContext context) {
    final showMessage = kDebugMode || debugMessage == null;
    return Center(
      child: Text(showMessage ? debugMessage! : 'Some error happen'),
    );
  }
}
