import 'package:flutter/material.dart';

class AstraBorderredButton extends StatelessWidget {
  final String title;
  final bool withBorder;
  final VoidCallback onTap;

  const AstraBorderredButton(
      {Key? key,
      required this.title,
      required this.withBorder,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyle(
            color:
                (withBorder) ? const Color.fromRGBO(0, 0, 0, 1) : Colors.white,
            fontSize: 18),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: Color.fromRGBO(217, 191, 131, 0.8),
            width: 1,
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(
              MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width / 5),
              55),
        ),
        backgroundColor: MaterialStateProperty.all(
          (withBorder)
              ? Colors.white
              : const Color.fromRGBO(217, 191, 131, 0.8),
        ),
      ),
    );
  }
}

class AstraGradientLikeButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const AstraGradientLikeButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        height: 55,
        width: MediaQuery.of(context).size.width -
            (MediaQuery.of(context).size.width / 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(100, 72, 33, 1),
                Color.fromRGBO(217, 191, 131, 1),
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              tileMode: TileMode.decal,
              stops: [0.0, 1.0]),
        ),
      ),
    );
  }
}
