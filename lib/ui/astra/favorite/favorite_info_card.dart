import 'package:astra_app/ui/config/colors.dart';
import 'package:flutter/material.dart';

class FavoriteInfoCard extends StatelessWidget {
  const FavoriteInfoCard({
    Key? key,
    required this.name,
    required this.location,
    required this.desc,
  }) : super(key: key);

  final String name;
  final String location;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 24),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AstraColors.darken,
        border: Border.all(color: AstraColors.darken, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
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
            desc,
            style: const TextStyle(
                color: AstraColors.white08, fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }
}
