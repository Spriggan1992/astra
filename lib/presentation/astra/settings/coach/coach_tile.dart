import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

/// Coach tile widget, for target сomponent
class CoachTile extends StatelessWidget {
  const CoachTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.alignment,
    this.padding,
  }) : super(key: key);
  
  /// Title coaching
  final String title;
  /// Content text to display   
  final String subtitle;
  /// Padding 
  final EdgeInsetsGeometry? padding;
  /// Alignment of the coach tile
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Align(
        alignment: alignment,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AstraColors.white,
                fontSize: 16.0,
              
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AstraColors.white06,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
