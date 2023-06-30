import 'dart:async';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void backgroundMain() {
  FlutterBackgroundService.initialize(onStart);
}

void onStart() {
  Timer.periodic(Duration(minutes: 1), (timer) async {
    // Load the saved counter value
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('counter') ?? 0;
    // Increment counter value
    counter++;
    // Save the new counter value
    prefs.setInt('counter', counter);
    FlutterBackgroundService().sendData({"counter": counter});
  });
}

void main() {
  backgroundMain();
}