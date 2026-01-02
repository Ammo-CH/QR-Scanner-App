import 'package:flutter/material.dart';
import 'package:qr_code_scanner/mobile_scanner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner', style: TextStyle(color: Colors.purple)),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Positioned(
            top: 50,
            child: Text(
              'Scan the QR code first',
              style: TextStyle(fontSize: 20),
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
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                  elevation: 10,
                  backgroundColor: const Color(0xFF9C27B0),
                  foregroundColor: Colors.white,
                  shadowColor: Colors.purpleAccent,
                ),
                child: const Icon(Icons.qr_code_2_sharp, size: 45),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
