import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/domain/usecase/user_daily_reservations_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/common/freezed_data.dart';
import 'package:untitled/presentation/daily_recerviton/view_model/daily_reservation%20_viewmodel.dart';

class DailyReservationMapViewModel extends BaseViewModel with ChangeNotifier{
  @override
  void start() {
    // TODO: implement start
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  setMessage(String m) {
    notifyListeners();
    return super.setMessage(m);
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
  var signUpObject=DailyReservationObject(0,"",0,0,0,"gg");
 final UserDailyReservationsUseCase _dailyReservationUseCase;
  DailyReservationMapViewModel(this._dailyReservationUseCase);
  int selectedValue=1;
  setSelectedValue(int index){
    selectedValue=index;
    signUpObject= signUpObject.copyWith(transfer_position_id: index);
    notifyListeners();
  }

 int getSelectedValue(){
    return selectedValue;
  }

  setName(String firstName){
    signUpObject= signUpObject.copyWith(name: firstName);
    notifyListeners();
  }
  setPhone(int phone){
    signUpObject= signUpObject.copyWith(phone: phone);
    notifyListeners();
  }
  setSeat(int seat){
    signUpObject= signUpObject.copyWith(seet: seat);
    notifyListeners();
  }
  setPosition(int pos){
    signUpObject= signUpObject.copyWith(transfer_position_id: pos);
    notifyListeners();
  }
  setTrip(int trip){
    signUpObject= signUpObject.copyWith(tripId: trip);

  }

  setFcm(String fcm){
    signUpObject= signUpObject.copyWith(fcm_token: fcm);
  }
  bool s=false;
  Future<bool> getDailyReservation()async{
    setDialog(1);
    ( await _dailyReservationUseCase.execute(
        DailyReservationUseCaseInput(signUpObject.tripId, signUpObject.name, signUpObject.phone, signUpObject.transfer_position_id, signUpObject.seet,
            signUpObject.fcm_token)
    ))
        .fold(
            (failure)  {
          s=false;
          setMessage(failure.massage);
        },
            (data)  {
          s=true;
          notifyListeners();
        });
    return s;
  }

}