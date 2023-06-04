import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/map_position/view_model/location_service.dart';
import 'package:untitled/presentation/map_position/view_model/polyline_services.dart';
class MapPositionViewModel extends BaseViewModel with ChangeNotifier{
  Completer<GoogleMapController> _controller=Completer();
  static  CameraPosition _initCameraPosition=
  CameraPosition(
      target: LatLng(33.515343,36.289590),
      zoom: 14.4746
  );
  LatLng currentLocation = _initCameraPosition.target;
  Set<Marker> _markers = {};
  Set<Polyline> _polyLines={};
  Set<Polyline> getPolyLines(){
    return _polyLines;
  }
  Set<Marker> getMarkers(){
    return _markers;
  }
  CameraPosition getInitCameraPosition() {
    return _initCameraPosition;
}
  static set initCameraPosition(CameraPosition value) {
    _initCameraPosition = value;
  }
  Completer<GoogleMapController> getController() {
    return _controller;
}
  setController(Completer<GoogleMapController> value) {
    _controller = value;
  }
setCurrentLoc(LatLng x ){
  currentLocation=x ;
  notifyListeners();
}
  Future<void> getMyLocation() async {
    LocationData  _myLocation = await LocationService().getLocation();
    _animateCamera(LatLng(_myLocation.latitude!, _myLocation.longitude!));
    notifyListeners();
  }

  Future<void> _animateCamera(LatLng _location) async {
    final GoogleMapController controller = await _controller.future;
    CameraPosition _cameraPosition = CameraPosition(
      target: _location,
      zoom: 17.00,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }
  void setMarker(LatLng _location) {
    Marker newMarker = Marker(
      markerId: MarkerId(_location.toString()),
      icon: BitmapDescriptor.defaultMarker,
      // icon: _locationIcon,
      position: _location,
      infoWindow: InfoWindow(
          title: "Title",
          snippet: "${currentLocation.latitude}, ${currentLocation.longitude}"),
    );
    _markers.add(newMarker);
notifyListeners();
  }
  Future<void> drawPolyline(LatLng from, LatLng to) async {
    Polyline polyline = await PolylineService().drawPolyline(from, to);

    _polyLines.add(polyline);

    setMarker(from);
    setMarker(to);
notifyListeners();
  }
  @override
  void dispose() {

    super.dispose();
  }
  @override
  void start() {
    //drawPolyline(LatLng(34.515343, 36.28959), LatLng(33.53063188830781, 36.2870171688155174));
  }
}
