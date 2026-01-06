import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:qr_code_scanner/home_screen.dart';
import 'package:qr_code_scanner/web_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Future<String?> getLastQR() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('last_qr');
  }

  void check() async {
    final String? result = await getLastQR();
    if (!mounted) return;

    if (result != null && result.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WebViewScreen(url: result)),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    Future.delayed(Duration(seconds: 3), () {
      check();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
        child: CachedNetworkImage(
          imageUrl:
              'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
          imageBuilder: (context, imageProvider) =>
              CircleAvatar(radius: 52, backgroundImage: imageProvider),
          errorWidget: (context, url, error) =>
              CircleAvatar(child: Icon(Icons.error)),
        ),
      ),
    );
  }
}
