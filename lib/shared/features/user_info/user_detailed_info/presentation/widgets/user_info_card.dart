import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/widgets/custom/blur_mask.dart';
import 'package:flutter/material.dart';

/// Widget to display item
class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  /// A title of the additional info.
  final String title;

  /// A description of the additional info.
  final String desc;

  @override
  Widget build(BuildContext context) {
    return BlurMask(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(
          left: 15,
          top: 15,
          right: 15,
          bottom: 24,
        ),
        decoration: BoxDecoration(
          color: AstraColors.darken,
          border: Border.all(
            color: AstraColors.white02,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              desc,
              style: const TextStyle(
                  color: AstraColors.white08, fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
