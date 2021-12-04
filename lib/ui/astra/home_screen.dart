import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/config/gradients.dart';
import 'package:astra_app/ui/glodal/widgets/custom/custom_bottom_tab_bar.dart';
import 'package:astra_app/ui/glodal/widgets/custom/custom_tab_scaffold.dart';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart'
    hide CupertinoTabBar, CupertinoTabScaffold;

import 'favorite/astra_bottom_nav_bar.dart';
import 'favorite/favorite_screen.dart';
import 'favorite/search_screen.dart';
import 'message/message_screen.dart';
import 'profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/homescreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen_(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;

  List<Widget> bodies = [
    SearchScreen(),
    FavoriteScreen(),
    MessageScreen(),
    ProfileScreen()
  ];

  changeIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AstraBottomNavBar(
        onTapSearch: () {
          changeIndex(0);
        },
        onTapFav: () {
          changeIndex(1);
        },
        onTapMessage: () {
          changeIndex(2);
        },
        onTapSettings: () {
          changeIndex(3);
        },
      ),
      body: bodies[currentIndex],
    );
  }
}

class HomeScreen_ extends StatelessWidget {
  const HomeScreen_({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBuilder: (context, tab) {
          return CupertinoTabView(
            builder: (context) {
              switch (tab) {
                case 0:
                  return const SearchScreen();
                case 1:
                  return const FavoriteScreen();
                case 2:
                  return const MessageScreen();
                case 3:
                  return const ProfileScreen();

                default:
              }
              return Container();
            },
          );
        },
        tabBar: CupertinoTabBar(
          // backgroundColor: AstraColors.color_24_38_71_1,
          items: [
            AstraBottomNavigationBarItem(icon: Icons.search, label: ""),
            AstraBottomNavigationBarItem(
                icon: CupertinoIcons.person_2_fill, label: ""),
            AstraBottomNavigationBarItem(
                icon: CupertinoIcons.envelope, label: ""),
            AstraBottomNavigationBarItem(
                icon: CupertinoIcons.settings, label: ""),
          ],
          onTap: _onTabChanged,
        )

        // AstraNavBar(
        //   onTap: _onTabChanged,
        // ),
        );
  }

  void _onTabChanged(int newTab) {
    // final previous = _tabHistory.last;
    // _tabHistory.add(newTab);
    // if (_tabHistory.length > 2) {
    //   _tabHistory.removeAt(0);
    // }
    // if (previous == newTab) {
    //   // go to the tab's root
    //   _tabHolders[previous]!
    //       .currentState!
    //       .navigator
    //       .popUntil(ModalRoute.withName('/'));
  }
}

class AstraNavBar extends CupertinoTabBar {
  AstraNavBar({required ValueChanged<int> onTap})
      : super(
            onTap: onTap,
            backgroundColor: AstraColors.color_24_38_71_1,
            items: [
              AstraBottomNavigationBarItem(icon: Icons.search, label: ""),
              AstraBottomNavigationBarItem(
                  icon: CupertinoIcons.person_2_fill, label: ""),
              AstraBottomNavigationBarItem(
                  icon: CupertinoIcons.envelope, label: ""),
              AstraBottomNavigationBarItem(
                  icon: CupertinoIcons.settings, label: ""),
            ]);
}

class AstraBottomNavigationBarItem extends BottomNavigationBarItem {
  AstraBottomNavigationBarItem({required String label, required IconData icon})
      : super(
          icon: Icon(
            icon,
            color: AstraColors.goldenColorWithOpactity03,
          ),
          activeIcon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: Gradients.goldenGradient,
              ).createShader(bounds);
            },
            child: Icon(
              icon,
              color: AstraColors.goldenColor,
            ),
          ),
        );
}
