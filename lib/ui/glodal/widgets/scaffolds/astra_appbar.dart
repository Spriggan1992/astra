import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Defines a custom app bar.
class AstraAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AstraAppBar({
    Key? key,
    this.title,
    required this.onPressed,
    this.actions,
    this.bgColor,
    this.iconColor,
    this.elevation = 1,
  }) : super(key: key);

  final String? title;
  final List<Widget>? actions;
  final Color? bgColor;
  final Color? iconColor;
  final double elevation;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      centerTitle: true,
      backgroundColor: (bgColor == null) ? Colors.white : bgColor,
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(
          CupertinoIcons.back,
          color: (iconColor == null)
              ? const Color.fromRGBO(176, 176, 176, 1)
              : iconColor,
          size: 25,
        ),
      ),
      title: Text(
        title ?? '',
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: const Color.fromRGBO(31, 31, 31, 1),
              fontSize: 17,
            ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
