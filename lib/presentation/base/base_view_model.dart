import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
//shared variables and function that be used through  any view models.

abstract class  BaseViewModel extends BaseViewModelInputs
     with BaseViewModeOutputs{
int stateScreen=0;
int stateDialog=0;
  //final StreamController _inputStreamController =BehaviorSubject<FlowState>();//BehaviorSubject
@override
  void dispose() {
 // _inputStreamController.close();
  }
 // @override
 // Sink get inputState => _inputStreamController.sink;
//@override
 // Stream<FlowState> get outputState => _inputStreamController.stream.map((flowState) => flowState);
@override
int getStateScreen() {
  return stateScreen;
}
@override
  setDialog(int state) {
    stateDialog=state;
  }
  @override
  int getDialog() {
   return stateDialog;
  }
@override
setStateScreen(int state) {
 stateScreen=state;
}
}
abstract class BaseViewModelInputs{
  void start(); //  start view model job
void dispose();//will be call when view model dispose
  setStateScreen(int state);
  setDialog(int state);

//Sink get inputState;
}
abstract class BaseViewModeOutputs{
  // will be implemented later
  int  getStateScreen();
  int  getDialog();

 // Stream<FlowState> get outputState;
}
