import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

class FavoriteErrorScreen extends StatelessWidget {
  const FavoriteErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Ошибка с соеденением. Проверьте подключение к интернету.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AstraColors.black04,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
