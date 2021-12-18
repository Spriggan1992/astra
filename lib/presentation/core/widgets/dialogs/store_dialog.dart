import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

class StoreDialog extends StatelessWidget {
  const StoreDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1.0,
      backgroundColor: Colors.white,
      insetPadding:
          const EdgeInsets.only(top: 120, left: 24, right: 23, bottom: 200),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLineText(
                "Лайки — это возможность начать общение с теми, с кем у вас возникла взаимная симпатия."),
            _buildLineText(
                "Лайк списывается с вашего счета только при взаимном лайке от того, кого лайкнули вы."),
            _buildLineText("После списания откроется возможность общения."),
          ],
        ),
      ),
    );
  }

  Widget _buildLineText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AstraColors.black,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
