import 'package:astra_app/chats/chats/application/chats_bloc.dart';
import 'package:astra_app/chats/chats/application/enums/chat_opening_statuses.dart';
import 'package:astra_app/core/application/enums/favorite_screen_type.dart';
import 'package:astra_app/core/presentation/routes/app_router.gr.dart';
import 'package:astra_app/core/presentation/widgets/dialogs/snack_bar.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/error_screens/empty_data_screen.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/loading_screen.dart';
import 'package:astra_app/favorites/application/favorite_actor/favorite_actor_bloc.dart';
import 'package:astra_app/favorites/application/favorite_bloc.dart';
import 'package:astra_app/favorites/presentation/utils/show_favorites_dialog.dart';
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
    return BlocListener<ChatsBloc, ChatsState>(
      listener: (context, state) {
        if (state.chatOpeningStatuses == ChatOpeningStatuses.success) {
          context
              .pushRoute(
                ChatScreenRoute(chatModel: state.chat!),
              )
              .then((_) => context
                  .read<ChatsBloc>()
                  .add(const ChatsEvent.chatsUpdated()));
        }
        if (state.chatOpeningStatuses == ChatOpeningStatuses.failure) {
          showSnackBar(context);
        }
      },
      child: BlocConsumer<FavoriteBloc, FavoriteState>(
        listener: ((context, state) {
          if (state.isSuccess) {
            context
                .read<FavoriteActorBloc>()
                .add(FavoriteActorEvent.initialized(state.profiles));
          }
        }),
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
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return BlocBuilder<FavoriteActorBloc,
                            FavoriteActorState>(
                          builder: (context, stateActor) {
                            return FavoriteDetailWidget(
                              profile: state.profiles[index],
                              isRemovedFromStopList:
                                  stateActor.selectedProfiles.any(
                                (element) =>
                                    element.id == state.profiles[index].id,
                              ),
                              favoriteType: favoriteType,
                              onTap: () => showFavoritesDialog(
                                context,
                                favoriteType,
                                state.profiles,
                                state.profiles[index],
                                state.isHiddenProfile,
                                state.isEmptyBalance,
                              ),
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
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

Widget _getErrorScreen(
    BuildContext context, FavoriteScreenType favoriteScreenType) {
  if (favoriteScreenType == FavoriteScreenType.yoursLikes) {
    return EmptyDataScreen(
      title: 'Список пуст,\nвы никого не лайкнули.',
      onClick: () => context.router.navigate(const SearchTab()),
    );
  } else {
    return EmptyDataScreen();
  }
}
