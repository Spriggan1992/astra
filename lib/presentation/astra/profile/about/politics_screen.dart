import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/material.dart';

class PoliticsScreen extends StatelessWidget {
  const PoliticsScreen({Key? key}) : super(key: key);

  static const String routeName = '/politicsscreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const PoliticsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AstraAppBar(
        title: 'Политика конфиденциальности',
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        children: [
          const Text(
            'Политика конфиденциальности',
            style: TextStyle(
              color: AstraColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Политика конфиденциальности в отношении обработки персональных данных',
              style: TextStyle(
                color: AstraColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Text(
            '1.Общие положения.',
            style: TextStyle(
              color: AstraColors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          _buildPoliticItemWidget(
              content:
                  '1.1. Политика обработки персональных данных в ПАО «Пых-чипых» (далее — Политика) определяет основные принципы, цели, условия и способы обработки персональных данных, перечни субъектов и обрабатываемых в ПАО «Пых-чипых» персональных данных, функции ПАО «Пых-чипых» при обработке персональных данных, права субъектов персональных данных, а также реализуемые в ПАО «Пых-чипых» требования к защите персональных данных.'),
          _buildPoliticItemWidget(
              content:
                  '1.2. Политика обработки персональных данных в ПАО «Пых-чипых» (далее — Политика) определяет основные принципы, цели, условия и способы обработки персональных данных, перечни субъектов и обрабатываемых в ПАО «Пых-чипых» персональных данных, функции ПАО «Пых-чипых» при обработке персональных данных, права субъектов персональных данных, а также реализуемые в ПАО «Пых-чипых» требования к защите персональных данных.'),
        ],
      ),
    );
  }

  Widget _buildPoliticItemWidget({required String content}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        content,
        style: const TextStyle(
          color: AstraColors.black,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
