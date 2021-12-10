import 'package:astra_app/ui/config/colors.dart';
import 'package:flutter/material.dart';

class ContinueDialog extends StatelessWidget {
  const ContinueDialog(
      {Key? key, required this.content, required this.onContinue})
      : super(key: key);

  final String content;
  final VoidCallback onContinue;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0)), //this right here
      child: Container(
        height: 125,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: AstraColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
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
              TextButton(
                onPressed: onContinue,
                child: const Text(
                  "Продолжить",
                  style: TextStyle(
                      color: AstraColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
