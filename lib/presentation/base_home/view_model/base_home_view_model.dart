import 'package:flutter/material.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/position_line_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import '../../../../domain/usecase/transportation_lines_usecase.dart';

class BaseHomeViewModel extends BaseViewModel with ChangeNotifier{
  final TransportationLinesUseCase _transportationLinesUseCase;
  final PositionLineUseCase _positionLineUseCase;

  BaseHomeViewModel(this._transportationLinesUseCase,this._positionLineUseCase);
  List<DataTransportationLines> dataTransportationLines=[];
  List<DataTransportationLines> dataTransportationLinesSearch=[];
  List<From> _position=[];
  var _line;
  bool _isLog=false;
  bool isPos=false;
  void setIsLog(bool isLog1){
    _isLog =isLog1;
    notifyListeners();
  }
  bool getIsLog(){
    return _isLog;
  }
  int getIdLine(int index){
    return dataTransportationLines[index].id;
  }
  String getNameLine(int index){
    return dataTransportationLines[index].name;
  }
  String getFromLine(int index){
    return dataTransportationLines[index].from!.name;
  }
  String getToLine(int index){
    return dataTransportationLines[index].to!.name;
  }
  setLine(DataTransportationLines line){
    _line=line;
  }
  DataTransportationLines  getLine(){
    return _line;
  }
  ///////////Function
  setSearch( String value){
    dataTransportationLinesSearch= dataTransportationLines.where(
            (element){
          final tit=element.name.toLowerCase();
          final sear=value.toLowerCase();
          return   tit.contains(sear);
        }).toList();
    notifyListeners();

  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  void start() {
    getTransportationLinesData();
    //  inputState.add(ContentState());
  }
/////////////////set/////////
  setPosition( List<From> posit){
    _position=posit;
    notifyListeners();
  }
  ////////////////get/////////////
  List<From> getPosition(){
    return _position;
  }
  /////////////////////////async
  getTransportationLinesData()async{
    //  inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
    ( await _transportationLinesUseCase.execute(null))
        .fold(
            (failure)  {
          //     inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.massage));
        },
            (data)  {
          dataTransportationLines=data.dataTransportationLines;
          dataTransportationLinesSearch=data.dataTransportationLines;
          setIsLog(true);
          //      inputState.add(ContentState());
          notifyListeners();
        });

  }


  getPositionLineData(int id)async{
//    inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
    ( await _positionLineUseCase.execute(id))
        .fold(
            (failure)  {
          //      inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.massage));
        },
            (data)  {
          //    inputState.add(ContentState());
          setPosition(data.positionLine);

          print(data.positionLine.first.name);
          //       inputState.add(ContentState());
          isPos=true;
          notifyListeners();
        });

  }


}