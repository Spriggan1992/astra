import 'package:astra_app/presentation/core/widgets/buttons/astra_bordered_button.dart';
import 'package:astra_app/presentation/core/widgets/buttons/astra_gradient_button.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/material.dart';

//TODO Зачем экраны называть одинаковыми названиями? Это вносит только путаницу.
class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AstraAppBar(
        onPressed: () {},
        title: 'Магазин',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.error_outline,
              size: 25,
              color: Color.fromRGBO(24, 24, 24, 0.6),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          const Text(
            'Выберите количество лайков,\n которые хотите преобрести',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(24, 24, 24, 1),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 24),
          AstraBorderredButton(
            onTap: () {},
            title: '3 лайка',
            withBorder: true,
          ),
          const SizedBox(height: 12),
          AstraGradientLikeButton(
            onTap: () {},
            title: '5 лайков',
          ),
          const SizedBox(height: 12),
          AstraBorderredButton(
            onTap: () {},
            title: '10 лайков',
            withBorder: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: true,
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(
                        width: 1.0, color: Color.fromRGBO(24, 24, 24, 0.8)),
                  ),
                  checkColor: Colors.black,
                  activeColor: Colors.white,
                  onChanged: (value) {},
                ),
                const Text(
                  'Автоматически обновлять покупку когда \nзакончатся лайки',
                  style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 0.8), fontSize: 12),
                ),
              ],
            ),
          ),
          const Divider(
              color: Color.fromRGBO(176, 176, 176, 1),
              thickness: 1,
              endIndent: 25,
              indent: 25),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'К оплате',
                  style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1), fontSize: 18),
                ),
                Text(
                  '7000 руб.',
                  style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1), fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          AstraGradientButton(
            onTap: () {},
            title: 'Apple Pay',
          )
        ],
      ),
    );
  }
}
