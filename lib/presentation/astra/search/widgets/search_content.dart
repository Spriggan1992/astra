import 'package:flutter/material.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({
    Key? key,
    required this.image,
    required this.children,
    required this.appBar,
    this.onTap,
  }) : super(key: key);

  final Image image;
  final List<Widget> children;
  final Widget appBar;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(image: image.image, fit: BoxFit.cover),
              ),
              child: GestureDetector(
                onTap: onTap,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: children,
                  ),
                ),
              ),
            ),
            appBar,
          ],
        ),
      ),
    );
  }
}
