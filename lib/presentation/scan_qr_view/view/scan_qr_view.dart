import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/page_superviser/home_supervisor/view_model/home_super_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/page_view_model.dart';
import 'package:untitled/presentation/scan_qr_view/view_model/scan_qr_viewmodel.dart';
class QRScanScreen extends StatefulWidget {
  @override
  _QRScanScreenState createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Consumer<ScanQrViewModel>(
      builder: (context, model, child) =>
      Scaffold(
        body:  GestureDetector(
          onTap: () async {
            await model.scanBarcode();
            model.confirmQr(Provider.of<HomeSuperVisorViewModel>(context,listen: false).getHomeSuperVisor().id);
          },
          child: Center(
            child: Text(
              'Scan QR Code',
              style: TextStyle(fontSize: 24),
            ),
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
