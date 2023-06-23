import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  bool _serviceEnabled=false;
  Location location = new Location();


  @override
  void initState() {
    super.initState();
  }

  Future<void> _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      await _showLocationSettings();
    }
  }

  Future<void> _showLocationSettings() async {
    if (await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("موقع GPS غير مفعل"),
          content: Text("يرجى تمكين الموقع لتحديد موقعك."),
          actions: <Widget>[
            TextButton(
              child: Text("فتح إعدادات الموقع"),
              onPressed: () {
                Navigator.of(context).pop(true);
                openLocationSettings();
              },
            ),
          ],
        )
    )) {
      openLocationSettings();
    }
  }

  Future<void> openLocationSettings() async {
    if (await location.changeSettings()) {
      _checkLocationPermission();
    } else {
  //    _checkLocationPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تفعيل الموقع"),
      ),
      body: Center(
        child: Text(
          "تم تشغيل الموقع",
        ),
      ),
    );
  }
}