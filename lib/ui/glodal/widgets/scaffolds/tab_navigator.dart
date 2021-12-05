import 'package:astra_app/enums/bottom_nav_bar_item.dart';
import 'package:astra_app/ui/astra/favorite/favorite_screen.dart';
import 'package:astra_app/ui/astra/message/message_screen.dart';
import 'package:astra_app/ui/astra/profile/profile_screen.dart';
import 'package:astra_app/ui/astra/search/search_screen.dart';
import 'package:astra_app/ui/config/route.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  static const String tabNavigatorRoot = '/';

  const TabNavigator({Key? key, required this.navigatorKey, required this.item})
      : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final BottomNavBarItem item;

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders();
    return Navigator(
      key: navigatorKey,
      initialRoute: tabNavigatorRoot,
      onGenerateRoute: AstraRouter.onGenerateNestedRoute,
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          MaterialPageRoute(
            settings: const RouteSettings(name: tabNavigatorRoot),
            builder: (context) => routeBuilders[initialRoute]!(context),
          )
        ];
      },
    );
  }

  Map<String, WidgetBuilder> _routeBuilders() {
    return {tabNavigatorRoot: (context) => _getScreen(context, item)};
  }

  Widget _getScreen(BuildContext context, BottomNavBarItem item) {
    switch (item) {
      case BottomNavBarItem.search:
        return const SearchScreen();
      case BottomNavBarItem.favorite:
        return const FavoriteScreen();
      case BottomNavBarItem.message:
        return const MessageScreen();
      case BottomNavBarItem.profile:
        return const ProfileScreen();
    }
  }
}
