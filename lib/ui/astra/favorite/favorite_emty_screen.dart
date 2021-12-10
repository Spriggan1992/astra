import 'package:astra_app/ui/config/colors.dart';
import 'package:flutter/material.dart';

class FavoriteEmptyScreen extends StatelessWidget {
  const FavoriteEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Список пуст,\nвы никого не лайкнули.',
          style: TextStyle(
            color: AstraColors.black04,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Найти пару',
            style: TextStyle(
              color: AstraColors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
