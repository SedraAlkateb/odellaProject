import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/store_claim_usecase.dart';
import 'package:untitled/domain/usecase/weekly_trips_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';

class ComplaintsViewModel extends BaseViewModel with ChangeNotifier{
  @override
  StoreClaimUseCase _claimUseCase;
  WeeklyTripUsecase _weeklyTripUsecase;
  String _description="";
  int tripId=0;
  ComplaintsViewModel(this._claimUseCase,this._weeklyTripUsecase);
  List<DataTrips> _trip=[];

  setTrip(List<DataTrips> trip){
    _trip=trip;
    notifyListeners();
  }
  List<DataTrips> getTrip(){
    return _trip;
  }
  setTripId(int id){
    tripId=id;
    notifyListeners();
  }
 int getTripId(){
    return tripId;
  }
  String getDescription(){
    return _description;
  }
  setDescription(String d){
    _description=d;
    notifyListeners();
  }
Future  storeClaim() async {
   // inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _claimUseCase.execute(ClaimUseCaseInput(28, getDescription())))
        .fold((failure) {
   //   inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
    }, (data)async {

          notifyListeners();
    });
  }
  Future  getWeeklyTrip() async {
    // inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _weeklyTripUsecase.execute(null))
        .fold((failure) {
      //   inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
    }, (data)async {
      setTrip(data.dataTrips!);
      notifyListeners();
    });
  }

  @override
  void start() {
    getWeeklyTrip();
  }
}