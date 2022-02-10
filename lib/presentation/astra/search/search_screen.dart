import 'package:astra_app/application/search/search_action/search_action_bloc.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/astra/search/sympathy/sympathy_dialog.dart';
import 'package:astra_app/presentation/astra/search/widgets/search_card.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

import 'widgets/search_finish_widget.dart';

/// Main search screen. 
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.applicants}) : super(key: key);
  
  /// List of applicants.
  final List<Profile> applicants;

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
      context.navigateTo(const ChatsRouter());
    }
    //go back
    else {
      controller.next(swipeDirection: SwipeDirection.right);
      controller.rewind();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SearchFinishWidget(
            onTap: () {
              context.navigateTo(const FavoritesRouter());
            },
            fileImage: (lastProfile == Profile.empty())
                ? null
                : Image.file(lastProfile.profilePhotos.first.fileImage!).image,
          ),
          SwipableStack(
            controller: controller,
            itemCount: widget.applicants.length,
            builder: (context, properties) {
              final Profile _currentProfile =
                  widget.applicants[properties.index];
              final _thumbnail = _currentProfile.profilePhotos.first.fileImage;
              return SearchCard(
                profile: _currentProfile,
                onClose: () {
                  getIt<SearchActionBloc>()
                      .add(SearchActionEvent.reject(id: _currentProfile.id));

                  controller.next(swipeDirection: SwipeDirection.left);
                  controller.rewind();
                },
                onTapPhoto: () {
                  AutoRouter.of(context).push(ShowImageFullScreenRoute(
                      images: _currentProfile.profilePhotos));
                },
                onTapInfo: () {
                  AutoRouter.of(context).push(
                    ApplicantScreenRoute(
                        applicant: _currentProfile,
                        image: Image.file(_thumbnail!).image),
                  );
                },
                onTapLike: () async {
                  if (_currentProfile.isMutualLike) {
                    _showSympathyDialog(
                        context, _currentProfile, Image.file(_thumbnail!));
                  } else {
                    controller.next(swipeDirection: SwipeDirection.right);
                    controller.rewind();
                  }
                  getIt<SearchActionBloc>()
                      .add(SearchActionEvent.like(id: _currentProfile.id));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
