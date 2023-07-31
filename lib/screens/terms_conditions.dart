import 'package:ecommarce_app/utils/appbar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Terms_Conditions extends StatefulWidget {
  const Terms_Conditions({super.key});

  @override
  State<Terms_Conditions> createState() => _Terms_ConditionsState();
}

class _Terms_ConditionsState extends State<Terms_Conditions> {
  WebViewController? controller;

  initWebView() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(
          'https://doc-hosting.flycricket.io/zelzis-ecommerce-app-terms-of-use/a725bb54-4ffb-4e52-b7a6-6e0eca3d602e/terms'));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apbar(),
      body: WebViewWidget(controller: controller!),
    );
  }
}
