import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'info_button.dart';
import 'info_card.dart';
import 'search_detail.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/girl.png').image, fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const InfoCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoButton(
                    onTap: () {},
                    icon: Icons.close,
                    height: 16,
                    width: 38,
                  ),
                  InfoButton(
                    onTap: () {},
                    icon: CupertinoIcons.question,
                    height: 8,
                    width: 32,
                  ),
                  InfoButton(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const SearchDetailPage();
                        },
                      ));
                    },
                    icon: Icons.check,
                    height: 16,
                    width: 38,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
