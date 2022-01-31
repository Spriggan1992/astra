import 'dart:io';
import 'dart:ui';

import 'package:astra_app/domain/core/models/image_models.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_file_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileLogoScreen extends StatelessWidget {
  const ProfileLogoScreen({
    Key? key,
    required this.images,
    this.onPickImage,
    this.onShowImage,
    this.isEditMode = false,
    this.addedImg,
  }) : super(key: key);

  final VoidCallback? onPickImage;
  final VoidCallback? onShowImage;
  final bool isEditMode;
  final List<ImageModel> images;
  final File? addedImg;
  @override
  Widget build(BuildContext context) {
    return (isEditMode)
        ? Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: AstraFileImage(
                    image: addedImg ?? images.first.fileImage!,
                    width: 130,
                  ),
                ),
                SizedBox(
                  height: 130,
                  width: 130,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
                    child: Container(),
                  ),
                ),
                Positioned.fill(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: IconButton(
                      onPressed: onPickImage,
                      icon: const Icon(
                        CupertinoIcons.photo_camera,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: onShowImage,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: AstraFileImage(
                          image: images[1].fileImage!,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Align(
                        alignment: Alignment.center,
                        child: AstraFileImage(
                          image: images[2].fileImage!,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AstraFileImage(
                      image: images.first.fileImage!,
                      width: 130,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
