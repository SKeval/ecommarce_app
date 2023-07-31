import 'package:ecommarce_app/utils/appbar.dart';
import 'package:ecommarce_app/utils/drawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Privacy_Policy extends StatefulWidget {
  const Privacy_Policy({super.key});

  @override
  State<Privacy_Policy> createState() => _Privacy_PolicyState();
}

class _Privacy_PolicyState extends State<Privacy_Policy> {
  WebViewController? controller;

  initWebView() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      //..setNavigationDelegate(
      // NavigationDelegate(
      //   onProgress: (int progress) {
      //     // Update loading bar.
      //   },
      //   onPageStarted: (String url) {},
      //   onPageFinished: (String url) {},
      //   onWebResourceError: (WebResourceError error) {},
      //   onNavigationRequest: (NavigationRequest request) {
      //     if (request.url.startsWith('')) {
      //       return NavigationDecision.prevent;
      //     }
      //     return NavigationDecision.navigate;
      //   },
      // ),
      // )
      ..loadRequest(Uri.parse(
          'https://doc-hosting.flycricket.io/zelzis-ecommerce-app-privacy-policy/b05967ba-7765-4d87-9540-5c51287a19bb/privacy'));
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
      // drawer: drawerContent(context),
      body: WebViewWidget(controller: controller!),
    );
  }
}
