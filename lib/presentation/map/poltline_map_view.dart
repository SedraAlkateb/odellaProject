import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/presentation/map/view_model/polyLine_map_viewmodel.dart';
class PolylineMapView extends StatefulWidget {
  final List<DataTransferPositions> position;
  const PolylineMapView({Key? key,required this.position}) : super(key: key);
  @override
  State<PolylineMapView> createState() => _PolylineMapViewState();
}

class _PolylineMapViewState extends State<PolylineMapView> {
  Completer<GoogleMapController> _controller = Completer();
@override
  void initState() {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    Provider.of<PolyLineMapViewModel>(context,listen: false).markers(widget.position);
  });
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(double.parse(widget.position[0].lat), double.parse(widget.position[0].lng)),
      zoom: 11.4746,
    );

    LatLng currentLocation = _initialCameraPosition.target;

    return    GoogleMap(
      initialCameraPosition: _initialCameraPosition,
      mapType: MapType.normal,
      onMapCreated: (controller) async {
        _controller.complete(controller);
      },
      onCameraMove: (e) => currentLocation = e.target,
      markers: Provider.of<PolyLineMapViewModel>(context).getMarkers(),
   //   polylines: _polylines,
    );
  }
}
