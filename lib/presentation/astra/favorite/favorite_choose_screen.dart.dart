import 'package:astra_app/presentation/core/widgets/scaffolds/botom_hide_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'favorite_info_card.dart';
import 'info_button.dart';

class FavoriteChooseScreen extends StatelessWidget {
  const FavoriteChooseScreen({Key? key}) : super(key: key);

  static const String routeName = '/favoritechoosescreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const FavoriteChooseScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/girl.png').image, fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Stack(
              children: [
                Column(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InfoButton(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icons.close,
                            height: 16,
                            width: 38,
                          ),
                          InfoButton(
                            onTap: () async {},
                            icon: Icons.check,
                            height: 16,
                            width: 38,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: -2,
                  left: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 3) /
                      2,
                  child: BottomHideBar(
                    onTap: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 110,
              child: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
