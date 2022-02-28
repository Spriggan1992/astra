import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/application/favorite/favorite_actor/favorite_actor_bloc.dart';
import 'package:astra_app/application/favorite/favorite_bloc.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/astra/favorite/tab_item.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/buttons/dialog_action_button.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/dialog_one_actions.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_screen.dart';
import 'favorite_tab_content.dart';

/// Defines start screen for favorite.
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state.isNoInternetConnection || state.isUnexpectedError) {
          return ErrorScreen(
            failure: state.isNoInternetConnection
                ? const AstraFailure.noConnection()
                : const AstraFailure.api(),
            onTryAgain: () {
              BlocProvider.of<FavoriteBloc>(context)
                  .add(const FavoriteEvent.loadedData());
            },
          );
        }
        return BlocProvider(
          create: (context) => getIt<FavoriteActorBloc>()
            ..add(FavoriteActorEvent.initialized(state.profiles)),
          child: const FavoriteScreenContent(),
        );
      },
    );
  }
}

/// Defines contains for favorite scree.
class FavoriteScreenContent extends StatefulWidget {
  const FavoriteScreenContent({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteScreenContent> createState() => _FavoriteScreenContentState();
}

class _FavoriteScreenContentState extends State<FavoriteScreenContent>
    with SingleTickerProviderStateMixin {
  /// Coordinates tab selection between a [TabBar] and a [TabBarView].
  late TabController _controller;
  final List<Widget> _tabs = const [
    TabItem(title: 'Ваши лайки'),
    TabItem(title: 'Лайки вас'),
    TabItem(title: 'Подумать'),
    TabItem(title: 'Стоп лист'),
  ];
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabs.length, vsync: this);
    _controller.index = 1;
    _controller.addListener(() {
      BlocProvider.of<FavoriteBloc>(context).add(FavoriteEvent.loadedData(
          favoriteType: getFavoriteType(_controller.index)));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
          bottom: TabBar(
            indicatorColor: Colors.transparent,
            unselectedLabelColor: AstraColors.grey,
            labelColor: Colors.black,
            controller: _controller,
            tabs: _tabs,
          ),
          title: Text(
            'Избранное',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: const Color.fromRGBO(31, 31, 31, 1),
                  fontSize: 17,
                ),
          ),
          actions: [
            BlocSelector<FavoriteBloc, FavoriteState, bool>(
              selector: (state) {
                return state.favoriteType == FavoriteScreenType.stopList;
              },
              builder: (context, actorState) {
                return Visibility(
                  visible: _controller.index == 3,
                  child: Center(
                    child: TextButton(
                      child: const Text(
                        "Восстановить все",
                        style:
                            TextStyle(color: AstraColors.black, fontSize: 12),
                      ),
                      onPressed: () async => showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return DialogOneAction(
                              content: const Text(
                                  'Все пользователи восстановлены и\nбудут пересены в раздел «подумать‎»',
                                  textAlign: TextAlign.center),
                              action: DialogActionButton(
                                title: 'Продолжить',
                                onClick: () {
                                  context.router.pop();
                                },
                              ),
                            );
                          }),
                    ),
                  ),
                );
              },
            )
          ],
        ),
        body: TabBarView(
          controller: _controller,
          physics: const BouncingScrollPhysics(),
          children: const [
            FavoriteTabContent(
              favoriteType: FavoriteScreenType.yourLikes,
            ),
            FavoriteTabContent(
              favoriteType: FavoriteScreenType.likesForYou,
            ),
            FavoriteTabContent(
              favoriteType: FavoriteScreenType.think,
            ),
            FavoriteTabContent(
              favoriteType: FavoriteScreenType.stopList,
            ),
          ],
        ),
      ),
    );
  }
}
