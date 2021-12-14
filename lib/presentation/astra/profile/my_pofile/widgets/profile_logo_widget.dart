import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileLogoScreen extends StatelessWidget {
  const ProfileLogoScreen(
      {Key? key, this.onPickImage, this.onShowImage, this.isEditMode = false})
      : super(key: key);

  final VoidCallback? onPickImage;
  final VoidCallback? onShowImage;
  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    return (isEditMode)
        ? Container(
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.all(50),
            alignment: Alignment.center,
            // width: 250,
            // height: 250,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/girl.png',
                ).image,
              ),
            ),
            child: IconButton(
              onPressed: onPickImage,
              icon: const Icon(
                CupertinoIcons.photo_camera,
                color: Colors.white,
              ),
            ),
          )
        : GestureDetector(
            onTap: onShowImage,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/left_girl.png'),
                      const SizedBox(width: 40),
                      Image.asset('assets/right_girl.png'),
                    ],
                  ),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width / 7 - 30,
                  top: -20,
                  child: Image.asset('assets/middle_girl.png'),
                ),
              ],
            ),
          );
  }
}
