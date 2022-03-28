import 'package:astra_app/core/presentation/constants/app_tests.dart';
import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/theming/gradients.dart';
import 'package:flutter/material.dart';

///Dialog widget for mutual sympathy
class SympathyDialog extends StatelessWidget {
  const SympathyDialog(
      {Key? key, required this.image, this.onClose, this.onWrite})
      : super(key: key);

  /// Image applicant
  final Image image;

  /// Button click close dialog event handler.
  final VoidCallback? onClose;

  /// Button click write message event handler.
  final VoidCallback? onWrite;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 1,
      alignment: Alignment.topCenter,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 44,
        vertical: 80,
      ),
      child: Container(
        //height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: Gradients.goldenGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 30),
                const Text(
                  AppTexts.congratulations,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: onClose,
                  icon: const Icon(
                    Icons.close,
                    size: 22,
                    color: AstraColors.white05,
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: image,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                AppTexts.youHaveMutualSympathy,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(
              color: AstraColors.white05,
              height: 1,
              thickness: 1,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                AppTexts.write,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
