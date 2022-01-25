import 'package:astra_app/application/favorite/favorite_bloc.dart';
import 'package:astra_app/application/search/search_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart' hide NavigationBar;
import 'package:flutter_bloc/flutter_bloc.dart';

const routes = [
  SearchRouter(),
  FavoritesRouter(),
  MessageRouter(),
  SettingsRouter(),
];

/// Defines home screen.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<FavoriteBloc>()..add(const FavoriteEvent.loadedData()),
        ),
      ],
      child: AutoTabsScaffold(
        extendBody: true,
        routes: routes,
        bottomNavigationBuilder: (navContext, tabsRouter) {
          return NavigationBar(
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
              _loadDataWhenPressNavButton(navContext, index, routes);
            },
            currentIndex: tabsRouter.activeIndex,
            items: [
              NavigationBarItem(
                icon: Icons.search,
              ),
              NavigationBarItem(
                icon: CupertinoIcons.person_2_fill,
              ),
              NavigationBarItem(
                icon: CupertinoIcons.envelope,
              ),
              NavigationBarItem(
                icon: CupertinoIcons.settings,
              )
            ],
          );
        },
      ),
    );
  }
}

void _loadDataWhenPressNavButton(
    BuildContext context, int index, List<PageRouteInfo<dynamic>> routes) {
  switch (index) {
    case 0:
        BlocProvider.of<SearchBloc>(context).add(const SearchEvent.loadData());
      break;
    case 1:
      BlocProvider.of<FavoriteBloc>(context).add(FavoriteEvent.loadedData(
          favoriteType: context.read<FavoriteBloc>().state.favoriteType));
      break;
    case 2:
      //Update data here
      break;
  }
}
