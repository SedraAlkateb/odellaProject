import 'dart:math';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

//import 'package:google_maps_webservice/directions.dart' as directions;

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State {
  late GoogleMapController _mapController;
  Set<Polyline> _polylines = {};

  static const LatLng _origin = LatLng(33.5314991,36.3177414);
  static const LatLng _destination = LatLng(37.3352, -121.8811);

  @override
  void initState() {
    super.initState();
    _getDirections();
  }

  Future<void> _getDirections() async {
    setState(() {
      _polylines.add(Polyline(
        polylineId: PolylineId('route1'),
        points: [_origin, _destination],
        color: Colors.blue,
        width: 5,
      ));
    });

    _mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: _origin,
          northeast: _destination,
        ),
        50.0,
      ),
    );

    // Start tracking the route
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      final LatLng from = _origin;
      final LatLng to = LatLng(_destination.latitude - i / 10, _destination.longitude);
      final bearing = getBearing(from.latitude, from.longitude, to.latitude, to.longitude);
      setState(() {
        _polylines.add(Polyline(
          polylineId: PolylineId('route$i'),
          points: [from, to],
          color: Colors.blue,
          width: 5,
        ));
      });
      _mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: to,
          bearing: bearing,
          tilt: 45.0,
          zoom: 15.0,
        ),
      ));
    }
  }

  double getBearing(double startLat, double startLng, double endLat, double endLng) {
    double longitudeDifference = endLng - startLng;
    double latitudeDifference = endLat - startLat;
    double angle = (180 / 3.1415) * atan2(longitudeDifference, latitudeDifference);
    return angle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (controller) => _mapController = controller,
        initialCameraPosition: CameraPosition(
          target: _origin,
          zoom: 10,
        ),
        polylines: _polylines,
      ),
    );
  }
}