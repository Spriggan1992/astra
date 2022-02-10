import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/custom/blur_mask.dart';
import 'package:flutter/material.dart';

/// Defines card that contains information about user.
class FavoriteInfoCard extends StatelessWidget {
  const FavoriteInfoCard({
    Key? key,
    required this.name,
    required this.location,
    required this.description,
  }) : super(key: key);

  /// User name to display.
  final String name;

  /// User location to display.
  final String location;

  /// Short users description.
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: AstraColors.darken, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: BlurMask(
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 2,
                      color: AstraColors.white04,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                    color: AstraColors.white08, fontSize: 14, height: 1.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
