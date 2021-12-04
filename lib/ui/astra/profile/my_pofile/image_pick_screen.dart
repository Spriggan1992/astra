import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/material.dart';

class ImagePickScreen extends StatelessWidget {
  const ImagePickScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AstraAppBar(
        onPressed: () {},
        title: 'Загрузка фотографии',
        actions: [
          TextButton(
            onPressed: () {},
            child: const Icon(Icons.check),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(
              'assets/girl.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.11)),
                borderRadius: BorderRadius.circular(14),
                color: const Color.fromRGBO(251, 251, 251, 1),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 80,
                      height: 80,
                      color: Colors.red,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Color.fromRGBO(24, 24, 24, 0.1),
                    thickness: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Загрузить',
                        style: TextStyle(
                          color: Color.fromRGBO(24, 24, 24, 0.9),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Color.fromRGBO(24, 24, 24, 0.1),
                    thickness: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Отмена',
                        style: TextStyle(
                          color: Color.fromRGBO(222, 66, 66, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Color.fromRGBO(24, 24, 24, 0.1),
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
