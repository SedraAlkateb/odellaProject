import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:google_maps_webservice/directions.dart' as d;

class PolylineViewModel extends ChangeNotifier {
  Set<maps.Polyline> _polylines = {};
  Set<maps.Polyline> get polylines => _polylines;

  final d.DirectionsService _directionsService = d.DirectionsService();

  Future<void> addPolyline(maps.LatLng origin, maps.LatLng destination) async {
    final d.DirectionsResponse directions = await _directionsService.directionsWithLocation(
      d.Location(origin.latitude, origin.longitude),
      d.Location(destination.latitude, destination.longitude),
      travelMode: d.TravelMode.driving,
    );

    final List<maps.LatLng> positions = d.routes.first.polyline.points
        .map((e) => maps.LatLng(e.latitude, e.longitude))
        .toList();

    _polylines.add(
      maps.Polyline(
        polylineId: maps.PolylineId('polyline'),
        points: positions,
        color: Colors.blue,
        width: 5,
      ),
    );
    notifyListeners();
  }
}
