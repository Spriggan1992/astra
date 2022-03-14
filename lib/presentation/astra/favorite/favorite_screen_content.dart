import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/application/favorite/favorite_actor/favorite_actor_bloc.dart';
import 'package:astra_app/application/favorite/favorite_bloc.dart';
import 'package:astra_app/application/user/user_bloc.dart';
import 'package:astra_app/presentation/astra/favorite/favorite_tab_content.dart';
import 'package:astra_app/presentation/astra/favorite/tab_item.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/utils/get_favorite_type.dart';
import 'package:astra_app/presentation/core/utils/show_one_action_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _recoverAll = 'Восстановить все';
const _yoursLikes = 'Ваши лайки';
const _likesForYou = 'Лайки вас';
const _match = 'Пары';
const _think = 'Подумать';
const _stopList = 'Стоп лист';
const _favorites = 'Избранное';
const _dialogTitle =
    'Все пользователи восстановлены и\nбудут пересены в раздел «подумать‎»';
const _btnTitle = 'Продолжить';

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
    TabItem(title: _yoursLikes),
    TabItem(title: _likesForYou),
    TabItem(title: _match),
    TabItem(title: _think),
    TabItem(title: _stopList),
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
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state.canUpdate) {
          context.read<FavoriteBloc>().add(
                FavoriteEvent.usersUpdated(
                  getFavoriteType(_controller.index),
                ),
              );
        }
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 1,
            centerTitle: true,
            backgroundColor: Colors.white,
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: AstraColors.grey,
              labelColor: Colors.black,
              controller: _controller,
              tabs: _tabs,
            ),
            title: Text(
              _favorites,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: const Color.fromRGBO(31, 31, 31, 1),
                    fontSize: 17,
                  ),
            ),
            actions: [
              BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, actorState) {
                  return Visibility(
                    visible:
                        actorState.favoriteType == FavoriteScreenType.stopList,
                    child: Center(
                      child: TextButton(
                          child: const Text(
                            _recoverAll,
                            style: TextStyle(
                                color: AstraColors.black, fontSize: 12),
                          ),
                          onPressed: actorState.profiles.isEmpty
                              ? null
                              : () async {
                                  return showOneActionDialog(
                                    dialogTitle: _dialogTitle,
                                    context: context,
                                    btnTitle: _btnTitle,
                                    onClick: (dialogContext) {
                                      context.read<FavoriteActorBloc>().add(
                                            const FavoriteActorEvent
                                                .removedAllFromStopList(),
                                          );
                                      dialogContext.router.pop();
                                    },
                                  );
                                }),
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
                favoriteType: FavoriteScreenType.yoursLikes,
              ),
              FavoriteTabContent(
                favoriteType: FavoriteScreenType.likesForYou,
              ),
              FavoriteTabContent(
                favoriteType: FavoriteScreenType.match,
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
      ),
    );
  }
}
