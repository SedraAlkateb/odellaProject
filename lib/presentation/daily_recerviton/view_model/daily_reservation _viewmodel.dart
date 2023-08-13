import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:location/location.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/data/network/error_handler.dart';
import 'package:untitled/data/network/pusher.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/position_line_usecase.dart';
import 'package:untitled/domain/usecase/today_trips_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:location/location.dart' as loc;

class DailyReservationViewModel extends BaseViewModel with ChangeNotifier{
  TodayTripsUseCase _todayTripsUseCase;

  DailyReservationViewModel(this._todayTripsUseCase);
 late TodayTrips? data;
  late List<DataTodayTrips> searchData=[];
  int _lineID=0;
  setLine(int line){
    _lineID=line;
    notifyListeners();
  }
 int getLine(){
    return _lineID;
  }
@override
  setStateScreen(int state) {
  notifyListeners();
    return super.setStateScreen(state);
  }
  @override
  void start() {
    homeSupervisor();
  }
  setSearch( String value){
    List<String>position=[];
    searchData= (data?.dayTrips?.where(
            (element){
          final line=element.lines?.first.name.toLowerCase();
          final time=element.time?.start.toLowerCase();
        element.dataTransferPositions?.forEach((element) {position.add(element.name.toLowerCase());});
          final sear=value.toLowerCase();
          return line!.contains(sear) ||
              time!.contains(sear)  ||
              position.contains(sear) ;
        }).toList()??[]);
    notifyListeners();

  }

  int getTimezoneOffset(String timezone) {
    DateTime now = DateTime.now();
    Duration offset = DateTime.parse(now.toString()).timeZoneOffset;
    int hours = offset.inHours;
    return hours;
  }
  Future<String> getLocalTime() async {
    String _time = await FlutterNativeTimezone.getLocalTimezone();
    DateTime now = DateTime.now().toUtc().add(Duration(hours: getTimezoneOffset(_time)));
    final DateFormat formatter = DateFormat('HH:mm','en');
    final String formatted = formatter.format(now);

    return formatted;
  }
  setTodayTrips(TodayTrips h) async{
    data=h;
    searchData=h.dayTrips!;
    notifyListeners();
  }
 List<DataTodayTrips> getTodayTrips(){
  return searchData;
  }
  DataTodayTrips? getTodayTrip(){
    return data?.dayTrips![_lineID] ;
  }
  homeSupervisor() async{
    setStateScreen(1);
    ( await _todayTripsUseCase.execute(await getLocalTime())).fold(
            (failure)  {
          if(failure.code==ResponseCode.UNAUTORISED){
            setStateScreen(4);
          }else{
            setStateScreen(2);
          }
          print(failure.massage);
        },
            (data)  async{
            setStateScreen(0);
            await  setTodayTrips(data);

        });
  }

//pusher
  LocationData? _locationData;
  bool _trackingLocation = false;
  late StreamSubscription<LocationData>? _locationSubscription=null;
  String? _error;
  int tripId=0;
  setLocation(LocationData? newLocationData, String? error){
    _locationData = newLocationData;
    _error = error;
    _trackingLocation=true;
    notifyListeners();
  }
  LocationData? getLocationData(){
    return _locationData;
  }
  String? getError(){
    return _error;
  }
  PusherTrip _pusherTrip=instance<PusherTrip>();
  PusherClient? pusherClient;
  late Channel channel;
  void stopTracking() {
    if (_locationSubscription != null) {
      _trackingLocation = false;
      _locationSubscription?.cancel();
      //  _locationSubscription.pause();
    }
    cancelTrip();
    notifyListeners();
  }
  //final location = loc.Location() ;
  loc.Location location = loc.Location();
  Future<void> _setupLocationStream(int tripId) async {
    //_locationData = await LocationService().getLocation();
    try {
      pusherClient= await  _pusherTrip.createPusherClient();
      channel = pusherClient!.subscribe("private-tracking.${tripId}");
      _locationSubscription ??= location.onLocationChanged.listen((LocationData newLocationData)async {
        if(newLocationData.longitude!=null && newLocationData.latitude!=null) {
          print(newLocationData.longitude);
          Map<String, double> eventData = {  'lng':newLocationData.longitude ??0.0,'lat':newLocationData.latitude ??0.0};

          channel.trigger("tracking", eventData);
          //newLocationData.longitude ///newLocationData.latitude
        }//client-tracking
        setLocation(newLocationData, null);
      });
    }on Exception catch (e) {
      print(e);
      print("_scaffoldKey.currentState?.showSnackBar("
          " SnackBar(content: Text('Error refreshing location!')));");
      setLocation(null, e.toString());
    }
  }
  cancelTrip(){
    if(pusherClient!=null){
      pusherClient?.disconnect();
    }
//  channel.cancelEventChannelStream();
  }


}