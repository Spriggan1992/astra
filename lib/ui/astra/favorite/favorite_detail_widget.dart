import 'package:astra_app/enums/favorite_icon_type.dart';
import 'package:astra_app/ui/config/colors.dart';
import 'package:flutter/material.dart';

class FavoriteDetailWidget extends StatelessWidget {
  const FavoriteDetailWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.location,
    required this.onTap,
    this.mutualSympathy = false,
  }) : super(key: key);

  final ImageProvider image;
  final String name;
  final String location;
  final bool mutualSympathy;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AstraColors.golden, width: 1.5),
                  borderRadius: BorderRadius.circular(32),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: image, //      ,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: (MediaQuery.of(context).size.width / 2) - 20,
                  height: 42,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32)),
                    color: AstraColors.white02,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        location,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AstraColors.white05,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: mutualSympathy,
            child: Positioned(
              bottom: 30,
              right: 5,
              child: getFavoriteIcon(FavoriteIconType.papeline),
            ),
          ),
        ],
      ),
    );
  }

  Widget getFavoriteIcon(FavoriteIconType iconType) {
    switch (iconType) {
      case FavoriteIconType.papeline:
        return CircleAvatar(
          backgroundColor: AstraColors.white02,
          radius: 18,
          child: Image.asset(
            'assets/paper_plane.png',
            color: Colors.white,
            scale: 0.8,
          ),
        );
      case FavoriteIconType.chek:
        return const CircleAvatar(
            backgroundColor: AstraColors.white02,
            radius: 18,
            child: Icon(
              Icons.check,
              color: AstraColors.white,
            ));
      case FavoriteIconType.add:
        return const CircleAvatar(
            backgroundColor: AstraColors.white02,
            radius: 18,
            child: Icon(
              Icons.add,
              color: AstraColors.white,
            ));
      default:
        return Container();
    }
  }
}
