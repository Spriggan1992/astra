import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

/// Displayed if there are no profiles left
class SearchFinishWidget extends StatelessWidget {
  const SearchFinishWidget({Key? key, this.onTap, this.fileImage}) : super(key: key);
  
   /// Event handler on tap go to favorites
  final VoidCallback? onTap;
   /// Image provider. In this case resposible for showing image stored on device.
  final ImageProvider<Object>? fileImage;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: fileImage ?? Image.asset('assets/girl.png').image, fit: BoxFit.cover),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Вы посмотрели все Анкеты.',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AstraColors.white),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Самое время заглянуть в Избранное',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AstraColors.white),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: onTap,
              child: const Text(
                'Избранное',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AstraColors.golden,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}
