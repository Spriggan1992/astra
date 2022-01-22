import 'package:astra_app/domain/applicant/applicant.dart';
import 'package:astra_app/presentation/astra/search/sympathy/sympathy_dialog.dart';
import 'package:astra_app/presentation/astra/search/widgets/search_card.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SwipeItem> swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    final _applicants = Applicant.getApplicants();

    for (var applicant in _applicants) {
      swipeItems.add(
        SwipeItem(
            content: applicant, onSlideUpdate: (SlideRegion? region) async {}),
      );
    }
    _matchEngine = MatchEngine(swipeItems: swipeItems);
    super.initState();
  }

  void _showSympathyDialog(BuildContext context, Applicant applicant) async {
    final result = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return SympathyDialog(
          image: Image.asset(applicant.mainImage, fit: BoxFit.cover),
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
          final Applicant _currentApplicant = swipeItems[index].content;
          return SearchCard(
            image: Image.asset(_currentApplicant.images[0]).image,
            name: _currentApplicant.name,
            location: _currentApplicant.location,
            desc: _currentApplicant.desc,
            onClose: () {
              _matchEngine.currentItem!.nope();
            },
            onTapInfo: () {
              AutoRouter.of(context)
                  .push(ApplicantScreenRoute(applicant: _currentApplicant));
            },
            onTapLike: () async {
              if (_currentApplicant.mutualSympathy) {
                _showSympathyDialog(context, _currentApplicant);
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
