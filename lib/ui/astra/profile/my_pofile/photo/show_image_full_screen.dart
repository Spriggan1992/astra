import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/glodal/widgets/dialogs/custom_dialog.dart';
import 'package:flutter/material.dart';

class ShowImageFullScreen extends StatelessWidget {
  const ShowImageFullScreen({Key? key}) : super(key: key);

  static const String routeName = '/showimagefullscreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ShowImageFullScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Scaffold(
        body: Stack(
          children: [
            Stack(
              children: [
                //TODO scroling from data
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/girl.png',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    );
                  },
                ),

                Positioned(
                  bottom: 0,
                  child: Container(
                    color: const Color.fromRGBO(0, 0, 0, 0.2),
                    height: 44,
                    width: MediaQuery.of(context).size.width,
                    child: IconButton(
                      onPressed: () async {
                        final result = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog(
                              title: const Text(
                                "Вы точно хотите удалить фотографию?",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              action1: TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text(
                                  "Отмена",
                                  style: TextStyle(color: AstraColors.black),
                                ),
                              ),
                              action2: TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text(
                                  "Выйти",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            );
                          },
                        );
                        if (result) {
                          //TODO алгоритм удаление через блок и проверка запрещенные фото.
                        }
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 110,
              child: AppBar(
                centerTitle: true,
                title: const Text(
                  '1 из 3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
