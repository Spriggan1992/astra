import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:flutter/material.dart';

/// Displayed if there are no profiles left
class SearchFinishWidget extends StatelessWidget {
  const SearchFinishWidget({
    Key? key,
    this.onTap,
    required this.profile,
  }) : super(key: key);

  /// Event handler on tap go to favorites
  final VoidCallback? onTap;

  /// Image provider. In this case resposible for showing image stored on device.
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        profile.profilePhotos.isEmpty
            ? Image.asset(
                'assets/girl.png',
                width: size.width,
                height: size.height,
                fit: BoxFit.cover,
              )
            : AstraNetworkImage(
                imageUrl: profile.profilePhotos.first.imageUrl,
                fileImage: profile.profilePhotos.first.cachedImage?.fullImage ==
                        null
                    ? null
                    : Image.file(
                            profile.profilePhotos.first.cachedImage!.fullImage!)
                        .image),
        SizedBox(
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
          ),
        ),
      ],
    );
  }
}
