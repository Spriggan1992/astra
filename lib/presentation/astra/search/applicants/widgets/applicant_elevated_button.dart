
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/custom/blur_mask.dart';
import 'package:flutter/material.dart';
///If [isEnableButton] show the text [Подробная анкета] else [Подробная анкета скрыта] 
///Spesical button to display the applicant's detailed information
class ApplicantElevatedButton extends StatelessWidget {
   /// Button click event handler.
  final VoidCallback? onClick;
  /// A flag responsible for enabling button.
  final bool isEnableButton;

  const ApplicantElevatedButton({
    Key? key,
    required this.onClick,
    this.isEnableButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurMask(
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0.7),
            side: BorderSide(
              color:(isEnableButton)?AstraColors.golden08:AstraColors.white02, 
              width: 1,
            ),
          ),
          onPressed: (isEnableButton)?onClick:null,
          child:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: (isEnableButton)? const Text(
              'Подробная анкета',
              textAlign: TextAlign.center,
              style: TextStyle(color: AstraColors.white),
            ): const Text(
              'Подробная анкета скрыта',
              textAlign: TextAlign.center,
              style: TextStyle(color: AstraColors.white04),
            ),
          ),
        ),
      ),
    );
  }
}
