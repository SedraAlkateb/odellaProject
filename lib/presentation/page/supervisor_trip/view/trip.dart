import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/mm.dart';
import 'package:untitled/presentation/page/supervisor_trip/view_model/supervisor_trip_viewmodel.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';

class TripSupervisor extends StatefulWidget {
  const TripSupervisor({super.key});

  @override
  _TripSupervisorState createState() => _TripSupervisorState();
}

class _TripSupervisorState extends State<TripSupervisor> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double _zoom = 20.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var home = Provider.of<SupervisorTripViewModel>(context, listen: false);
      home.start();
    });
    super.initState();

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
          Provider.of<SupervisorTripViewModel>(context).getStateScreen() == 0
              ? GoogleMap(
            onMapCreated: (mapController){
              if(model.getController().isCompleted){
                model.getController().complete(mapController);

              }
            },
            initialCameraPosition: CameraPosition(
              target: model.getLatLng(),
              zoom: _zoom,
            ),
            markers: Set.of((model.getMarker() != null) ? [model.getMarker()] : []),

          )
              :Provider.of<SupervisorTripViewModel>(context).getStateScreen()==1
              ?StateRenderer(
              stateRendererType: StateRendererType.fullScreenLoadingState,
              message: "Loading",
              retryActionFunction: () {})
              : Provider.of<SupervisorTripViewModel>(context).getStateScreen()==2
              ? StateRenderer(
              stateRendererType: StateRendererType.fullScreenErrorState,
              message: Provider.of<SupervisorTripViewModel>(context,listen: false).getMessage1(),
              retryActionFunction: () {
                Provider.of<SupervisorTripViewModel>(context,listen: false).start();
              })
              : StateRenderer(
              stateRendererType: StateRendererType.fullScreenEmptyState,
              message: "Not found any transmission lines",
              retryActionFunction: () {})


        ),
    );

  }
 late SupervisorTripViewModel viewModel;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = Provider.of<SupervisorTripViewModel>(context, listen: false);
  }

  @override
  void dispose() {
   viewModel.dispose();
    super.dispose();
  }
}
