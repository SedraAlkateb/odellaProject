import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/home_supervisor_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
class HomeSuperVisorViewModel extends BaseViewModel with ChangeNotifier{

  HomeSupervisorUseCase _homeSupervisorUseCase;
  HomeSuperVisorViewModel(this._homeSupervisorUseCase);
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
          setHomeSuperVisor(data.dataHomeSupervisor!);
        });
  }
}