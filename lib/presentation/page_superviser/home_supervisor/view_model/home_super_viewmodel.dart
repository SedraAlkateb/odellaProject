import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/data/network/pusher.dart';
import 'package:untitled/domain/usecase/home_supervisor_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:untitled/presentation/map_position/view_model/location_service.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:location/location.dart' as loc;
import 'package:untitled/domain/usecase/supervisor_update_position_usecase.dart';

class HomeSuperVisorViewModel extends BaseViewModel with ChangeNotifier{
  AppPreferences _appPreferences =instance<AppPreferences>();

  HomeSupervisorUseCase _homeSupervisorUseCase;
  SupervisorUpdatePositionUseCase _supervisorUpdatePositionUseCase;
  HomeSuperVisorViewModel(this._homeSupervisorUseCase,this._supervisorUpdatePositionUseCase);
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


  String _time="";
  String getTime(){
    return _time;
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
              if(data!=null){
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
  late  PusherClient pusherClient;
  late Channel channel;

  getPusherConnect(String  token){
    PusherOptions options = PusherOptions(
      host: PusherConfigration.hostEndPoint,
      auth: PusherAuth(PusherConfigration.hostAuthEndPoint
        , headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "Accept": "application/json"

        },

      ),
      wsPort: PusherConfigration.port,
      cluster:  PusherConfigration.cluster,
    );
    pusherClient = PusherClient(
      PusherConfigration.key,
      options,
      autoConnect:false,
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
  String t="";
  Future<void> _setupLocationStream(int tripId) async {
    final location = loc.Location() ;
    t= await  _appPreferences.getToken();

    _locationData = await LocationService().getLocation();
    try {
      // await LocationService().getPermission();
 //     getPusherConnect();
//      channel = pusherClient.subscribe("tracking.${12}");//${tripId};

      location.onLocationChanged.listen((LocationData newLocationData)async {
        if(newLocationData.longitude!=null && newLocationData.latitude!=null) {
          await  getPusherConnect(t);
          channel = pusherClient.subscribe("private-tracking.${tripId}");
          channel.trigger("tracking", {"lng":99.00,"lat":99.00});
        /*
          supervisorPosition(
              tripId, newLocationData.longitude!, newLocationData.latitude!);
         */



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

}