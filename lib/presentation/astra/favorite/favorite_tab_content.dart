import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/application/favorite/favorite_actor/favorite_actor_bloc.dart';
import 'package:astra_app/application/favorite/favorite_bloc.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/widgets/buttons/dialog_action_button.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/dialog_one_actions.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/error_screens/empty_data_screen.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/loading_screen.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorite_detail_widget.dart';

/// Defines favorite screen tab content.
class FavoriteTabContent extends StatelessWidget {
  const FavoriteTabContent({
    Key? key,
    required this.favoriteType,
  }) : super(key: key);

  /// Favorite screen type.
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
                      return BlocBuilder<FavoriteActorBloc, FavoriteActorState>(
                        builder: (context, stateActor) {
                          return FavoriteDetailWidget(
                            profile: state.profiles[index],
                            isRemovedFromStopList: stateActor.selectedProfiles
                                .any((element) =>
                                    element.id == state.profiles[index].id),
                            favotieType: favoriteType,
                            onTap: () {
                              if (favoriteType == FavoriteScreenType.stopList) {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return DialogOneAction(
                                      title:
                                          'Пользователи пересен в раздел\n«подумать‎»',
                                      action: DialogActionButton(
                                        title: 'Продолжить',
                                        onClick: () {
                                          context.read<FavoriteActorBloc>().add(
                                              FavoriteActorEvent
                                                  .removedFromStopList(
                                                      state.profiles[index]));
                                          context.router.pop();
                                        },
                                      ),
                                    );
                                  },
                                );
                              } else {
                                context.router.navigate(
                                  UserFormScreenRoute(
                                    profile: state.profiles[index],
                                  ),
                                );
                              }
                            },
                          );
                        },
                      );
                    },
                  )
                : CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: Center(
                            child: _getErrorScreen(context, favoriteType)),
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

Widget _getErrorScreen(
    BuildContext context, FavoriteScreenType favoriteScreenType) {
  if (favoriteScreenType == FavoriteScreenType.yourLikes) {
    return EmptyDataScreen(
        title: 'Список пуст,\nвы никого не лайкнули.',
        onClick: () => context.router.navigate(const SearchRouter()));
  } else {
    return EmptyDataScreen();
  }
}
