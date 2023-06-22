import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/page/supervisor_trip/view_model/supervisor_trip_viewmodel.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';

class TripSupervisor extends StatefulWidget {
  const TripSupervisor({super.key});

  @override
  _TripSupervisorState createState() => _TripSupervisorState();
}

class _TripSupervisorState extends State<TripSupervisor> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double _zoom = 14.0;
 late GoogleMapController _mapController;
  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }
  @override
  void initState() {
    super.initState();
    Provider.of<SupervisorTripViewModel>(context, listen: false).start();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SupervisorTripViewModel>(
      builder: (context, model, child) =>
       Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('Live Location Tracking'),
          ),
          body:
          /*
          (model.getTripId()==0) ?
             Center(
              child: Text(LocaleKeys.no_trip),
             ) :
          */
               GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: CameraPosition(
              target: model.getLatLng(),
              zoom: _zoom,
            ),
            markers: Set.of((model.getMarker() != null) ? [model.getMarker()] : []),
          ),
        ),
    );

  }


  @override
  void dispose() {
   // channel.
    super.dispose();
  }
}
