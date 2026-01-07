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
        primaryColor: Color.fromARGB(255, 148, 206, 228),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        appBarTheme: AppBarThemeData(foregroundColor: Colors.blue),
        scaffoldBackgroundColor: Color.fromARGB(255, 148, 206, 228),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,    
              displayColor: Colors.blueAccent, 
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
                  elevation: 10,
                  padding: EdgeInsets.zero,
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF2C4A56),
                  shadowColor: const Color.fromARGB(255, 66, 92, 103),
          )
        )
      ),
      title: 'QR code Scanner',
      home: Splashscreen(),
    );
  }
}
