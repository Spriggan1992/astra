import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {Key? key,
      required this.action1,
      required this.action2,
      required this.title})
      : super(key: key);

  final Widget action1;
  final Widget action2;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1.0,
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width / 1.30,
        horizontal: 24,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // title,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: title,
            ),
            const Divider(
              color: Color.fromRGBO(
                24,
                24,
                24,
                0.1,
              ),
              height: 1,
              thickness: 2,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        child: action1, width: (constraints.maxWidth / 2) - 5),
                    const SizedBox(
                      height: 25,
                      child: VerticalDivider(
                        color: Color.fromRGBO(24, 24, 24, 0.1),
                        width: 1,
                        thickness: 2,
                      ),
                    ),
                    SizedBox(
                        child: action2, width: (constraints.maxWidth / 2) - 5),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
