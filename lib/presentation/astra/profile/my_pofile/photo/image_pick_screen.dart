import 'dart:io';

import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickScreen extends StatefulWidget {
  const ImagePickScreen({Key? key}) : super(key: key);

  static const String routeName = '/imagepickscreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ImagePickScreen(),
    );
  }

  @override
  State<ImagePickScreen> createState() => _ImagePickScreenState();
}

class _ImagePickScreenState extends State<ImagePickScreen> {
  List<File> _images = [];
  final picker = ImagePicker();

  Future getImage(int index) async {
    final image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _images[index] = File(image!.path);
      print((image.path));
    });
  }

  @override
  void initState() {
    getImage(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AstraAppBar(
        onPressed: () {
          Navigator.of(context).pop();
        },
        title: 'Загрузка фотографии',
        actions: [
          TextButton(
            onPressed: () {},
            child: const Icon(
              Icons.check,
              color: AstraColors.black,
            ),
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
                border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.11)),
                borderRadius: BorderRadius.circular(14),
                color: AstraColors.white,
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
                    color: AstraColors.black01,
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
                    color: AstraColors.black01,
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
                    color: AstraColors.black01,
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
