import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/astra/search/sympathy/sympathy_dialog.dart';
import 'package:astra_app/presentation/astra/search/widgets/search_card.dart';
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
    super.initState();
  }

  void _showSympathyDialog(BuildContext context, Profile applicant, String image) async {
    final result = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return SympathyDialog(
          image: Image.asset(image, fit: BoxFit.cover),
          onClose: () => Navigator.of(context).pop(false),
          onWrite: () => Navigator.of(context).pop(true),
        );
      },
    );

    //go to store
    if (result) {
      AutoRouter.of(context).push(const MessageRouter());
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
      body: SwipeCards(
        matchEngine: _matchEngine,
        onStackFinished: () {},
        itemBuilder: (context, index) {
          final Profile _currentProfile = swipeItems[index].content;
          final String _image = _currentProfile.profilePhotos[0].imageUrl;
          return SearchCard(
            image: Image.asset(_image).image,
            name: _currentProfile.firstname,
            location: _currentProfile.userLocation,
            desc: _currentProfile.profileInfo,
            onClose: () {
              _matchEngine.currentItem!.nope();
            },
            onTapInfo: () {
              AutoRouter.of(context)
                  .push(ApplicantScreenRoute(applicant: _currentProfile, image: _image));
            },
            onTapLike: () async {
              if (_currentProfile.draft) {
                _showSympathyDialog(context, _currentProfile, _image);
              } else {
                _matchEngine.currentItem!.like();
              }
            },
          );
        },
      ),
    );
  }
}
