
import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/programs_usecase.dart';
import 'package:untitled/domain/usecase/student_attendence_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';

class ProgramsViewModel extends BaseViewModel with ChangeNotifier{
  ProgramsUseCase _programsUseCase;
  StudentAttendenceUsecase _studentAttendenceUsecase;
  ProgramsViewModel(this._programsUseCase,this._studentAttendenceUsecase);
  List<DataProgram> _program=[];
  bool? b1=null;
  bool? b2=null;
  List<DataProgram> getProgram(){
  return _program;
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
    notifyListeners();
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