import 'dart:io';
import 'dart:ui';

import 'package:astra_app/domain/image_picker/models/image.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _border = Border.all(color: AstraColors.golden08);

class ProfileLogoScreen extends StatelessWidget {
  const ProfileLogoScreen({
    Key? key,
    required this.images,
    this.onPickImage,
    this.onShowImage,
    this.isEditMode = false,
    this.addedImgIrl,
  }) : super(key: key);

  final VoidCallback? onPickImage;
  final VoidCallback? onShowImage;
  final bool isEditMode;
  final List<ImageModel> images;
  final String? addedImgIrl;
  @override
  Widget build(BuildContext context) {
    return (isEditMode)
        ? Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: AstraNetworkImage(
                    border: _border,
                    height: 130,
                    width: 130,
                    imageUrl: images.first.imageUrl,
                    fileImage: addedImgIrl == null
                        ? null
                        : FileImage(
                            File(
                              addedImgIrl!,
                            ),
                          ),
                    boxShape: BoxShape.circle,
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
                      AstraNetworkImage(
                        border: _border,
                        height: 130,
                        width: 90,
                        imageUrl: images.isEmpty ? '' : images[1].imageUrl,
                        boxShape: BoxShape.circle,
                      ),
                      const SizedBox(width: 40),
                      AstraNetworkImage(
                        border: _border,
                        height: 130,
                        width: 90,
                        imageUrl: images.isEmpty ? '' : images[2].imageUrl,
                        boxShape: BoxShape.circle,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AstraNetworkImage(
                      border: _border,
                      height: 130,
                      width: 130,
                      imageUrl: images.isEmpty ? '' : images.first.imageUrl,
                      boxShape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
