import 'package:astra_app/routes/app_router.gr.dart';
import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/glodal/widgets/buttons/astra_bordered_button.dart';
import 'package:astra_app/ui/glodal/widgets/buttons/astra_gradient_button.dart';
import 'package:astra_app/ui/glodal/widgets/dialogs/store_dialog.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TODO Зачем экраны называть одинаковыми названиями? Это вносит только путаницу.
class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AstraAppBar(
          onPressed: () {
            //TODO Куда?
          },
          title: 'Магазин',
          elevation: 0.3,
          actions: [
            IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const StoreDialog();
                  },
                );
              },
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
                color: AstraColors.black,
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
            const _AstraChekBox(),
            const Divider(
                color: AstraColors.dividerColor,
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
                    style: TextStyle(color: AstraColors.black, fontSize: 18),
                  ),
                  Text(
                    '7000 руб.',
                    style: TextStyle(color: AstraColors.black, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            AstraGradientButton(
              onTap: () {
                AutoRouter.of(context).push(const FinishRegisterScreenRoute());
              },
              title: 'Apple Pay',
            )
          ],
        ),
      ),
    );
  }
}

class _AstraChekBox extends StatefulWidget {
  const _AstraChekBox({
    Key? key,
  }) : super(key: key);

  @override
  State<_AstraChekBox> createState() => _AstraChekBoxState();
}

class _AstraChekBoxState extends State<_AstraChekBox> {
  bool chekBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: chekBoxValue,
            side: MaterialStateBorderSide.resolveWith(
              (states) =>
                  const BorderSide(width: 1.0, color: AstraColors.darkGrey),
            ),
            fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            checkColor: AstraColors.darkGrey,
            onChanged: (value) {
              chekBoxValue = value!;
              setState(() {});
            },
          ),
          const Text(
            'Автоматически обновлять покупку когда \nзакончатся лайки',
            style: TextStyle(color: AstraColors.darkGrey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
