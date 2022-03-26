import 'package:astra_app/core/application/enums/favorite_screen_type.dart';

///
/// Based on [index] transform it to [FavoriteScreenType]
FavoriteScreenType getFavoriteType(int index) {
  FavoriteScreenType type = FavoriteScreenType.likesForYou;
  switch (index) {
    case 0:
      type = FavoriteScreenType.yoursLikes;
      break;
    case 1:
      type = FavoriteScreenType.likesForYou;
      break;
    case 2:
      type = FavoriteScreenType.match;
      break;
    case 3:
      type = FavoriteScreenType.think;
      break;
    case 4:
      type = FavoriteScreenType.stopList;
      break;
  }
  return type;
}
