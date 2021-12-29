import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../favorite/info_button.dart';
import '../favorite/favorite_info_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 56),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/girl.png').image, fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const FavoriteInfoCard(
                name: 'Мария, 25',
                location: 'Россия, Москва',
                desc:
                    'На свете нет ни одного человека, который бы не мечтал. Я не стала исключением, в моей голове создавались образы прекрасного будущего.dsa..',
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoButton(
                      onTap: () {},
                      icon: Icons.close,
                    ),
                    InfoButton(
                      onTap: () {
                        AutoRouter.of(context)
                            .push(const SearchDetailPageRoute());
                      },
                      icon: CupertinoIcons.question,
                      iconSize: 30,
                      height: 52,
                      width: 90,
                    ),
                    InfoButton(
                      onTap: () {},
                      icon: Icons.check,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
