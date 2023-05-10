
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
  List<DataProgram> getProgram(){
  return _program;
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
  confirmStudent(bool b) async {
    //  inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _studentAttendenceUsecase.execute(StudentAttendenceUseCaseInput(_program[getIndex()].id, b)))
        .fold((failure) {
      //  inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
    }, (data)async {

      //  inputState.add(ContentState());
      notifyListeners();
    });
  }

}