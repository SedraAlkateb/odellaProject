import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/page/polyyline_view_model.dart';


class YourHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // final model = Provider.of<MapViewModel>(context, listen: false);

    final LatLng origin = LatLng(37.4219999, -122.0840575);
    final LatLng destination = LatLng(37.7749, -122.4194);

    //model.addPolyline(origin, destination);

    return Scaffold(
      body: GoogleMap(
       // polylines: model.polylines,
        initialCameraPosition: CameraPosition(
          target: origin,
          zoom: 12,
        ),
      ),
    );
  }
}
