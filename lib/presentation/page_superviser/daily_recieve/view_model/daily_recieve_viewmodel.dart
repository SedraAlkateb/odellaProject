import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/daily_reservations_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/domain/usecase/approve_usecase.dart';
import 'package:untitled/domain/usecase/deny_usecase.dart';

class DailyReservationsViewModel extends BaseViewModel with ChangeNotifier{
  DailyReservationUseCase _dailyReservationUseCase;
  ApproveUseCase _approveUseCase;
  DenyUseCase _denyUseCase;
  DailyReservationsViewModel(this._dailyReservationUseCase,this._approveUseCase,this._denyUseCase);
  List<DailyReservationsModel> _dailyReservations=[];
  int tripID=0;
  @override
  void start() {
  }
  setTripId(int id){
    tripID=id;
    notifyListeners();
  }

  setDailyReservations(List<DailyReservationsModel> dR){
    _dailyReservations= dR;
  //  notifyListeners();
  }
  List<DailyReservationsModel> getDailyReservations(){
    print(_dailyReservations.length);
    return _dailyReservations;
  }
  dailyReservation(int id) async{
    setStateScreen(1);
    ( await _dailyReservationUseCase.execute(id)).fold(

            (failure)  {
              setStateScreen(2);
              print(failure.massage);
        },
            (data)  async{
              if(data.dailyReservationsModel?.length==0){
                setStateScreen(3);
              }else{
                setStateScreen(0);
                setDailyReservations(data.dailyReservationsModel ??[]);
              }
        });
  }

  approve(int id) async{

    ( await _approveUseCase.execute(id)).fold(

            (failure)  {
          print(failure.massage);
        },
            (data)  async{
          print("succsec");
        });
  }
  deny(int id) async{

    ( await _denyUseCase.execute(id)).fold(

            (failure)  {
          print(failure.massage);
        },
            (data)  async{
          print("succsec");
        });
  }
  @override
  setDialog(int state) {
    notifyListeners();
    return super.setDialog(state);
  }
  @override
  setStateScreen(int state) {
    notifyListeners();
    return super.setStateScreen(state);
  }
}