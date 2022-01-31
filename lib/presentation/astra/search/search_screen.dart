import 'package:astra_app/application/search/search_bloc.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/astra/search/sympathy/sympathy_dialog.dart';
import 'package:astra_app/presentation/astra/search/widgets/search_card.dart';
import 'package:astra_app/presentation/astra/search/widgets/search_finish_widget.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.applicants}) : super(key: key);

  final List<Profile> applicants;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SwipeItem> swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Profile _lastProfile = Profile.empty();

  @override
  void initState() {
    final _applicants = widget.applicants;

    for (var applicant in _applicants) {
      swipeItems.add(
        SwipeItem(
            content: applicant, onSlideUpdate: (SlideRegion? region) async {}),
      );
    }
    _matchEngine = MatchEngine(swipeItems: swipeItems);
     
     if(_applicants.isNotEmpty){
       _lastProfile = _applicants.last;
     }
   

    super.initState();
  }

  void _showSympathyDialog(
      BuildContext context, Profile applicant, Image image) async {
    final result = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return SympathyDialog(
          image: image,
          onClose: () => Navigator.of(context).pop(false),
          onWrite: () => Navigator.of(context).pop(true),
        );
      },
    );

    //go to store
    if (result) {
      context.navigateTo(const MessageRouter());
    }
    //go back
    else {
      _matchEngine.currentItem!.like();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          SearchFinishWidget(
            onTap: () {
              context.navigateTo(const FavoritesRouter());
            },
            fileImage: (_lastProfile==Profile.empty())?null:Image.file(_lastProfile
                    .profilePhotos.first.compressedImages!.fullImage!)
                .image,
          ),
          SwipeCards(
            matchEngine: _matchEngine,
            onStackFinished: () {},
            itemBuilder: (context, index) {
              final Profile _currentProfile = swipeItems[index].content;
              final _thumbnail = _currentProfile
                  .profilePhotos.first.compressedImages!.thumbnail;
              return SearchCard(
                profile: _currentProfile,
                onClose: () {
                  _matchEngine.currentItem!.nope();
                  getIt<SearchBloc>()
                      .add(SearchEvent.reject(id: _currentProfile.id));
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
                    _matchEngine.currentItem!.like();
                  }
                  getIt<SearchBloc>()
                      .add(SearchEvent.like(id: _currentProfile.id));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
