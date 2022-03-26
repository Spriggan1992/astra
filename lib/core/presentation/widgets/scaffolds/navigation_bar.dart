import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/theming/gradients.dart';
import 'package:flutter/material.dart';

/// Defines a custom bottom navigation bar.
class NavigationBar extends StatelessWidget {
  /// A list of tabs to display.
  final List<NavigationBarItem> items;

  /// The tab to display.
  final int currentIndex;

  /// Returns the index of the tab that was tapped.
  final Function(int)? onTap;

  /// The color of the icon and text when the item is selected.
  final Color? selectedItemColor;

  /// The color of the icon and text when the item is not selected.
  final Color? unselectedItemColor;

  const NavigationBar({
    Key? key,
    required this.items,
    this.currentIndex = 1,
    this.onTap,
    this.selectedItemColor = AstraColors.golden,
    this.unselectedItemColor = AstraColors.white03,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: AstraColors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (final item in items)
            TweenAnimationBuilder<double>(
              tween: Tween(
                end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
              ),
              curve: Curves.easeOutQuint,
              duration: const Duration(milliseconds: 500),
              builder: (context, t, _) {
                return InkWell(
                  onTap: () => onTap?.call(items.indexOf(item)),
                  child: Row(
                    children: [
                      if (items.indexOf(item) == currentIndex)
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                                    colors: Gradients.goldenGradient)
                                .createShader(bounds);
                          },
                          child: Icon(
                            item.icon,
                            color: AstraColors.golden,
                            size: 26,
                          ),
                        )
                      else
                        Icon(
                          item.icon,
                          color: AstraColors.golden03,
                          size: 26,
                        ),
                    ],
                  ),
                );
              },
            )
        ],
      ),
    );
  }
}

/// A tab for navigation bar.
class NavigationBarItem {
  /// An icon to display.
  final IconData icon;

  /// An icon to display when this tab bar is active.
  final Widget? activeIcon;

  /// A primary color to use for this tab.
  final Color? selectedColor;

  /// The color to display when this tab is not selected.
  final Color? unselectedColor;

  NavigationBarItem(
      {required this.icon,
      this.selectedColor,
      this.unselectedColor,
      this.activeIcon});
}
