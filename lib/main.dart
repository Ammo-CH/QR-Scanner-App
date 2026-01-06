import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:qr_code_scanner/splash_screen.dart';

Future<void> main() async {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 211, 173, 218),
        appBarTheme: AppBarThemeData(foregroundColor: Colors.blue),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.purple,    
              displayColor: Colors.deepOrange, 
            ),
      ),
      title: 'QR code Scanner',
      home: Splashscreen(),
    );
  }
}
