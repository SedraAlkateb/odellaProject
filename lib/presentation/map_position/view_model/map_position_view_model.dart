import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
class MapPositionViewModel extends BaseViewModel with ChangeNotifier{
  Completer<GoogleMapController> _controller=Completer();

@override
  void dispose() {

  super.dispose();
  }

  @override
  void start() {

    inputState.add(ContentState());
  }
  static  CameraPosition _initCameraPosition=
  CameraPosition(
      target: LatLng(33.515343,36.289590),
      zoom: 14.4746
  );

  static CameraPosition get initCameraPosition => _initCameraPosition;

  static set initCameraPosition(CameraPosition value) {
    _initCameraPosition = value;
  }

  Completer<GoogleMapController> get controller => _controller;

  set controller(Completer<GoogleMapController> value) {
    _controller = value;
    notifyListeners();
  }
}
