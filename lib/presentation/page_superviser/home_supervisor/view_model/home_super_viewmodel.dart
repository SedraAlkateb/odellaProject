import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:untitled/app/di.dart';
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
  List<User>search =[];
  int _position=0;
  bool _succ=false;
 bool getSucc(){
    return _succ;
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
  confirmQr(int id) async{
    print(id);
    ( await _confirmQrUseCase.execute(
        ConfirmQrUseCaseInput(
            id,_homeSuperVisor.id
        ))).fold(

            (failure)  {
        },
            (data)  async{
        });
  }
setAllUser(){
    search=_homeSuperVisor.users??[];
    notifyListeners();
}
  studentPosition(int positionId) async{
    ( await _studentPositionUseCase.execute(
        StudentPositionUseCaseInput(
            _homeSuperVisor.id,positionId
        ))).fold(

            (failure)  {
        },
            (data)  async{
              search=data.users;
              notifyListeners();
        });
  }

  late DataHomeSupervisor _homeSuperVisor;
  List<DataTransferPositions> positions=[];
  List<DataTransferPositions> getPositions(){
    return positions;
  }
  setPositions(List<DataTransferPositions> pos){
    pos=positions;
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
          final fName=element.lastName.toLowerCase();
          final lName=element.firstName.toLowerCase();
          final phone=element.phoneNumber.toLowerCase();
          final email =element.email.toLowerCase();
          final sear=value.toLowerCase();
          return fName.contains(sear) ||
              lName.contains(sear)  ||
              phone.contains(sear) ||
              email.contains(sear) ;
        }).toList()??[];
    notifyListeners();

  }
  List<User> getUser(){
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
              setStateScreen(2);
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