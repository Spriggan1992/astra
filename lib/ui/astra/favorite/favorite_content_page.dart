import 'package:astra_app/enums/favorite_screen_type.dart';
import 'package:astra_app/ui/astra/favorite/favorite_choose_screen.dart.dart';

import 'package:flutter/material.dart';

import 'favorite_detail_widget.dart';

class FavoriteContentPage extends StatelessWidget {
  const FavoriteContentPage({Key? key, required this.screenType})
      : super(key: key);
  final FavoriteScreenType screenType;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 20,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 2,
          childAspectRatio: 1),
      itemBuilder: (context, index) {
        return FavoriteDetailWidget(
          onTap: () {
            if (screenType == FavoriteScreenType.think) {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(FavoriteChooseScreen.routeName);
              // TODO
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return ContinueDialog(
              //       content:
              //           'Все пользователи восстановлены и будут перенесены в раздел "подумать"',
              //       onContinue: () {},
              //     );
              //   },
              // );
            }
          },
          image: Image.asset('assets/girl.png', fit: BoxFit.cover).image,
          name: 'Настя, 26',
          location: 'Россия, Москва',
        );
      },
    );
  }
}
