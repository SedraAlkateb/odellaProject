import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class PolyLineView extends StatefulWidget {
  @override
  State<PolyLineView> createState() => _PolyLineViewState();
}

class _PolyLineViewState extends State<PolyLineView> {
 late GoogleMapController mapController;
  List<LatLng> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        polylines: {
          Polyline(
            polylineId: PolylineId('route'),
            points: points,
            color: Colors.blue,
            width: 5,
          ),
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194),
          zoom: 12,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPoint,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _addPoint() {
    LatLng point = LatLng(37.7749, -122.4194);
    setState(() {
      points.add(point);
    });
  }
}
