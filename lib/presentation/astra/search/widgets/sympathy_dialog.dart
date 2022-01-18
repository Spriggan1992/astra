import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/theming/gradients.dart';
import 'package:flutter/material.dart';

///Dialog widget for mutual sympahy
class SympathyDialog extends StatelessWidget {
  const SympathyDialog({Key? key, this.onClose, this.onWrite}) : super(key: key);

  /// Button click close event handler.
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
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 44,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height/2.2,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: Gradients.goldenGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
         // mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 30),
                const Text(
                  'Поздравляем!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    size: 22,
                    color: AstraColors.white05,
                  ),
                ),
              ],
            ),
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/girl.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
           const Padding(
              padding:  EdgeInsets.symmetric(vertical: 12),
              child:  Text(
                'У вас взаимная симпатия!',
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
                'Написать',
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
