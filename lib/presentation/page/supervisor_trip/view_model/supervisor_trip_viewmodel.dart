import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/data/network/pusher.dart';
import 'package:untitled/data/responses/responses.dart';
import 'package:untitled/domain/usecase/home_supervisor_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';

class SupervisorTripViewModel extends BaseViewModel with ChangeNotifier{
  late  PusherClient pusherClient;
  late Channel channel;
  late GoogleMapController _controller;
  late Marker _marker= Marker(
  markerId: MarkerId('marker_1'),
  position: _latLng,
  infoWindow: InfoWindow(
  title: 'Googleplex',
  snippet: 'Google Headquarters',
  ),
  );
  LatLng _latLng = LatLng( 32.7132038,36.566874);
  Marker getMarker(){
    return _marker;
  }
  getLatLng(){
    return _latLng;
  }
  HomeSupervisorUseCase _homeSupervisorUseCase;
  SupervisorTripViewModel(this._homeSupervisorUseCase);
  bool _succ=false;
int tripId=0;
  @override
  void start() {
    tripSupervisor();

  }
  setLatLng(LatLng latLng){
    _latLng=latLng;
    notifyListeners();
  }
  setSucc(bool s){
    _succ=s;
  }
  Future<String> getLocalTime() async {
    String _time = await FlutterNativeTimezone.getLocalTimezone();
    DateTime now = DateTime.now().toUtc().add(Duration(hours: getTimezoneOffset(_time)));
    final DateFormat formatter = DateFormat('HH:mm','en');
    final String formatted = formatter.format(now);

    return formatted;
  }
  int getTimezoneOffset(String timezone) {
    DateTime now = DateTime.now();
    Duration offset = DateTime.parse(now.toString()).timeZoneOffset;
    int hours = offset.inHours;
    return hours;
  }


  getPusherConnect(){
    PusherOptions options = PusherOptions(
      encrypted: true,
      cluster:  PusherConfigration.cluster,
    );
    pusherClient = PusherClient(
      PusherConfigration.key,

      options,
      autoConnect:true,
      enableLogging: true,

    );
    pusherClient.connect();
    pusherClient.onConnectionStateChange((state) {
      print("previousState: ${state?.previousState??""}, currentState: ${state?.currentState}");
    });

    pusherClient.onConnectionError((error) {
      print("error: ${error?.message} ${error?.code}${error?.exception}");
    });

  }

  tripSupervisor() async{
    setSucc(false);
    ( await _homeSupervisorUseCase.execute(await getLocalTime())).fold(
            (failure)  {
          setSucc(false);
          print(failure.massage);
        },
            (data)  async{
          if(data!=null){
            if(data.dataHomeSupervisor!=null
              //  && data.dataHomeSupervisor?.id!=0
            ){
              setTripId(data.dataHomeSupervisor?.id ??0);
              getPusherConnect();
              channel = pusherClient.subscribe("tracking.4");//${data.dataHomeSupervisor?.id}
              channel.bind("tracking", (PusherEvent? event) {
                print(event?.data);
                if(event?.data!=null){
                  updateMarker(event!.data!);
                }
              });
            }

          }
        });
  }
  void updateMarker(String data) {
    Position position;
    Map<String, dynamic> resultMap =json.decode(data);
    position=Position.fromJson(resultMap);
    print(position.lng);
    print(position.lat);
    LatLng latLng = LatLng(position.lat,position.lng );
   // setLatLng(latLng);
    MarkerId markerId = MarkerId('location');
    Marker marker = Marker(
      markerId: markerId,
      //icon: _markerIcon,
      position: latLng,
    );
    setMarker(marker);

  }

  setMarker(Marker marker){
    _marker=marker;
    notifyListeners();
  }
  setTripId(int tI){
    tripId=tI;
    notifyListeners();
  }
 int getTripId(){
    return tripId;
  }

  @override
  void dispose() {
    LaravelEcho.instance.disconnect();
    super.dispose();
  }

}