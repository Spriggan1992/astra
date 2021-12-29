import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/application/favorite/favorite_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart' hide NavigationBar;
import 'package:flutter_bloc/flutter_bloc.dart';

/// Defines home screen.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavoriteBloc>()
        ..add(const FavoriteEvent.initialized(FavoriteScreenType.likesForYou)),
      child: AutoTabsScaffold(
        extendBody: true,
        routes: const [
          SearchRouter(),
          FavoritesRouter(),
          MessageRouter(),
          SettingsRouter()
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return NavigationBar(
            onTap: tabsRouter.setActiveIndex,
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
