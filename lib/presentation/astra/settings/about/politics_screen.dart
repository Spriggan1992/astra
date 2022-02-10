import 'package:astra_app/presentation/core/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:auto_route/auto_route.dart';

class PoliticsScreen extends StatelessWidget {
  final String title;
  final String uri;

  const PoliticsScreen({
    Key? key,
    required this.title,
    required this.uri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AstraAppBar(
        title: title,
        onPressed: () => context.router.pop(),
      ),
      body: WebView(
        initialUrl: uri,
      ),
    );
  }
}