import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/custom/blur_mask.dart';
import 'package:flutter/material.dart';

///Applicant main card, do display main info about the applicant
class ApplicationMainCardScreen extends StatelessWidget {
  const ApplicationMainCardScreen(
      {Key? key, required this.applicant, required this.onClose})
      : super(key: key);

  /// Applicant info model
  final Profile applicant;

  ///Event handler on close
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return BlurMask(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color.fromRGBO(0, 0, 0, 0.7),
          border: Border.all(
              color: const Color.fromRGBO(251, 251, 251, 0.2), width: 2),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: onClose,
                  icon: const Icon(
                    Icons.close,
                    color: AstraColors.white,
                  )),
            ),
            Text(
              '${applicant.firstname}, ${applicant.age} лет',
              style: const TextStyle(
                  color: AstraColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              '${applicant.userLocation} - ${applicant.age} от вас',
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
            const Divider(color: AstraColors.white01, thickness: 1),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildItemWidget(
                    title: 'Семейное положение:', value: applicant.status),
                _buildItemWidget(title: 'Рост:', value: '${applicant.height}'),
              ],
            ),
            const SizedBox(height: 16),
            _buildItemWidget(
                title: 'Наличие детей:',
                value: (applicant.haveChild) ? 'Есть' : 'Нет'),
          ],
        ),
      ),
    );
  }

  Widget _buildItemWidget({required String title, required String value}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AstraColors.white05,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: AstraColors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
