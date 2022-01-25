import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Temporary Curator tile widget to display
/// Need to redo when we get data from the API
class CuratorTile extends StatelessWidget {
  const CuratorTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AstraColors.blackMetallic07,
        border: Border.all(
          color: AstraColors.white02,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: Image.asset('assets/right_girl.png').image,
                      filterQuality: FilterQuality.none,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Алексей Муховец',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AstraColors.white,
                      ),
                    ),
                    Text(
                      'Куратор',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AstraColors.white05,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: AstraColors.white08,
                child: CircleAvatar(
                  backgroundColor: AstraColors.blackMetallic09,
                  radius: 20 - 1,
                  child: Icon(CupertinoIcons.paperplane,
                      color: AstraColors.white08),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
