import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

/// Widget to display data such as children, status etc.
class TextItemWidget extends StatelessWidget {
  const TextItemWidget({ Key? key, required this.title , required this.value }) : super(key: key);
  /// Title
  final String title;
  /// Value 
  final String value; 

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AstraColors.white05,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: AstraColors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}