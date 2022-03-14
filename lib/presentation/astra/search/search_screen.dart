import 'package:astra_app/application/chats/chats_bloc.dart';
import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/application/search/search_action/search_action_bloc.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/astra/search/sympathy/sympathy_dialog.dart';
import 'package:astra_app/presentation/astra/search/widgets/search_card.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipable_stack/swipable_stack.dart';

import 'widgets/search_finish_widget.dart';

/// Main search screen.
class SearchScreen extends StatefulWidget {
  /// List of [Profile]
  final List<Profile> applicants;

  /// Enumeration of the display category of the screen favorites.
  final FavoriteScreenType? favoriteType;

  const SearchScreen({
    Key? key,
    required this.applicants,
    this.favoriteType,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = SwipableStackController();
  Profile lastProfile = Profile.empty();

  @override
  void initState() {
    super.initState();
    if (widget.applicants.isNotEmpty) {
      lastProfile = widget.applicants.last;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _routeName = context.router.current.name;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _routeName == 'SearchPage'
          ? null
          : AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  context.popRoute();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
            ),
      body: Stack(
        children: [
          SearchFinishWidget(
            onTap: () {
              context.navigateTo(const FavoritesTab());
            },
            profile: lastProfile,
          ),
          if (widget.applicants.isNotEmpty)
            SwipableStack(
              controller: controller,
              itemCount: widget.applicants.length,
              builder: (context, properties) {
                final Profile _currentProfile =
                    widget.applicants[properties.index];
                return SearchCard(
                  favoriteType: widget.favoriteType,
                  profile: _currentProfile,
                  onTapDislike: () =>
                      _onTapDislike(_currentProfile, _routeName),
                  onTapStop: () => _onTapStop(_currentProfile),
                  onTapPhoto: () => _navigateToPhotosScreen(_currentProfile),
                  onTapInfo: () =>
                      _navigateToUserInfoScreen(_currentProfile, _routeName),
                  onTapLike: () => _onTapLike(_currentProfile, _routeName),
                );
              },
            ),
        ],
      ),
    );
  }

  void _navigateToPhotosScreen(Profile currentProfile) {
    context.router.push(
      ShowImageFullScreenRoute(images: currentProfile.profilePhotos),
    );
  }

  void _onTapDislike(Profile currentProfile, String routeName) {
    if (routeName == 'FavoriteSearchRouter') {
      context.popRoute();
    } else {
      controller.next(swipeDirection: SwipeDirection.left);
      controller.rewind();
    }
    context
        .read<SearchActionBloc>()
        .add(SearchActionEvent.reject(id: currentProfile.id));
  }

  void _onTapStop(Profile currentProfile) {
    context
        .read<SearchActionBloc>()
        .add(SearchActionEvent.reject(id: currentProfile.id));
    controller.next(swipeDirection: SwipeDirection.up);
    controller.rewind();
  }

  void _navigateToUserInfoScreen(Profile currentProfile, String routeName) {
    if (routeName == 'SearchPage') {
      context.navigateTo(
        SearchUserInfoRouter(applicant: currentProfile),
      );
    } else if (routeName == 'FavoriteSearchRouter') {
      context.navigateTo(
        FavoritesUserInfoRouter(applicant: currentProfile),
      );
    } else {
      SettingsUserInfoDetailRouter(userInfo: currentProfile);
    }
  }

  void _showSympathyDialog(
      BuildContext context, Profile applicant, Image image) async {
    final result = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return SympathyDialog(
          image: image,
          onClose: () => context.router.pop(false),
          onWrite: () => context.router.pop(true),
        );
      },
    );

    //go to store
    if (result) {
      context.navigateTo(const ChatsTab());
    }
    //go back
    else {
      controller.next(swipeDirection: SwipeDirection.right);
      controller.rewind();
    }
  }

  void _onTapLike(Profile currentProfile, String routeName) {
    // Todo just don't touch it.
    // if (currentProfile.isMutualLike) {
    //   _showSympathyDialog(context, currentProfile,
    //       Image.file(currentProfile.profilePhotos.first.fileImage!));
    // } else {
    // controller.next(swipeDirection: SwipeDirection.right);
    // controller.rewind();
    // }
    if (routeName == 'FavoriteSearchRouter') {
      context.popRoute();
    } else {
      controller.next(swipeDirection: SwipeDirection.right);
      controller.rewind();
    }
    context
        .read<SearchActionBloc>()
        .add(SearchActionEvent.like(id: currentProfile.id));
    context.read<ChatsBloc>().add(const ChatsEvent.chatsUpdated());
  }
}
