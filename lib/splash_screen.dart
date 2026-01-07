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
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Image.asset('assets/images/logo.png')
      ),
    );
  }
}
