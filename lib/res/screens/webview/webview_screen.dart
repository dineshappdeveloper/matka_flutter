import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/utils.dart';



class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;

  String url='';

  @override
  void initState() {
    super.initState();
    url = Get.arguments;

    _controller = WebViewController();
    _controller..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            Utils.instance.showLoading();
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            Utils.instance.hideLoading();
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            Utils.instance.hideLoading();
          },

          onHttpError: (HttpResponseError error) {
            Utils.instance.hideLoading();
          },

        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(url));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Utils.instance.showLoading();
    });


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: WebViewWidget(controller: _controller),
        ));
  }


}

