import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/scan_qr_view/view_model/scan_qr_viewmodel.dart';
class QRScanScreen extends StatefulWidget {
  @override
  _QRScanScreenState createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  GestureDetector(
        onTap: () async {
          final viewModel = Provider.of<ScanQrViewModel>(context, listen: false);
          await viewModel.scanBarcode();

        },
        child: Center(
          child: Text(
            'Scan QR Code',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

AppBar getAppBarScannerQrCode() {
  return AppBar(
    title: Text(
      'Scan QR Code',
      style: TextStyle(color: Colors.black),
    ),
  );
}
