import 'dart:async';
import 'dart:convert';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/data/network/error_handler.dart';
import 'package:untitled/data/network/pusher.dart';
import 'package:untitled/domain/usecase/confirm_qr_usecase.dart';
import 'package:untitled/domain/usecase/home_supervisor_usecase.dart';
import 'package:untitled/domain/usecase/student_position_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:location/location.dart' as loc;
//import 'package:untitled/domain/usecase/supervisor_update_position_usecase.dart';

class HomeSuperVisorViewModel extends BaseViewModel with ChangeNotifier{
  ConfirmQrUseCase _confirmQrUseCase;
  HomeSupervisorUseCase _homeSupervisorUseCase;
  StudentPositionUseCase _studentPositionUseCase;
  HomeSuperVisorViewModel(this._homeSupervisorUseCase,this._confirmQrUseCase,this._studentPositionUseCase);
  List<UserConf>search =[];
  int _position=0;
  bool _succ=false;
  bool getSucc(){
    return _succ;
  }
 bool getAttendent(int index){
    if(search[index].triUser.first.StudentAttendance == "0")
    {
      return  false;
    }else
      {
        return true;
      }
 }
 setAtt(int index,bool a){
    if(a==true){
      search[index] .triUser.first.StudentAttendance="1";
    }else{
      search[index] .triUser.first.StudentAttendance="0";
    }
 }
  setPosition(int position){
    _position=position;
    notifyListeners();
  }
  int getPosition(){
    return _position;
  }
  setSucc(bool s){
    _succ=s;
  }
  @override
  setStateScreen(int state) {
    notifyListeners();
    return super.setStateScreen(state);
  }
  @override
  setMessage(String m) {
notifyListeners();
return super.setMessage(m);
  }

  @override
  void start() async{
    homeSupervisor();
  }
  cancelTrip(){
    if(pusherClient!=null){
      pusherClient?.disconnect();
    }
//  channel.cancelEventChannelStream();
  }
  @override
  void dispose() {
    super.dispose();
  }
  String _time="";
  String getTime(){
    return _time;
  }
  bool confirm=false;
  Future<bool> confirmQr(int id) async{
    print(id);
    confirm=false;
    ( await _confirmQrUseCase.execute(
        ConfirmQrUseCaseInput(
            id,_homeSuperVisor.id
        ))).fold(

            (failure)  {

          confirm=false;
          setMessage(failure.massage);
        },
            (data)  async{
          confirm=true;
        });
    return confirm;
  }
  setAllUser(){
    search=_homeSuperVisor.users??[];
    notifyListeners();
  }
  Future<void> triggerEvent() async {
    final String appKey = '73533acae2e494dbe929';
    final String appSecret = '91e59dc74100f3750f98';
    final String channelName = 'Public-trackingg';

    final url = Uri.parse('https://api.pusher.com/apps/1652165/events');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${base64Encode(utf8.encode("$appKey:$appSecret"))}',
    };
    final data = {
      'name': 'client-event',
      'channels': [channelName],
      'data': {
        'message': 'Hello, Pusher!',
      },
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
      encoding: Encoding.getByName('utf-8'),
    );

    if (response.statusCode == 200) {
      print('تم إرسال الرسالة بنجاح.');
    } else {
      print('حدث خطأ أثناء إرسال الرسالة: ${response.body}');
    }
  }

  bool studentPos=false;
  Future<bool> studentPosition(int positionId) async{
    studentPos=false;
    ( await _studentPositionUseCase.execute(
        StudentPositionUseCaseInput(
            _homeSuperVisor.id,positionId
        ))).fold(

            (failure)  {
              setMessage(failure.massage);

              studentPos=false;
        },
            (data)  async{
          studentPos=true;
          positionUser(data.users);
          notifyListeners();
        });
    return studentPos;
  }
  positionUser(List<UserConf> user){
   List<UserConf> s   =[];
    user.forEach((element) {
      element.triUser.forEach((value) {
        if(value.TripId==_homeSuperVisor.id.toString()){
          s.add(UserConf(element.user, [value]));
        }
      });
    });
    search=s;
    notifyListeners();
  }


  late DataHomeSupervisor _homeSuperVisor;
  List<DataTransferPositions> positions=[];
  List<DataTransferPositions> getPositions(){
    return positions;
  }
  setPositions(List<DataTransferPositions> pos){
    positions=pos;
    notifyListeners();
  }
  setHomeSuperVisor(DataHomeSupervisor h) async{
    _homeSuperVisor=h;
    search=h.users!;
    setSucc(true);
    notifyListeners();
  }
  DataHomeSupervisor getHomeSuperVisor(){
    return _homeSuperVisor;
  }
  Future<String> getLocalTime() async {
    String _time = await FlutterNativeTimezone.getLocalTimezone();
    DateTime now = DateTime.now().toUtc().add(Duration(hours: getTimezoneOffset(_time)));
    final DateFormat formatter = DateFormat('HH:mm','en');
    final String formatted = formatter.format(now);

    return formatted;
  }
  setSearch( String value){
    search= _homeSuperVisor.users?.where(
            (element){
          final fName=element.user.lastName.toLowerCase();
          final lName=element.user.firstName.toLowerCase();
          final phone=element.user.phoneNumber.toLowerCase();
          final email =element.user.email.toLowerCase();
          final sear=value.toLowerCase();
          return fName.contains(sear) ||
              lName.contains(sear)  ||
              phone.contains(sear) ||
              email.contains(sear) ;
        }).toList()??[];
    notifyListeners();

  }
  List<UserConf> getUser(){
    return search;
  }
  int getTimezoneOffset(String timezone) {
    DateTime now = DateTime.now();
    Duration offset = DateTime.parse(now.toString()).timeZoneOffset;
    int hours = offset.inHours;
    return hours;
  }

  //////////////////////////input////////////////////////
  homeSupervisor() async{
    setStateScreen(1);
    setSucc(false);
    ( await _homeSupervisorUseCase.execute(await getLocalTime())).fold(
            (failure)  {
              setMessage(failure.massage);

              if(failure.code==ResponseCode.UNAUTORISED){
            setStateScreen(4);
          }else{
            setStateScreen(2);
          }
          setSucc(false);
          print(failure.massage);
        },
            (data)  async{
          if(data.dataHomeSupervisor!=null &&data.dataHomeSupervisor!.id!=0&&data.dataHomeSupervisor!.users!.isNotEmpty){

            setStateScreen(0);
            await  setHomeSuperVisor(data.dataHomeSupervisor!);
            setPositions(data.dataHomeSupervisor?.dataTransferPositions ??[]);
           _setupLocationStream(data.dataHomeSupervisor!.id);
          }else{
            setStateScreen(3);
          }
        });
  }
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
      _locationSubscription = null;
    }
    cancelTrip();
    notifyListeners();
  }
  loc.Location location = loc.Location();
 late Channel channel1;
   late PusherClient pusherClientDaily;
  Future<void> setupLocationStream1() async {
    pusherClientDaily= await  _pusherTrip.createPusherDailyReservation();
    channel1 = pusherClientDaily.subscribe("Public-trackingg");

  }
  Future<void> streggr() async {

    channel1.trigger("event", "jojjpjj");

  }

  void triggerEvent1() async {
    var url = Uri.parse('https://api.pusher.com/apps/1652165/events');
    var headers = {
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({
      'name': 'client-event',
      'channels': ['Public-trackingg'],
      'data': {'data': 'event-data'}
    });

    try {
      var response = await http.post(url, headers: headers, body: body);
      print('تم استدعاء الـ Trigger بنجاح. الاستجابة: ${response.body}');
    } catch (e) {

      print('حدث خطأ أثناء استدعاء الـ Trigger: $e');
    }
  }
  Future<void> bind() async {

    channel1.bind("client_event", (event) {
      print(event?.data);
    });
  }
  Future<void> unbindd() async {

    channel1.unbind("event");
    pusherClientDaily.disconnect();
  }

  Future<void> _setupLocationStream(int tripId) async {
    //_locationData = await LocationService().getLocation();
    try {
      pusherClient= await  _pusherTrip.createPusherClient();
      channel = pusherClient!.subscribe("private-tracking.${tripId}");
   //   pusherClientDaily= await  _pusherTrip.createPusherDailyReservation();

      channel.bind('pusher:subscription_succeeded', (event) {
        _locationSubscription ??= location.onLocationChanged.listen((LocationData newLocationData)async {
          if(newLocationData.longitude!=null && newLocationData.latitude!=null) {
            print(newLocationData.longitude);
            Map<String, double> eventData = {  'lng':newLocationData.longitude ??0.0,'lat':newLocationData.latitude ??0.0};
            channel.trigger("tracking", eventData);

          }//client-tracking
          setLocation(newLocationData, null);
        });
      });
    }on Exception catch (e) {
      print(e);
      print("_scaffoldKey.currentState?.showSnackBar("
          " SnackBar(content: Text('Error refreshing location!')));");
      setLocation(null, e.toString());
    }
  }


}
/*
  supervisorPosition(int tripId,double lng,double lat) async{
    ( await _supervisorUpdatePositionUseCase.execute(UpdatePositionSupervisorUseCaseInput(
        tripId, lng, lat
    ))).fold(
            (failure)  {
          setSucc(false);
          print(failure.massage);
        },
            (data)  async{
         print(data);
        });
  }

 */


