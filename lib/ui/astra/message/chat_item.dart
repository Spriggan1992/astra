import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/config/gradients.dart';
import 'package:flutter/material.dart';

class ChatItemCard extends StatelessWidget {
  const ChatItemCard(
      {Key? key,
      required this.sent,
      required this.timeSent,
      required this.text})
      : super(key: key);

  final bool sent;
  final String timeSent;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          (sent) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(8),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.4),
          child: Stack(
            children: [
              Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: (sent) ? AstraColors.white09 : AstraColors.darkGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Positioned(
                child: Text(
                  timeSent,
                  style: TextStyle(
                    color: (sent) ? AstraColors.white04 : AstraColors.black04,
                    fontSize: 12,
                  ),
                ),
                bottom: 0,
                right: 0,
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: (sent)
                ? const LinearGradient(
                    colors: Gradients.blueGradient,
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    tileMode: TileMode.decal,
                    stops: [0.0, 1.0])
                : const LinearGradient(
                    colors: Gradients.grayGradient,
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    tileMode: TileMode.decal,
                    stops: [0.0, 1.0]),
          ),
        ),
        //Expanded(child: Container(), flex: 1),
      ],
    );
  }
}
