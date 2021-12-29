import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/application/favorite/favorite_actor/favorite_actor_bloc.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/custom/blur_mask.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:astra_app/presentation/core/theming/borders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorite_action_icon.dart';

class FavoriteDetailWidget extends StatelessWidget {
  const FavoriteDetailWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.location,
    required this.onTap,
    this.mutualSympathy = false,
    required this.favotieType,
  }) : super(key: key);

  final FavoriteScreenType favotieType;
  final String image;
  final String name;
  final String location;
  final bool mutualSympathy;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Stack(
            children: [
              AstraNetworkImage(
                imageUrl: image,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: AstraColors.golden, width: 1.5),
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BlurMask(
                  borderRadius: Borders.favoriteCardBorder,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 42,
                    decoration: const BoxDecoration(
                      borderRadius: Borders.favoriteCardBorder,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          location,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AstraColors.white05,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          BlocBuilder<FavoriteActorBloc, FavoriteActorState>(
            buildWhen: (p, c) =>
                p.isRemovedFromStopList != c.isRemovedFromStopList,
            builder: (context, state) {
              return FavoriteActionIcon(
                favotieType: favotieType,
                isRemovedFromStopList: state.isRemovedFromStopList,
                mutualSympathy: mutualSympathy,
              );
            },
          ),
        ],
      ),
    );
  }
}
