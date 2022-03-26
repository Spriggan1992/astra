import 'package:astra_app/chats/application/chats/chats_bloc.dart';
import 'package:astra_app/core/presentation/routes/app_router.gr.dart';
import 'package:astra_app/core/presentation/utils/get_favorite_type.dart';
import 'package:astra_app/core/presentation/utils/show_one_action_dialog.dart';
import 'package:astra_app/core/presentation/widgets/bars/bottom_navigation_bar/icon_nav_item.dart';
import 'package:astra_app/core/presentation/widgets/bars/bottom_navigation_bar/nav_bar.dart';
import 'package:astra_app/core/presentation/widgets/bars/bottom_navigation_bar/svg_nav_item.dart';
import 'package:astra_app/core/presentation/widgets/custom/app_system_manager.dart';
import 'package:astra_app/core/presentation/widgets/custom/restart_widget.dart';
import 'package:astra_app/favorites/application/favorite_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/search/application/search_action/search_action_bloc.dart';
import 'package:astra_app/search/application/search_bloc.dart';
import 'package:astra_app/shared/features/user/application/user_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

const _routes = [
  SearchTab(),
  FavoritesTab(),
  ChatsTab(),
  SettingsTab(),
];

const _dialogTitle =
    'Не удалось синхронизировать данные с сервером\nПриложение будет перезагружено';

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
        BlocProvider(
          create: (context) =>
              getIt<ChatsBloc>()..add(const ChatsEvent.chatsLoaded()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<UserBloc>()..add(const UserEvent.initialized()),
        ),
        BlocProvider<SearchActionBloc>(
            create: (context) => getIt<SearchActionBloc>()),
      ],
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state.isUnexpectedError) {
            showOneActionDialog(
              btnTitle: 'Ок',
              dialogTitle: _dialogTitle,
              context: context,
              barrierDismissible: false,
              onClick: (_) => RestartWidget.restartApp(context),
            );
          }
        },
        builder: (context, state) {
          return AppSystemManager(
            child: WillPopScope(
              onWillPop: () async => false,
              child: AutoTabsScaffold(
                extendBody: true,
                resizeToAvoidBottomInset: false,
                routes: _routes,
                bottomNavigationBuilder: (navContext, tabsRouter) {
                  return NavBar(
                    onTap: (index) {
                      tabsRouter.setActiveIndex(index);
                      _loadDataWhenPressNavButton(navContext, index, _routes);
                    },
                    currentIndex: tabsRouter.activeIndex,
                    items: [
                      IconNavItem(
                        item: Icons.search,
                      ),
                      IconNavItem(
                        item: CupertinoIcons.person_2_fill,
                      ),
                      SvgNavItem(
                        item: 'assets/icons/nav_bar_envelope.svg',
                      ),
                      IconNavItem(
                        item: Icons.settings,
                      )
                    ],
                  );
                },
              ),
            ),
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
      context.read<FavoriteBloc>().add(
            FavoriteEvent.loadedData(
              favoriteType: getFavoriteType(
                  context.read<FavoriteBloc>().state.favoriteType.index),
            ),
          );
      break;
    case 2:
      context.read<ChatsBloc>().add(const ChatsEvent.chatsLoaded());
      context.read<ChatsBloc>().add(const ChatsEvent.initialized());
      break;
  }
}
