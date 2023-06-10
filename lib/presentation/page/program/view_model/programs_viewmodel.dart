
import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/evaluation_usecase.dart';
import 'package:untitled/domain/usecase/programs_usecase.dart';
import 'package:untitled/domain/usecase/student_attendence_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';

class ProgramsViewModel extends BaseViewModel with ChangeNotifier{
  ProgramsUseCase _programsUseCase;
  StudentAttendenceUsecase _studentAttendenceUsecase;
  EvaluationUseCase _evaluationUseCase;
  ProgramsViewModel(this._programsUseCase,this._studentAttendenceUsecase,this._evaluationUseCase);
  List<DataProgram> _program=[];
  List<String> _weekDays =[];
  // ["StringsManager.Friday",StringsManager.sat, StringsManager.sun, StringsManager.mon, StringsManager.tus, StringsManager.wed, StringsManager.thu];
  int _line=1;
  bool? b1=null;
  bool? b2=null;
  double _rating=0;
  int pos=0;
  String selectedDay= StringsManager.sat;
  setPos(int p){
    pos=p;
    selectedDay=_weekDays[pos];
    notifyListeners();
  }
  getSelectedDay(){
    return selectedDay;
  }
  getPos(){
    return pos;
  }
  List<DataProgram> getProgram(){
  return _program;
}
setWeekDays(List<DataProgram> program){
   for(int i=0;i<program.length;i++){
     _weekDays.add(program[i].day);
   }
   notifyListeners();
}
getWeekDays(){
return _weekDays;
}
  bool getConfirm1(int index){
    return _program[index].confirmAttendance1 ;
  }

   setConfirm1(int index,bool b){
    _program[index].confirmAttendance1=b;
     b1=b;
     b2= _program[index].confirmAttendance2;
    notifyListeners();
  }
  bool getConfirm2(int index){
    return _program[index].confirmAttendance2 ;

  }
  setConfirm2(int index,bool b){
    _program[index].confirmAttendance2=b;
    b2=b;
    b1= _program[index].confirmAttendance1;
    notifyListeners();
  }
setProgram(List<DataProgram> program1){
    _program=program1;
    _line=_program.length;
    setWeekDays(_program);
    notifyListeners();
}
getLine(){
    return _line;
}

int index=0;
  setIndex(int id){
    index=id;
    notifyListeners();
  }
 int getIndex(){
    return index;
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
          setProgram(data.dataProgram);
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
            _program[getIndex()].id,
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