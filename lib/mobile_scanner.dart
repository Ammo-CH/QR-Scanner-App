import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:PosWala/web_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobileScannerScreen extends StatefulWidget {
  const MobileScannerScreen({super.key});

  @override
  State<MobileScannerScreen> createState() => _MobileScannerState();
}

class _MobileScannerState extends State<MobileScannerScreen> {
  bool scanned = false;
  Future<void> saveLocal(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_qr', value);
  }

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      onDetect: (capture) async {
        if (scanned) return;
        scanned = true;

        final barcode = capture.barcodes.first;
        final String? code = barcode.rawValue;
        if (code != null) {
          await saveLocal(code);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WebViewScreen(url: code)),
          );
        }
      },
    );
  }
}
