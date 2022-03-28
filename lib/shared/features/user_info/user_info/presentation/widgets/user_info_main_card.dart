import 'package:astra_app/core/presentation/constants/app_tests.dart';
import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/widgets/custom/blur_mask.dart';
import 'package:astra_app/core/domain/models/profile_model.dart';
import 'package:flutter/material.dart';

import 'text_item_widget.dart';

/// Applicant main card, do display main info about the applicant
class UserInfoMainCardScreen extends StatelessWidget {
  const UserInfoMainCardScreen({
    Key? key,
    required this.applicant,
    required this.onClose,
  }) : super(key: key);

  /// Applicant info model
  final ProfileModel applicant;

  /// Event handler on close
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return BlurMask(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AstraColors.darken,
          border: Border.all(
              color: const Color.fromRGBO(251, 251, 251, 0.2), width: 1),
        ),
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                    alignment: Alignment.topRight,
                    onPressed: onClose,
                    icon: const Icon(
                      Icons.close,
                      color: AstraColors.white,
                    )),
              ),
            ),
            Text(
              '${applicant.userInfo} ${AppTexts.year}',
              style: const TextStyle(
                  color: AstraColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              applicant.userLocation,
              style: const TextStyle(
                  color: AstraColors.white05,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Text(
              applicant.profileInfo,
              style: const TextStyle(
                  color: AstraColors.white08,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Divider(color: AstraColors.white01, thickness: 1),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextItemWidget(
                    title: AppTexts.familyStatus, value: applicant.status),
                Padding(
                  padding: const EdgeInsets.only(right: 34),
                  child: TextItemWidget(
                      title: AppTexts.growth, value: '${applicant.height} ${AppTexts.sm}'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextItemWidget(
                title: AppTexts.haveChildren,
                value: (applicant.haveChild) ? AppTexts.have : AppTexts.notHave),
          ],
        ),
      ),
    );
  }
}
