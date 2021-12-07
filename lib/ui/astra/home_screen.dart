import 'package:astra_app/bloc/bottom_nav/bottom_nav_bar_cubit.dart';
import 'package:astra_app/enums/bottom_nav_bar_item.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/tab_navigator.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../glodal/widgets/scaffolds/astra_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/homescreen';

  static Route route() {
    return PageRouteBuilder(
      settings: const RouteSettings(name: routeName),
      transitionDuration: const Duration(seconds: 0),
      pageBuilder: (_, __, ___) => BlocProvider<BottomNavBarCubit>(
        create: (_) => BottomNavBarCubit(),
        child: HomeScreen(),
      ),
    );
  }

  final Map<BottomNavBarItem, GlobalKey<NavigatorState>> navigatorKeys = {
    BottomNavBarItem.search: GlobalKey<NavigatorState>(),
    BottomNavBarItem.favorite: GlobalKey<NavigatorState>(),
    BottomNavBarItem.message: GlobalKey<NavigatorState>(),
    BottomNavBarItem.profile: GlobalKey<NavigatorState>(),
  };

  final Map<BottomNavBarItem, IconData> items = {
    BottomNavBarItem.search: Icons.search,
    BottomNavBarItem.favorite: CupertinoIcons.person_2_fill,
    BottomNavBarItem.message: CupertinoIcons.envelope,
    BottomNavBarItem.profile: CupertinoIcons.settings,
  };

  int currentIndex = 0;

  changeIndex(int index) {
    currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BotomNavBarState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: items
                .map(
                  (item, _) => MapEntry(
                    item,
                    _buildOffstageNavigator(item, item == state.selectedItem),
                  ),
                )
                .values
                .toList(),
          ),
          bottomNavigationBar: AstraBottomNavBar(
            selectedIndex: currentIndex,
            onTapSearch: () {
              changeIndex(0);
              final selectedItem = BottomNavBarItem.values[0];
              _selectBottomNavBar(
                context,
                selectedItem,
                selectedItem == state.selectedItem,
              );
            },
            onTapFav: () {
              changeIndex(1);
              final selectedItem = BottomNavBarItem.values[1];
              _selectBottomNavBar(
                context,
                selectedItem,
                selectedItem == state.selectedItem,
              );
            },
            onTapMessage: () {
              changeIndex(2);
              final selectedItem = BottomNavBarItem.values[2];
              _selectBottomNavBar(
                context,
                selectedItem,
                selectedItem == state.selectedItem,
              );
            },
            onTapSettings: () {
              changeIndex(3);
              final selectedItem = BottomNavBarItem.values[3];
              _selectBottomNavBar(
                context,
                selectedItem,
                selectedItem == state.selectedItem,
              );
            },
          ),
        );
      },
    );
  }

  void _selectBottomNavBar(
      BuildContext context, BottomNavBarItem selectedItem, bool isSameItem) {
    if (isSameItem) {
      navigatorKeys[selectedItem]!
          .currentState!
          .popUntil((route) => route.isFirst);
    }
    context.read<BottomNavBarCubit>().updateSelectedItem(selectedItem);
  }

  Widget _buildOffstageNavigator(
      BottomNavBarItem currentItem, bool isSelected) {
    return Offstage(
      child: TabNavigator(
        navigatorKey: navigatorKeys[currentItem]!,
        item: currentItem,
      ),
      offstage: !isSelected,
    );
  }
}
