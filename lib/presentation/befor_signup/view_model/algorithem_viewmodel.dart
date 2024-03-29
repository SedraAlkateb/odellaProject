import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/usecase/algorithm_usecas.dart';
import 'package:untitled/lang/local_keys.g.dart';
import 'package:untitled/presentation/base/base_view_model.dart';

class AlgorithmViewModel extends BaseViewModel with ChangeNotifier{
  List<String> _weekDays = ['${ LocaleKeys.Mon.tr()}', '${ LocaleKeys.Tus.tr()}', '${ LocaleKeys.Wed.tr()}', '${ LocaleKeys.Thu.tr()}','${ LocaleKeys.fri.tr()}','${ LocaleKeys.Sat.tr()}', '${ LocaleKeys.Sun.tr()}'];
  final List<String> _dropdownValues = ['07:00', '07:30', '08:00','08:30','09:00','09:30','10:00','10:30','11:00','11:30'];
  final List<String> _dropdownValues2 = ['12:00', '12:30', '13:00','13:30','14:00','14,:30','15:00','15:30','16:00'];
  List<String> goTimeInput=[];
  AlgorithmUseCase algorithmUseCase;
  AlgorithmViewModel(this.algorithmUseCase);
  List<String> returnTimeInput=[];
  List<int>day=[];
  String goTime="";
  String returnTime="";
  int index=1;
  setGoTime(String g){
    goTime=g;
    notifyListeners();
  }
  getIndex(){
    return index;
  }
  setReturnTime(String r){
    returnTime=r;
    notifyListeners();
  }
  setDayInput(){
    goTimeInput.add(goTime);
    returnTimeInput.add(returnTime);
    day.add(index);
  }
setIndex(int i){
    index=i+1;
    notifyListeners();
}
  List<String>  getWeekDay(){
    return _weekDays;
  }
  Map<String, dynamic> getmap(){
    return  {
      "day_ids": day,
      "goTimes": goTimeInput,
      "returnTimes": returnTimeInput,
    };
  }
  List<String> getGoTime(){
    return _dropdownValues;
  }
  List<String> returnTimeList(){
return _dropdownValues2;
  }
  @override

  void start() {
    // TODO: implement start
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
  bool b=false;
  Future<bool>  algorithm( ) async {

    (await algorithmUseCase.execute(getmap()))
        .fold((failure) {
      b=false;
      setMessage(failure.massage);
    }, (data)async {
      b=true;
      notifyListeners();
    });
    return b;
  }
}