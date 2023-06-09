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
  var lostItem=LostItemObject(0,"",null);
  List<DataTrips> _trip=[];
  setImageFromGallory()async{
    lostItem= lostItem.copyWith(image: await pickImage());
    notifyListeners();
  }
  File? getImage(){
    return lostItem.image;
  }
setTrip(List<DataTrips> trip){
    _trip=trip;
    notifyListeners();
}
  List<DataTrips> getTrip(){
    return _trip;
}
  String getDescription(){
    return lostItem.description;
  }
  setDescription(String d){
    lostItem= lostItem.copyWith(description:d);
    notifyListeners();
  }

  int getTripId(){
    return lostItem.tripId;
  }
  setTripId(int d){
    lostItem= lostItem.copyWith(tripId:d);
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
        lostItem.tripId, lostItem.description,image:  lostItem.image)))
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

      print(data.weeklyTrip!.trips[0].availableSeats);
          setTrip(data.weeklyTrip!.trips);
      notifyListeners();
    });
  }

  @override
  void start() {
    getWeeklyTrip();
  }
}