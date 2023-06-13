
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:untitled/domain/usecase/confirm_qr_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';

class ScanQrViewModel extends BaseViewModel with ChangeNotifier {
@override
void start() {
  // TODO: implement start
}
ConfirmQrUseCase _confirmQrUseCase;
ScanQrViewModel(this._confirmQrUseCase);
String _barcodeValue = '';
String get barcodeValue => _barcodeValue;

Future<String> scanBarcode() async {
  final barcodeValue = await FlutterBarcodeScanner.scanBarcode(
    '#FF0000',
    'Cancel',
    true,
    ScanMode.BARCODE,
  );
  print(_barcodeValue);

  if (barcodeValue != '-1') {
    _barcodeValue = barcodeValue;
    print(_barcodeValue);
    notifyListeners();
  }
  return _barcodeValue;
}
confirmQr(int id) async{

  ( await _confirmQrUseCase.execute(
      ConfirmQrUseCaseInput(
          int.parse(_barcodeValue),id
      ))).fold(

          (failure)  {
      },
          (data)  async{
      });
}
  @override
  void dispose() {
    super.dispose();
  }
}

