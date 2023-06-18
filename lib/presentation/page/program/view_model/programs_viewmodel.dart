
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/evaluation_usecase.dart';
import 'package:untitled/domain/usecase/programs_usecase.dart';
import 'package:untitled/domain/usecase/student_attendence_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';

import '../../../../lang/locale_keys.g.dart';

class ProgramsViewModel extends BaseViewModel with ChangeNotifier{
  ProgramsUseCase _programsUseCase;
  StudentAttendenceUsecase _studentAttendenceUsecase;
  EvaluationUseCase _evaluationUseCase;
  ProgramsViewModel(this._programsUseCase,this._studentAttendenceUsecase,this._evaluationUseCase);
  Map<int, List<DataProgram> > program2={};
  String selectedDay = 'Sat';
  int indexDay=0;
  List<String> weekDays = ['${LocaleKeys.Mon.tr()}', '${LocaleKeys.Tus.tr()}', '${LocaleKeys.Wed.tr()}', '${LocaleKeys.Thu.tr()}','${LocaleKeys.fri.tr()}','${LocaleKeys.Sat.tr()}', '${LocaleKeys.Sun.tr()}'];
  bool? b1=null;
  bool? b2=null;
  double _rating=0;
  List<String>getWeekDays(){
    return weekDays;
  }
  getDay(int i){
    return weekDays[i];
  }
  setSelectedDay(int i){
    selectedDay=weekDays[i];
    indexDay=i;
    notifyListeners();
  }
 String getSelectedDay(){
    return selectedDay;
  }
 int getIndexDay(){
    return indexDay;
  }
  setMap(List<DataProgram> p){
    for(int i=0;i<7;i++){
      program2[i] = [];
    }
    p.forEach((e) {
      if (e.day?.id == 1) {
        program2[0]?.add(e);
      }
      else if (e.day?.id == 2) {
        program2[1]?.add(e) ;
      }
      else if (e.day?.id == 3) {
        program2[2]?.add(e)  ;
      }
      else if (e.day?.id == 4) {
        program2[3]?.add(e)  ;
      }
      else if (e.day?.id == 5) {
        program2[4]?.add(e)  ;
      }
      else if (e.day?.id == 6) {
        program2[5]?.add(e) ;
      }
      else if (e.day?.id == 7) {
        program2[6]?.add(e) ;
      }
    }
    );
    notifyListeners();
  }
  bool getConfirm1(int index){
    return program2[index]![0].confirmAttendance1 ;
  }
List<DataProgram> getProgramDay(){
    return program2[indexDay] ??[] ;
}
   setConfirm1(int index,bool b){
    program2[index]![0].confirmAttendance1=b;
     b1=b;
     b2= program2[index]![0].confirmAttendance2;
    notifyListeners();
  }
  bool getConfirm2(int index){
    return program2[index]![0].confirmAttendance2 ;

  }
  setConfirm2(int index,bool b){
    program2[index]![0].confirmAttendance2=b;
    b2=b;
    b1= program2[index]![0].confirmAttendance1;
    notifyListeners();
  }
  bool b=true;
  setBool(bool id){
    b=id;
    notifyListeners();
  }
  bool getBool(){
    return b;
  }

  @override
  void start() {
program();
  }
  setRating(double r){
    _rating=r;

    notifyListeners();
  }
 double getRating(){
    return _rating;
  }
  program() async {
  //  inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _programsUseCase.execute(null))
        .fold((failure) {
    //  inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
    }, (data)async {
         setMap(data.dataProgram);
         setSelectedDay(5);
    //  inputState.add(ContentState());
      notifyListeners();
    });
  }
  evaluation(int r) async {
    //  inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _evaluationUseCase.execute(EvaluationUseCaseInput(13, r)))
        .fold((failure) {
      //  inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
    }, (data)async {

    });
  }
  confirmStudent() async {
    //  inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _studentAttendenceUsecase.execute(
        StudentAttendenceUseCaseInput(
            program2[indexDay]![0].id,
            confirmAttendance1: b1,
            confirmAttendance2: b2 )))
        .fold((failure) {
      //  inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
    }, (data)async {

      //  inputState.add(ContentState());
      notifyListeners();
    });
  }

}