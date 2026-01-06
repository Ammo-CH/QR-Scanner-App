import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  const WebViewScreen({super.key, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool isloading = true;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color.fromARGB(255, 232, 161, 245))
      ..setNavigationDelegate(

        NavigationDelegate(
          
          onPageFinished: (_) => setState(() {
            isloading = false;
          }),
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          // if (isloading) Center(child: CircularProgressIndicator(color: Colors.grey,)),
          if (!isloading) Center(child: SpinKitDualRing(color: Colors.white,)),
        ],
      ),
    );
  }
}
