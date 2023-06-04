import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
class QRScanScreen extends StatefulWidget {
  @override
  _QRScanScreenState createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  String qrText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData as String;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
