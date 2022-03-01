import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/theming/gradients.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/astra_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HowToGetClubScreen extends StatelessWidget {
  const HowToGetClubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: Gradients.blueGradient,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                tileMode: TileMode.decal,
                stops: [0.0, 1.0],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40)
                        .add(const EdgeInsets.only(top: 70)),
                    child: const Text(
                      'Как попасть в клуб',
                      style: TextStyle(color: AstraColors.white, fontSize: 28),
                    ),
                  ),
                  _buildLineText('АСТРА — это реальные существующие люди.'),
                  _buildLineText('Люди, цель которых построить отношения.'),
                  _buildLineText(
                    'Люди, которые готовы рассказать о себе, и которые знают, что они хотят.',
                  ),
                  _buildLineText('Мы поддерживаем этих людей.'),
                  _buildLineText(
                    'Так как все люди в нашей базе реально существуют, зарегестрироваться в системе возможно только при очном визите к нам в офис.',
                  ),
                  _buildLineText(
                    'Регистарция платная. \nВ стоимость входит: заполнение вместе с вами расширенной анкеты, составление психологического профиля, работа видазжиста и фотографа (2-3 фото из нашей студии в профиле обязательны).',
                  ),
                  _buildLineText(
                    ' Связаться с нами можно по телефону: \n +7 (999) 123-45-67',
                  ),
                ],
              ),
            ),
          ),
          AstraAppBar(
            iconColor: AstraColors.white02,
            elevation: 0,
            bgColor: Colors.transparent,
            onPressed: () => context.router.pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildLineText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: const TextStyle(
          color: AstraColors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
