import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/config/gradients.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AstraBottomBar2 extends BottomAppBarTheme {
  AstraBottomBar2() : super();
}

class AstraBottomNavBar extends StatefulWidget {
  const AstraBottomNavBar(
      {Key? key,
      this.onTapSearch,
      this.onTapFav,
      this.onTapMessage,
      required this.selectedIndex,
      this.onTapSettings})
      : super(key: key);

  final VoidCallback? onTapSearch;
  final VoidCallback? onTapFav;
  final VoidCallback? onTapMessage;
  final VoidCallback? onTapSettings;

  final int selectedIndex;

  @override
  State<AstraBottomNavBar> createState() => _AstraBottomNavBarState();
}

class _AstraBottomNavBarState extends State<AstraBottomNavBar> {
  bool tap_1 = false;
  bool tap_2 = false;
  bool tap_3 = false;
  bool tap_4 = false;

  _setSelect() {
    if (widget.selectedIndex == 0) {
      tap_1 = true;
      tap_2 = false;
      tap_3 = false;
      tap_4 = false;
    } else if (widget.selectedIndex == 1) {
      tap_1 = false;
      tap_2 = true;
      tap_3 = false;
      tap_4 = false;
    } else if (widget.selectedIndex == 2) {
      tap_1 = false;
      tap_2 = false;
      tap_3 = true;
      tap_4 = false;
    } else {
      tap_1 = false;
      tap_2 = false;
      tap_3 = false;
      tap_4 = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    _setSelect();

    return Container(
      decoration: const BoxDecoration(
        // border: Border(
        //   left: BorderSide(color: Color.fromRGBO(217, 191, 131, 0.8), width: 1),
        //   right:
        //       BorderSide(color: Color.fromRGBO(217, 191, 131, 0.8), width: 1),
        //   top: BorderSide(color: Color.fromRGBO(217, 191, 131, 0.8), width: 1),
        // ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        gradient: LinearGradient(
          colors: Gradients.blueGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          AstraBottomBarItem(
            onTap: widget.onTapSearch!,
            icon: Icons.search,
            isTapped: tap_1,
          ),
          AstraBottomBarItem(
            onTap: widget.onTapFav!,
            icon: CupertinoIcons.person_2_fill,
            isTapped: tap_2,
          ),
          AstraBottomBarItem(
            onTap: widget.onTapMessage!,
            icon: CupertinoIcons.envelope,
            isTapped: tap_3,
          ),
          AstraBottomBarItem(
            onTap: widget.onTapSettings!,
            icon: Icons.settings,
            isTapped: tap_4,
          ),
        ],
      ),
    );
  }
}

class AstraBottomBarItem extends StatelessWidget {
  const AstraBottomBarItem({
    Key? key,
    required this.icon,
    required this.onTap,
    this.isTapped = false,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;
  final bool isTapped;

  @override
  Widget build(BuildContext context) {
    return (isTapped)
        ? ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(colors: Gradients.goldenGradient)
                  .createShader(bounds);
            },
            child: IconButton(
              onPressed: onTap,
              icon: Icon(
                icon,
                color: AstraColors.goldenColor,
              ),
            ),
          )
        : IconButton(
            onPressed: onTap,
            icon: Icon(
              icon,
              color: AstraColors.goldenColorWithOpactity03,
            ),
          );
  }
}
