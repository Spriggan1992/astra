import 'package:astra_app/ui/config/gradients.dart';
import 'package:flutter/material.dart';

enum ButtonType { success, loading, finished, waiting }

class AstraGradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final ButtonType type;

  const AstraGradientButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.type = ButtonType.waiting,
  }) : super(key: key);

  Widget _buildChildWidget() {
    switch (type) {
      case ButtonType.loading:
        return const FittedBox(
          fit: BoxFit.scaleDown,
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(color: Colors.white),
          ),
        );
      case ButtonType.success:
        return Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
          ),
        );
      case ButtonType.waiting:
        return Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromRGBO(187, 187, 187, 1),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        );
      case ButtonType.finished:
        return const Center(child: Icon(Icons.check, color: Colors.white));
      default:
        return const Text('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: _buildChildWidget(),
        height: 55,
        width: MediaQuery.of(context).size.width -
            (MediaQuery.of(context).size.width / 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: (type == ButtonType.waiting)
              ? const Color.fromRGBO(0, 0, 0, 0.08)
              : null,
          gradient: (type != ButtonType.waiting)
              ? const LinearGradient(
                  colors: Gradients.blueGradient,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  tileMode: TileMode.decal,
                  stops: [0.0, 1.0])
              : null,
        ),
      ),
    );
  }
}
