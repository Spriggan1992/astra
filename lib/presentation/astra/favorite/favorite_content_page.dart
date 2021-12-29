import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/application/favorite/favorite_actor/favorite_actor_bloc.dart';
import 'package:astra_app/application/favorite/favorite_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'favorite_choose_screen.dart.dart';
import 'favorite_detail_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key, required this.favoriteType}) : super(key: key);
  final FavoriteScreenType favoriteType;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state.isSuccess) {
          return state.profiles.isNotEmpty
              ? GridView.builder(
                  itemCount: state.isLoading ? 20 : state.profiles.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 2,
                      childAspectRatio: 1),
                  itemBuilder: (context, index) {
                    return state.isLoading
                        ? Shimmer.fromColors(
                            baseColor: const Color(0xFFEBEBF4),
                            highlightColor: const Color(0xFFF4F4F4),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32)),
                            ),
                          )
                        : FavoriteDetailWidget(
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
                            image:
                                state.profiles[index].profilePhotos[0].imageUrl,
                            name: state.profiles[index].userNameAge,
                            location: state.profiles[index].userLocation,
                          );
                  },
                )
              : const Align(
                  alignment: Alignment.center, child: Text("Список пуст"));
        }
        return Container();
      },
    );
  }
}
