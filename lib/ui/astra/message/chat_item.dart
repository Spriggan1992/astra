import 'package:flutter/material.dart';

class ChatItemCard extends StatelessWidget {
  const ChatItemCard({Key? key, required this.sent}) : super(key: key);

  final bool sent;
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
                "Здорово, меня Настя. Я из Москвы.Расскажу интересный факт о себе. Я 4 раза перездавала экзамен в школе и решила уйти работать. Работа оказалось не по душе (ведь душа хочет денег и любви), и я обучилась на повара. И сейчас, как раз, я готовлю кое-что)))))))",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: (sent)
                        ? Color.fromRGBO(251, 251, 251, 0.9)
                        : Color.fromRGBO(24, 24, 24, 0.9),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Positioned(
                child: Text(
                  '12:21',
                  style: TextStyle(
                    color: (sent)
                        ? Color.fromRGBO(251, 251, 251, 0.4)
                        : Color.fromRGBO(24, 24, 24, 0.4),
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
                ? LinearGradient(
                    colors: [
                      Color.fromRGBO(30, 49, 90, 1),
                      Color.fromRGBO(24, 38, 71, 1),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    tileMode: TileMode.decal,
                    stops: [0.0, 1.0])
                : LinearGradient(
                    colors: [
                      Color.fromRGBO(28, 45, 82, 0.1),
                      Color.fromRGBO(28, 45, 82, 0.1),
                    ],
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
