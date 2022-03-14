import 'package:astra_app/application/chats/chats_bloc.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/theming/gradients.dart';
import 'package:astra_app/presentation/core/theming/icons/svg_icon.dart';
import 'package:astra_app/presentation/core/widgets/bars/bottom_navigation_bar/i_nav_item.dart';
import 'package:astra_app/presentation/core/widgets/bars/bottom_navigation_bar/icon_nav_item.dart';
import 'package:astra_app/presentation/core/widgets/bars/bottom_navigation_bar/svg_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Defines a custom bottom navigation bar.
class NavBar extends StatelessWidget {
  /// A list of tabs to display.
  final List<INavItem> items;

  /// The tab to display.
  final int currentIndex;

  /// Returns the index of the tab that was tapped.
  final Function(int)? onTap;

  /// The color of the icon and text when the item is selected.
  final Color? selectedItemColor;

  /// The color of the icon and text when the item is not selected.
  final Color? unselectedItemColor;

  // /// Whether to show badge responsible for detect if user has new messages.
  // final bool isShowBadge;

  const NavBar({
    Key? key,
    required this.items,
    this.currentIndex = 1,
    this.onTap,
    this.selectedItemColor = AstraColors.white,
    this.unselectedItemColor = AstraColors.white03,
    // this.isShowBadge = false,
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
                      if (item is IconNavItem)
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                                    colors: Gradients.goldenGradient)
                                .createShader(bounds);
                          },
                          child: Icon(
                            (item as IconNavItem<IconData>).item,
                            color: items.indexOf(item) == currentIndex
                                ? item.unselectedColor
                                : item.selectedColor,
                            size: 26,
                          ),
                        ),
                      if (item is SvgNavItem)
                        Stack(
                          alignment: Alignment.topRight,
                          clipBehavior: Clip.none,
                          children: [
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                        colors: Gradients.goldenGradient)
                                    .createShader(bounds);
                              },
                              child: SvgIcon(
                                asset: (item as SvgNavItem<String>).item,
                                height: 18,
                                color: items.indexOf(item) == currentIndex
                                    ? item.unselectedColor
                                    : item.selectedColor,
                              ),
                            ),
                            BlocBuilder<ChatsBloc, ChatsState>(
                              builder: (context, state) {
                                return Visibility(
                                  visible: state.hasNewMessage,
                                  child: Positioned(
                                    bottom: 10,
                                    left: 12,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AstraColors.blue,
                                              width: 2),
                                          shape: BoxShape.circle,
                                          color: AstraColors.white),
                                      width: 14,
                                      height: 14,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        )
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
