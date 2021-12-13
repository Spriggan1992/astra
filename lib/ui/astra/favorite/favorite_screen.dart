import 'package:astra_app/enums/favorite_screen_type.dart';
import 'package:astra_app/ui/config/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'favorite_content_page.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = const [
    Tab(
      child: Text(
        'Ваши лайки',
        style: TextStyle(color: AstraColors.black, fontSize: 12),
      ),
    ),
    Tab(
      child: Text(
        'Лайки вас',
        style: TextStyle(color: AstraColors.black, fontSize: 12),
      ),
    ),
    Tab(
      child: Text(
        'Подумать',
        style: TextStyle(color: AstraColors.black, fontSize: 12),
      ),
    ),
    Tab(
      child: Text(
        'Стоп лист',
        style: TextStyle(color: AstraColors.black, fontSize: 12),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).pop();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.black87,
            size: 35,
          ),
        ),
        bottom: TabBar(
          onTap: (index) {
            // Should not used it as it only called when tab options are clicked,
            // not when profile swapped
          },
          controller: _controller,
          tabs: list,
        ),
        title: Text(
          'Избранное',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: const Color.fromRGBO(31, 31, 31, 1),
                fontSize: 17,
              ),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        children: const [
          FavoriteContentPage(screenType: FavoriteScreenType.yourLikes),
          FavoriteContentPage(screenType: FavoriteScreenType.likesForYou),
          FavoriteContentPage(screenType: FavoriteScreenType.think),
          FavoriteContentPage(screenType: FavoriteScreenType.stopList),
        ],
      ),
    );
  }
}
