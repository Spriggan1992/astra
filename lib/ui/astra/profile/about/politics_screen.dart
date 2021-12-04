import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/material.dart';

class PoliticsScreen extends StatelessWidget {
  const PoliticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AstraAppBar(
        title: 'Политика конфиденциальности',
        onPressed: () {},
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        children: [
          Text(
            'Политика конфиденциальности',
            style: TextStyle(
              color: Color.fromRGBO(24, 24, 24, 1),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Политика конфиденциальности в отношении обработки персональных данных',
              style: TextStyle(
                color: Color.fromRGBO(24, 24, 24, 1),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            '1.Общие положения.',
            style: TextStyle(
              color: Color.fromRGBO(24, 24, 24, 1),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              '1.1. Политика обработки персональных данных в ПАО «Пых-чипых» (далее — Политика) определяет основные принципы, цели, условия и способы обработки персональных данных, перечни субъектов и обрабатываемых в ПАО «Пых-чипых» персональных данных, функции ПАО «Пых-чипых» при обработке персональных данных, права субъектов персональных данных, а также реализуемые в ПАО «Пых-чипых» требования к защите персональных данных.',
              style: TextStyle(
                color: Color.fromRGBO(24, 24, 24, 1),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              '1.2. Политика обработки персональных данных в ПАО «Пых-чипых» (далее — Политика) определяет основные принципы, цели, условия и способы обработки персональных данных, перечни субъектов и обрабатываемых в ПАО «Пых-чипых» персональных данных, функции ПАО «Пых-чипых» при обработке персональных данных, права субъектов персональных данных, а также реализуемые в ПАО «Пых-чипых» требования к защите персональных данных.',
              style: TextStyle(
                color: Color.fromRGBO(24, 24, 24, 1),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
