import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/astra/favorite/favorite_info_card.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/material.dart';

/// Defines user form screen.
class UserFormScreen extends StatelessWidget {
  /// Users profile information.
  final Profile profile;
  const UserFormScreen({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AstraAppBar(
        elevation: 0,
        bgColor: Colors.transparent,
        iconColor: AstraColors.white,
      ),
      body: Stack(
        children: [
          AstraNetworkImage(
            imageUrl: profile.profilePhotos.first.imageUrl,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FavoriteInfoCard(
                  name: profile.firstname,
                  location: profile.userLocation,
                  description: profile.profileInfo,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
