import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/weekly_trips_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/domain/usecase/store_lost_usecase.dart';
import 'package:untitled/presentation/common/freezed_data.dart';
import 'package:untitled/presentation/common/image/image.dart';

class AddLostItemViewModel extends BaseViewModel with ChangeNotifier{
  @override
  StoreLostUseCase _storeLostUseCase;
  WeeklyTripUsecase _weeklyTripUsecase;
  AddLostItemViewModel(this._storeLostUseCase,this._weeklyTripUsecase);
  String massage="";
  var signUpObject=LostItemObject(3,"asddassad",null);
  List<DataTrips> _trip=[];
  setImageFromGallory()async{
    signUpObject= signUpObject.copyWith(image: await pickImage());
    notifyListeners();
  }
  File? getImage(){
    return signUpObject.image;
  }
setTrip(List<DataTrips> trip){
    _trip=trip;
    notifyListeners();
}
  List<DataTrips> getTrip(){
    return _trip;
}
  String getDescription(){
    return signUpObject.description;
  }
  setDescription(String d){
    signUpObject= signUpObject.copyWith(description:d);
    notifyListeners();
  }

  int getTripId(){
    return signUpObject.tripId;
  }
  setTripId(int d){
    signUpObject= signUpObject.copyWith(tripId:d);
    notifyListeners();
  }
  setMasege(String m){
    massage=m;
    notifyListeners();
  }
  getMasege(){
   return massage;
  }
  Future  storeClaim() async {
    // inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
    setMasege("Loading...");
    (await _storeLostUseCase.execute(LostUseCaseInput(
//signUpObject.tripId
        3, signUpObject.description,image:  signUpObject.image)))
        .fold((failure) {
      setMasege(failure.massage);
      //   inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
    }, (data)async {
          setMasege(data);
      notifyListeners();
    });
  }
  Future  getWeeklyTrip() async {
    // inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _weeklyTripUsecase.execute(null))
        .fold((failure) {
      //   inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
    }, (data)async {
      print("data.dataTrips![0].availableSeats ??0");

      print(data.dataTrips![0].availableSeats);
          setTrip(data.dataTrips!);
      notifyListeners();
    });
  }

  @override
  void start() {
    getWeeklyTrip();
  }
}