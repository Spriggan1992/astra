import 'package:astra_app/presentation/astra/favorite/info_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchButtons extends StatelessWidget {
  const SearchButtons(
      {Key? key, required this.onCancel, required this.onTapAgreement, required this.onTapQuestion})
      : super(key: key);

  final VoidCallback onCancel;
  final VoidCallback onTapQuestion;
  final VoidCallback onTapAgreement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoButton(
            onTap: onCancel,
            icon: Icons.close,
            height: 16,
            width: 38,
          ),
          InfoButton(
            onTap: onTapQuestion,
            icon: CupertinoIcons.question,
            height: 7,
            width: 28,
          ),
          InfoButton(
            onTap: onTapAgreement,
            icon: Icons.check,
            height: 16,
            width: 38,
          ),
        ],
      ),
    );
  }
}
