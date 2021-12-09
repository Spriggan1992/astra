import 'package:astra_app/ui/astra/profile/my_pofile/widgets/kurator_list_tile.dart';
import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  static const String routeName = '/supportscreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SupportScreen(),
    );
  }

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  bool _isCopied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AstraAppBar(
        onPressed: () {
          Navigator.of(context).pop();
        },
        title: 'Поддержка',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            KuratorListTile(
              name: "Алексей Муховец",
              leadingRadius: 32,
              trallingRadius: 28,
              onPressed: () {},
              backgroundImage: Image.asset('assets/right_girl.png').image,
            ),

            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Divider(
                color: AstraColors.black01,
                thickness: 1,
              ),
            ),
            // const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(29, 46, 86, 0.05),
                borderRadius: BorderRadius.circular(14),
              ),
              height: 66,
              child: Row(
                children: [
                  const Text(
                    'timtampereaqw@gmail.com',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AstraColors.black,
                    ),
                  ),
                  const Expanded(
                    child: VerticalDivider(
                      color: AstraColors.black01,
                      width: 30,
                      thickness: 1,
                    ),
                  ),
                  InkWell(
                    onTap: (_isCopied)
                        ? null
                        : () {
                            _isCopied = !_isCopied;
                            setState(() {});
                          },
                    child: Text(
                      'Копировать',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: (_isCopied)
                            ? AstraColors.black06
                            : AstraColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Вы можете оставить заявку вашему \nкуратору, либо отправить \nсообщение на email.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AstraColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
