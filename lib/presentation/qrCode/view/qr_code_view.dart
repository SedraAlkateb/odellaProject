import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:untitled/presentation/page/profile/view_model/profile_view_model.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
class QrCodeView extends StatefulWidget {
  const QrCodeView({Key? key}) : super(key: key);

  @override
  State<QrCodeView> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Center(
        child: QrImage(
          data: Provider.of<ProfileViewModel>(context,listen: false).getId().toString(),
          version: QrVersions.auto,
          size: AppSize.s250,
        ),
      ),
    );
  }
}
