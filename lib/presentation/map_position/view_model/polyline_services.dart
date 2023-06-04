import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
//import 'package:google_maps_demo/Data/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show cos, sqrt, asin;

import 'package:untitled/app/constants.dart';

class PolylineService {
  Future<Polyline> drawPolyline(LatLng from, LatLng to) async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        Constants.apiKey,
        PointLatLng(from.latitude, from.longitude),
        PointLatLng(to.latitude, to.longitude));
    result.points.forEach((PointLatLng point) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    });
    _calcDistance(polylineCoordinates);
    return Polyline
      (
        polylineId: PolylineId("polyline_id ${result.points.length}"),
        color: Colors.blue,
        points: polylineCoordinates
    );
  }

  void _calcDistance(List<LatLng> polylineCoordinates) {
    double totalDistance = 0.0;

    // Calculating the total distance by adding the distance
    // between small segments
    for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += _coordinateDistance(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }

    print("distance = ${totalDistance.toStringAsFixed(2)} km");
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}

/*
import 'package:location/location.dart';

class LocationService {
  Future<LocationData> getLocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      print("object");
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print("object1");
        throw Exception();
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      print("object2");
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print("object3");
        throw Exception();
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }
}
 */