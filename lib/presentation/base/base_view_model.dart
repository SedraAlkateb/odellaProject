import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
//shared variables and function that be used through  any view models.

abstract class  BaseViewModel extends BaseViewModelInputs
     with BaseViewModeOutputs{

  final StreamController _inputStreamController =BehaviorSubject<FlowState>();//BehaviorSubject
@override
  void dispose() {
  _inputStreamController.close();
  }
  @override
  Sink get inputState => _inputStreamController.sink;
@override
  Stream<FlowState> get outputState => _inputStreamController.stream.map((flowState) => flowState);

}
abstract class BaseViewModelInputs{
  void start(); //  start view model job
void dispose();//will be call when view model dispose

Sink get inputState;
}
abstract class BaseViewModeOutputs{
  // will be implemented later
Stream<FlowState> get outputState;
}
