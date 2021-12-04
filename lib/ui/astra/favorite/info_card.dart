import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 24),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(85, 85, 85, 0.2),
        border:
            Border.all(color: const Color.fromRGBO(85, 85, 85, 0.2), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Мария, 25',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                'Россия, Москва',
                style: TextStyle(
                  fontSize: 12,
                  height: 2,
                  color: Color.fromRGBO(251, 251, 251, 0.4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'На свете нет ни одного человека, который бы не мечтал. Я не стала исключением, в моей голове создавались образы прекрасного будущего.dsa..',
            style: TextStyle(
                color: Color.fromRGBO(251, 251, 251, 0.8),
                fontSize: 14,
                height: 1.4),
          ),
        ],
      ),
    );
  }
}
