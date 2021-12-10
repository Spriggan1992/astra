import 'package:astra_app/ui/config/colors.dart';
import 'package:flutter/material.dart';

class ProfileSwitchWidget extends StatelessWidget {
  const ProfileSwitchWidget(
      {Key? key,
      required this.title,
      required this.onChanged,
      this.switchValue = false})
      : super(key: key);

  final bool switchValue;
  final ValueChanged<bool> onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AstraColors.black04,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                height: 22,
                width: 44,
                decoration: BoxDecoration(
                  border: Border.all(color: AstraColors.black01),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Switch(
                  value: switchValue,
                  onChanged: onChanged,
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white,
                  activeColor: Color.fromRGBO(217, 191, 100, 1),
                ),
              ),
            ],
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
