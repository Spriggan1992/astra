import 'package:astra_app/ui/config/colors.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
    this.contentPadding,
    this.isSignout = false,
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget icon;
  final String title;
  final bool isSignout;
  final EdgeInsets? contentPadding;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: (contentPadding == null)
              ? const EdgeInsets.symmetric(horizontal: 28)
              : contentPadding,
          onTap: onTap,
          leading: icon,
          title: Text(
            title,
            style: TextStyle(
              color: (!isSignout) ? AstraColors.black : AstraColors.orange,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Divider(
          height: 1,
          color: AstraColors.black01,
          thickness: 1,
        ),
      ],
    );
  }
}
