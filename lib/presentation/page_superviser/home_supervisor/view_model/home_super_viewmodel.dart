import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/data/network/pusher.dart';
import 'package:untitled/domain/usecase/confirm_qr_usecase.dart';
import 'package:untitled/domain/usecase/home_supervisor_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:untitled/presentation/map_position/view_model/location_service.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:location/location.dart' as loc;
//import 'package:untitled/domain/usecase/supervisor_update_position_usecase.dart';

class HomeSuperVisorViewModel extends BaseViewModel with ChangeNotifier{
  ConfirmQrUseCase _confirmQrUseCase;
  HomeSupervisorUseCase _homeSupervisorUseCase;
//  SupervisorUpdatePositionUseCase _supervisorUpdatePositionUseCase;
  HomeSuperVisorViewModel(this._homeSupervisorUseCase,this._confirmQrUseCase);
  List<User>search =[];
  bool _succ=false;
 bool getSucc(){
    return _succ;
  }
  setSucc(bool s){
   _succ=s;
  }

  @override
  void start() async{
//   await setTime();
    homeSupervisor();

  }
cancelTrip(){
  channel.cancelEventChannelStream();
  pusherClient.disconnect();
}
@override
  void dispose() {
   channel.cancelEventChannelStream();
  pusherClient.disconnect();
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

  late DataHomeSupervisor _homeSuperVisor;
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
    setSucc(false);
    ( await _homeSupervisorUseCase.execute(await getLocalTime())).fold(
            (failure)  {
              setSucc(false);
          print(failure.massage);
        },
            (data)  async{
              if(data.dataHomeSupervisor!=null &&data.dataHomeSupervisor!.id!=0){
                await  setHomeSuperVisor(data.dataHomeSupervisor!);
                _setupLocationStream(data.dataHomeSupervisor!.id);
              }
        });
  }
  LocationData? _locationData;

  String? _error;
  int tripId=0;
setLocation(LocationData? newLocationData, String? error){
  _locationData = newLocationData;
  _error = error;
  notifyListeners();
}
LocationData? getLocationData(){
  return _locationData;
}
String? getError(){
  return _error;
}
PusherTrip _pusherTrip=instance<PusherTrip>();
  late  PusherClient pusherClient;
  late Channel channel;

  Future<void> _setupLocationStream(int tripId) async {
    final location = loc.Location() ;
    _locationData = await LocationService().getLocation();
    try {
      location.onLocationChanged.listen((LocationData newLocationData)async {
        if(newLocationData.longitude!=null && newLocationData.latitude!=null) {
          pusherClient= await  _pusherTrip.createPusherClient();
          channel = pusherClient.subscribe("private-tracking.${tripId}");
          channel.trigger("tracking", {"lng":99.00,"lat":99.00});
        }
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