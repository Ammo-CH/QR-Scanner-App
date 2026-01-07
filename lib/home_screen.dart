import 'package:flutter/material.dart';
import 'package:PosWala/mobile_scanner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.contain,
          height: kToolbarHeight - 10,
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Positioned(
            top: 50,
            child: Text(
              'Scan to connect.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 80,
            child: SizedBox(
              width: 90,
              height: 90,
              child: ElevatedButton(
                onPressed: () {
                  // scan action
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MobileScannerScreen(),
                    ),
                  );
                },
                child: const Icon(Icons.qr_code_2_sharp, size: 45),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
