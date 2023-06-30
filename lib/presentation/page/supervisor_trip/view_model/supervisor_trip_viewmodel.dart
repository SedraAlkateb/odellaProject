import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/data/network/pusher.dart';
import 'package:untitled/data/responses/responses.dart';
import 'package:untitled/domain/usecase/home_supervisor_usecase.dart';
import 'package:untitled/main.dart';
import 'package:untitled/presentation/base/base_view_model.dart';

class SupervisorTripViewModel extends BaseViewModel with ChangeNotifier {
  AppPreferences _appPreferences = instance<AppPreferences>();
  late PusherClient pusherClient;
  late Channel channel;
  Completer<GoogleMapController> _controller=Completer();
  late Marker _marker = Marker(
    markerId: MarkerId('marker_1'),
    position: _latLng,
    infoWindow: InfoWindow(
      title: 'Googleplex',
      snippet: 'Google Headquarters',
    ),
  );
  LatLng _latLng = LatLng(32.7132038, 36.566874);
  Marker getMarker() {
    return _marker;
  }
  Completer<GoogleMapController> getController(){
    return _controller;
}
  getLatLng() {
    return _latLng;
  }

  HomeSupervisorUseCase _homeSupervisorUseCase;
  SupervisorTripViewModel(this._homeSupervisorUseCase);
  bool _succ = false;
  int tripId = 0;
  @override
  void start() {

    tripSupervisor();
  }

  setLatLng(LatLng latLng) {
    _latLng = latLng;
    notifyListeners();
  }

  setSucc(bool s) {
    _succ = s;
  }

  Future<String> getLocalTime() async {
    String _time = await FlutterNativeTimezone.getLocalTimezone();
    DateTime now =
        DateTime.now().toUtc().add(Duration(hours: getTimezoneOffset(_time)));
    final DateFormat formatter = DateFormat('HH:mm', 'en');
    final String formatted = formatter.format(now);

    return formatted;
  }

  PusherTrip _pusherTrip = instance<PusherTrip>();
  int getTimezoneOffset(String timezone) {
    DateTime now = DateTime.now();
    Duration offset = DateTime.parse(now.toString()).timeZoneOffset;
    int hours = offset.inHours;
    return hours;
  }
late  GoogleMapController googleMapController;
  tripSupervisor() async {
    setSucc(false);
    setStateScreen(1);
    (await _homeSupervisorUseCase.execute(await getLocalTime())).fold(
        (failure) {
      setStateScreen(2);
      setSucc(false);
      print(failure.massage);
    }, (data) async {
      if (data != null) {
        if (data.dataHomeSupervisor != null &&
            data.dataHomeSupervisor?.id != 0) {
        //  googleMapController=await _controller.future;
          setStateScreen(0);
          setTripId(data.dataHomeSupervisor?.id ?? 0);
          pusherClient = await _pusherTrip.createPusherClient();
          channel = await pusherClient
              .subscribe("private-tracking.${data.dataHomeSupervisor?.id}");
          await channel.bind("client-tracking", (PusherEvent? event) {
            print(event?.data);
            if (event?.data != null) {
              updateMarker(event!.data.toString());
            }
          });
        } else {
          setStateScreen(3);
          print("object");
        }
      } else {
        setStateScreen(3);
        print("object");
      }
    });
  }
  List<LatLng> polyLineCoordinates=[];

  void getPolyLine()async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        " ",
        PointLatLng(0.0, 0.0),
        PointLatLng(0.0, 0.0)
    );
    if (result.points.isEmpty) {
      result.points.forEach((PointLatLng point) =>
          polyLineCoordinates.add(
            LatLng(point.latitude, point.longitude),
          )
      );
    }
  }


  void updateMarker(String data) async{
    Position position;
    Map<String, dynamic> resultMap;
    resultMap = jsonDecode(data)  ;
    position = Position.fromJson(resultMap);
    print(position.lng);
    print(position.lat);
    LatLng latLng = LatLng(position.lat , position.lng);
    MarkerId markerId = MarkerId('location');
    Marker marker = Marker(
      markerId: markerId,
      //icon: _markerIcon,
      position: latLng,
    );
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          zoom: 20.5,
          target:
          LatLng(position.lat ,position.lng )
      )
      )
      );

    setMarker(marker);

  }


  setMarker(Marker marker) {
    _marker = marker;
    notifyListeners();
  }

  setTripId(int tI) {
    tripId = tI;
    notifyListeners();
  }

  int getTripId() {
    return tripId;
  }

  @override
  void dispose() {
    _controller = Completer();
    pusherClient.unsubscribe("tracking.${getTripId()}");
    pusherClient.disconnect();
    super.dispose();
  }

  @override
  setDialog(int state) {
    notifyListeners();
    return super.setDialog(state);
  }

  @override
  setStateScreen(int state) {
    notifyListeners();
    return super.setStateScreen(state);
  }
}
