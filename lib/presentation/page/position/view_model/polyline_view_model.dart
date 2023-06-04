import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
class PolyLineViewModel extends BaseViewModel with ChangeNotifier{
 late GoogleMapController mapController;
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};

// Define your origin and destination coordinates
  LatLng origin = LatLng(40.748817,-73.985428);
  LatLng destination = LatLng(25.197197, 55.274376);



  void getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyBVjBKNkA_4AKXa35f1oP7P_-HZNMRq7CQ",
      PointLatLng(origin.latitude, origin.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );


    if (result.points.isNotEmpty) {
      print("object");
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    print("object1");


    Polyline polyline = Polyline(
      polylineId: PolylineId("poly"),
      color: Colors.red,
      points: polylineCoordinates,
    );

    polylines[polyline.polylineId] = polyline;

    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void start() {
  }
}