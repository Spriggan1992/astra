import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/application/favorite/favorite_actor/favorite_actor_bloc.dart';
import 'package:astra_app/application/favorite/favorite_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/error_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorite_content_page.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 1;

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
      _controller.indexIsChanging;
      setState(() {
        _selectedIndex = _controller.index;
      });
      BlocProvider.of<FavoriteBloc>(context)
          .add(FavoriteEvent.initialized(_getFavoiteType(_selectedIndex)));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavoriteActorBloc>(),
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        buildWhen: (previous, current) =>
            previous.isNoInternetConnection != current.isNoInternetConnection ||
            previous.isUnexpectedError != current.isUnexpectedError,
        builder: (context, state) {
          if (state.isNoInternetConnection) {
            return ErrorScreen(onTryAgain: () {
              BlocProvider.of<FavoriteBloc>(context).add(
                  FavoriteEvent.initialized(_getFavoiteType(_selectedIndex)));
            });
          }
          return FavoriteScreenContent(controller: _controller, list: list);
        },
      ),
    );
  }
}

class FavoriteScreenContent extends StatelessWidget {
  const FavoriteScreenContent({
    Key? key,
    required TabController controller,
    required this.list,
  })  : _controller = controller,
        super(key: key);

  final TabController _controller;
  final List<Widget> list;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.black87,
              size: 35,
            ),
          ),
          bottom: TabBar(
            onTap: (index) {},
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
            FavoritePage(
              favoriteType: FavoriteScreenType.yourLikes,
            ),
            FavoritePage(
              favoriteType: FavoriteScreenType.likesForYou,
            ),
            FavoritePage(
              favoriteType: FavoriteScreenType.think,
            ),
            FavoritePage(
              favoriteType: FavoriteScreenType.stopList,
            ),
          ],
        ),
      ),
    );
  }
}

FavoriteScreenType _getFavoiteType(int index) {
  FavoriteScreenType type = FavoriteScreenType.likesForYou;
  switch (index) {
    case 0:
      type = FavoriteScreenType.likesForYou;
      break;
    case 1:
      type = FavoriteScreenType.yourLikes;
      break;
    case 2:
      type = FavoriteScreenType.think;
      break;
    case 3:
      type = FavoriteScreenType.stopList;
      break;
  }
  return type;
}
