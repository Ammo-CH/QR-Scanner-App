import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:PosWala/splash_screen.dart';

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
        scaffoldBackgroundColor: Color.fromARGB(255, 148, 206, 228),
        primaryColor: Color.fromARGB(255, 148, 206, 228),
        appBarTheme: AppBarThemeData(foregroundColor: Colors.blue),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,    
              displayColor: Colors.blueAccent, 
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                  elevation: 10,
                  backgroundColor: const Color(0xFF2C4A56),
                  foregroundColor: Colors.white,
                  shadowColor: const Color.fromARGB(255, 66, 92, 103),
          )
        )
      ),
      title: 'QR code Scanner',
      home: Splashscreen(),
    );
  }
}
