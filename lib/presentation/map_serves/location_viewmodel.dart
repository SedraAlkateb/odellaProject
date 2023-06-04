import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

class LocationViewModel extends ChangeNotifier {
 late LocationData _locationData;
  LocationData get locationData => _locationData;

  final Location location = Location();

  Future<void> getCurrentLocation() async {
    try {
      final LocationData locationData = await location.getLocation();
      _locationData = locationData;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}