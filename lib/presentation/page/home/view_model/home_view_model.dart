import 'package:flutter/material.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:untitled/app/extentions.dart';
import 'package:untitled/data/network/pusher.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/position_line_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';

import '../../../../domain/usecase/transportation_lines_usecase.dart';

class HomeViewModel extends BaseViewModel with ChangeNotifier{
  final TransportationLinesUseCase _transportationLinesUseCase;
  final PositionLineUseCase _positionLineUseCase;

  HomeViewModel(this._transportationLinesUseCase,this._positionLineUseCase);
  List<DataTransportationLines> dataTransportationLines=[];
  List<DataTransportationLines> dataTransportationLinesSearch=[];
  List<DataTransferPositions> _position=[];
  var _line;
  bool _isLog=false;
  bool isPos=false;
  void setIsPos(bool isLog1){
    isPos =isLog1;
    notifyListeners();
  }
  bool getIsPos(){
    return isPos;
  }
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
  setStateScreen(int state) {
    notifyListeners();
    return super.setStateScreen(state);
  }
  @override
  setDialog(int state) {
    notifyListeners();
    return super.setDialog(state);
  }
  @override
  void start() {
    getTransportationLinesData();
    //  inputState.add(ContentState());
  }
/////////////////set/////////
  setPosition( List<DataTransferPositions> posit){
    _position=posit;
    notifyListeners();
  }
  ////////////////get/////////////
  List<DataTransferPositions> getPosition(){
    return _position;
  }
  /////////////////////////async
  getTransportationLinesData()async{
    setStateScreen(1);
    ( await _transportationLinesUseCase.execute(null))
        .fold(
            (failure)  {
              setStateScreen(2);
            },
            (data)  {
              if(data.dataTransportationLines==null){
                setStateScreen(3);
              }else{
                setStateScreen(0);
              }
              setIsLog(true);
              dataTransportationLines=data.dataTransportationLines;
          dataTransportationLinesSearch=data.dataTransportationLines;

        //  notifyListeners();
        });

  }


  getPositionLineData(int id)async{
    setStateScreen(1);
    ( await _positionLineUseCase.execute(id))
        .fold(
            (failure)  {
              setStateScreen(2);
            },
            (data)  {
             // setStateScreen(0);
              isPos=true;
          setPosition(data.positionLine);
        });

  }


}