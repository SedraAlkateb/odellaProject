import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:location/location.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/data/network/error_handler.dart';
import 'package:untitled/data/network/pusher.dart';
import 'package:untitled/data/responses/responses.dart';
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
  late List<DataTransferPositions>? position=[];
late DataTodayTrips today;
  int _lineID=0;
  init()
  async {
    String deviceToken = await getDeviceToken();
    fcmToken=deviceToken;
    print("***********************************************");
    print(fcmToken);
    print("//////////////////////////////////////////////////////");
  }
  String fcmToken="lkdnf";
  setFcmToken(String fcmToken1){
    fcmToken==fcmToken1;
    notifyListeners();

  }
  String getFcmToken(){
    return fcmToken;
  }
  Future getDeviceToken() async
  {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? deviceToken = await firebaseMessaging.getToken();
    return (deviceToken == null) ? "" : deviceToken;
  }

  setLine(int line){
    _lineID=line;
    notifyListeners();
  }
 int getLine(){
    return _lineID;
  }
  List<DataTransferPositions> getPosition(){
    return position ??[];
  }
@override
  setStateScreen(int state) {
  notifyListeners();
    return super.setStateScreen(state);
  }
  @override
  void start() {
    init();
    homeSupervisor();
  }
  setTripId(DataTodayTrips trip){
    today=trip;
    position=trip.dataTransferPositions;
    notifyListeners();
  }
 int getTripId(){
    return today.id;
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
              setMessage(failure.massage);
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
  @override
  setMessage(String m) {
    notifyListeners();
    return super.setMessage(m);
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
List<Position> pos=[];
  int i=0;
  String po="";
  filterLine()async{
    print("nkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkobject");
    pusherClient = await _pusherTrip.createPusherClient();
    data?.dayTrips?.forEach((element)async {
      channel = await pusherClient!
          .subscribe("tracking.${element.id}");
      await channel.bind("client-tracking", (PusherEvent? event) {
        print(event?.data);
        if (event?.data != null) {
          po= event!.data.toString();
          Map<String, dynamic> resultMap;
          resultMap = jsonDecode(po)  ;
          Position position = Position.fromJson(resultMap);
          pos.add(position);
          pusherClient?.unsubscribe("tracking.${element.id}");
        }
      });
      i++;
    });

  }
  //final location = loc.Location() ;
  loc.Location location = loc.Location();
  cancelTrip(){
    if(pusherClient!=null){
      pusherClient?.disconnect();
    }
//  channel.cancelEventChannelStream();
  }


}