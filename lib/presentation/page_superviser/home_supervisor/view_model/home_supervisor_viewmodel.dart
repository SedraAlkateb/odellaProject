import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/usecase/home_supervisor_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
class HomeSuperVisorViewModel extends BaseViewModel with ChangeNotifier{

  HomeSupervisorUseCase _homeSupervisorUseCase;
  HomeSuperVisorViewModel(this._homeSupervisorUseCase);
  @override
  void start() async{
//   await setTime();
    homeSupervisor();
  }
String _time="";
 String getTime(){
    return _time;
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
  //////////////////////////input////////////////////////
  homeSupervisor() async{

    ( await _homeSupervisorUseCase.execute(await getLocalTime())).fold(

            (failure)  {

              print(failure.massage);
            },
            (data)  async{
              print(data.dataHomeSupervisor?.id);

        });
  }
}