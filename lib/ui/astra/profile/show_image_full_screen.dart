import 'package:astra_app/ui/glodal/widgets/dialogs/custom_dialog.dart';
import 'package:flutter/material.dart';

class ShowImageFullScreen extends StatelessWidget {
  const ShowImageFullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Scaffold(
        body: Stack(
          children: [
            Stack(
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    child: Image.asset(
                      'assets/girl.png',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    height: 44,
                    width: MediaQuery.of(context).size.width,
                    child: IconButton(
                      onPressed: () async {
                        // final result = await showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return

                        //     CustomDialog(

                        //     )

                        //     DeleteDialog(
                        //       title: const Text(
                        //         "Вы точно хотите удалить \nфотографию?",
                        //         textAlign: TextAlign.center,
                        //         style: TextStyle(
                        //           fontSize: 15,
                        //           fontWeight: FontWeight.w600,
                        //           color: Color.fromRGBO(24, 24, 24, 1),
                        //         ),
                        //       ),
                        //       actions: <Widget>[
                        //         TextButton(
                        //           onPressed: () =>
                        //               Navigator.of(context).pop(false),
                        //           child: const Text("Отмена"),
                        //         ),
                        //         const SizedBox(
                        //           height: 25,
                        //           child: VerticalDivider(
                        //             color: Color.fromRGBO(24, 24, 24, 0.1),
                        //             width: 1,
                        //             thickness: 2,
                        //           ),
                        //         ),
                        //         TextButton(
                        //           onPressed: () =>
                        //               Navigator.of(context).pop(true),
                        //           child: const Text(
                        //             "Удалить",
                        //             style: TextStyle(color: Colors.red),
                        //           ),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // );
                      },
                      icon: Icon(
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
