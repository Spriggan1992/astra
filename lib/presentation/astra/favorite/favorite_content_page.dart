import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/application/favorite/favorite_actor/favorite_actor_bloc.dart';
import 'package:astra_app/application/favorite/favorite_bloc.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/loading_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorite_choose_screen.dart.dart';
import 'favorite_detail_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key, required this.favoriteType}) : super(key: key);
  final FavoriteScreenType favoriteType;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const LoadingScreen();
        }
        if (state.isSuccess) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<FavoriteBloc>().add(
                  FavoriteEvent.loadedData(favoriteType: state.favoriteType));
            },
            child: state.profiles.isNotEmpty
                ? GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount:
                        state.profiles.isNotEmpty ? state.profiles.length : 1,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        crossAxisCount: state.profiles.isEmpty ? 1 : 2,
                        childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      return FavoriteDetailWidget(
                        favotieType: favoriteType,
                        onTap: () {
                          if (favoriteType == FavoriteScreenType.think) {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(FavoriteChooseScreen.routeName);
                            // TODO
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return ContinueDialog(
                            //       content:
                            //           'Все пользователи восстановлены и будут перенесены в раздел "подумать"',
                            //       onContinue: () {},
                            //     );
                            //   },
                            // );
                          }
                          if (favoriteType == FavoriteScreenType.stopList) {
                            context.read<FavoriteActorBloc>().add(
                                FavoriteActorEvent.removedFromStopList(
                                    state.profiles[index]));
                          }
                        },
                        image: state.profiles[index].profilePhotos[0].imageUrl,
                        name: state.profiles[index].userNameAge,
                        location: state.profiles[index].userLocation,
                      );
                    },
                  )
                : const CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: Center(
                          child: Text(
                            "Список пуст",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
          );
        }

        return Container();
      },
    );
  }
}
