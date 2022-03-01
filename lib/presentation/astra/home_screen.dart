import 'package:astra_app/application/chats/chats_bloc.dart';
import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/application/favorite/favorite_bloc.dart';
import 'package:astra_app/application/search/search_bloc.dart';
import 'package:astra_app/application/user/user_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/buttons/dialog_action_button.dart';
import 'package:astra_app/presentation/core/widgets/custom/app_system_manager.dart';
import 'package:astra_app/presentation/core/widgets/custom/restart_widget.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/dialog_one_actions.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart' hide NavigationBar;
import 'package:flutter_bloc/flutter_bloc.dart';

const _routes = [
  SearchRouter(),
  FavoritesRouter(),
  ChatsRouter(),
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
        BlocProvider(
          create: (context) => getIt<ChatsBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<UserBloc>()..add(const UserEvent.initialized()),
        ),
      ],
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state.isUnexpectedError) {
            showDialog(
                barrierColor: AstraColors.black01,
                barrierDismissible: false,
                context: context,
                builder: (context) => DialogOneAction(
                    content: const Text(
                      'Не удалось синхронизировать данные с сервером.\nПриложение будет перезагружено',
                      textAlign: TextAlign.center,
                    ),
                    action: DialogActionButton(
                      title: "Ок",
                      buttonStyle:
                          TextButton.styleFrom(primary: AstraColors.blue),
                      onClick: () {
                        RestartWidget.restartApp(context);
                      },
                    )));
          }
        },
        builder: (context, state) {
          return AppSystemManager(
            child: AutoTabsScaffold(
              extendBody: true,
              resizeToAvoidBottomInset: false,
              routes: _routes,
              bottomNavigationBuilder: (navContext, tabsRouter) {
                return NavigationBar(
                  onTap: (index) {
                    tabsRouter.setActiveIndex(index);
                    _loadDataWhenPressNavButton(navContext, index, _routes);
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
      context.read<FavoriteBloc>().add(FavoriteEvent.loadedData(
          favoriteType: getFavoriteType(
              context.read<FavoriteBloc>().state.favoriteType.index)));
      break;
    case 2:
      context.read<ChatsBloc>().add(const ChatsEvent.chatsLoaded());
      context.read<ChatsBloc>().add(const ChatsEvent.initialized());
      break;
  }
}

FavoriteScreenType getFavoriteType(int index) {
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
