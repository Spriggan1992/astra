import 'package:astra_app/presentation/astra/favorite/favorite_info_card.dart';
import 'package:astra_app/presentation/astra/favorite/info_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
    required this.image,
    required this.name,
    required this.location,
    required this.desc,
    required this.onClose,
    required this.onTapInfo,
    required this.onTapLike,
  }) : super(key: key);

  ///Applicant full main image
  final ImageProvider image;

  ///Applicant name
  final String name;

  ///Applicant location
  final String location;

  ///Description of the applicant
  final String desc;

  /// Button click event handler to swipe left.
  final VoidCallback onClose;

  /// Button click event handler to show information about applicant.
  final VoidCallback onTapInfo;

  /// Button click event handler to add applicant (swipe right).
  final VoidCallback onTapLike;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 56),
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FavoriteInfoCard(
            name: name,
            location: location,
            description: desc,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoButton(
                  onTap: onClose,
                  icon: Icons.close,
                ),
                InfoButton(
                  onTap: onTapInfo,
                  icon: CupertinoIcons.question,
                  iconSize: 30,
                  height: 52,
                  width: 90,
                ),
                InfoButton(
                  onTap: onTapLike,
                  icon: Icons.check,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
