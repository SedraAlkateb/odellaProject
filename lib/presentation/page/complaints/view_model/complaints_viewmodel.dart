import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/evaluation_usecase.dart';
import 'package:untitled/domain/usecase/store_claim_usecase.dart';
import 'package:untitled/domain/usecase/weekly_trips_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/resources/language_manager.dart';

class ComplaintsViewModel extends BaseViewModel with ChangeNotifier{
  @override
  StoreClaimUseCase _claimUseCase;
  WeeklyTripUsecase _weeklyTripUsecase;
  EvaluationUseCase _evaluationUseCase;

  String _description="";
  int tripId=0;

  ComplaintsViewModel(this._claimUseCase,this._weeklyTripUsecase,this._evaluationUseCase);
  List<DataTrips> _trip=[];
  AppPreferences _appPreferences =instance<AppPreferences>();
  setTrip(List<DataTrips> trip){
    _trip=trip;
    search=trip;
    notifyListeners();
  }
 double ifEval(int tripIdd){
    for(int i=0;i<_eval.length;i++){
      if(_eval[i].idTrip==tripIdd){
        return  double.parse(_eval[i].review);
      }
    }
    return 0.0;
  }

  List<EvaluationTrip> _eval=[];
  setEval(List<EvaluationTrip> eval){
    _eval=eval;
    notifyListeners();
  }
  List<EvaluationTrip> getEval(){
    return _eval;
}
  List<DataTrips> getTrip(){
    return search;
  }
  setTripId(int id){
    tripId=id;
    notifyListeners();
  }
  String lang="";
String date(String d){
    if(lang== LanguageType.ENGLISH.getValue()){
      DateTime date = DateTime.parse(d);
      String formattedDate = DateFormat('EEEE, MMMM d, y', 'en_US').format(date);
      return formattedDate;
    }else{
      DateTime date = DateTime.parse(d);
      String formattedDate = DateFormat('EEEE, d MMMM, y', 'ar').format(date);
      return formattedDate;
    }


  }
  time(String d){
    if(lang==LanguageType.ENGLISH.getValue()){
// تحويل النص إلى كائن DateTime
      DateTime time = DateFormat('HH:mm:ss').parse(d);
// تنسيق الوقت باللغة الإنجليزية
      String formattedTime = DateFormat('HH:mm:ss', 'en_US').format(time);
      return formattedTime;

    }else {
      DateTime time = DateFormat('HH:mm:ss').parse(d);
      String formattedTime = DateFormat('HH:mm:ss', 'ar').format(time);
      return formattedTime;
    }
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
  @override
  setMessage(String m) {
  notifyListeners();
  return super.setMessage(m);
  }
  bool calim=false;
Future<bool>  storeClaim( int trip) async {

    (await _claimUseCase.execute(ClaimUseCaseInput(trip, getDescription())))
        .fold((failure) {
      calim=false;
      setMessage(failure.massage);
   //   inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
    }, (data)async {
          calim=true;
          notifyListeners();
    });
    return calim;
  }
  Future  getWeeklyTrip() async {
    setStateScreen(1);
    (await _weeklyTripUsecase.execute(null))
        .fold((failure) 
    {
      setMessage(failure.massage);
      setStateScreen(2);
    }, (data)async {
      lang =await _appPreferences.getAppLanguage();
      setTrip(data.weeklyTrip!.trips);
      setEval(data.weeklyTrip?.evaluation??[]);
      notifyListeners();
      setStateScreen(0);

    });
  }
  @override
  setStateScreen(int state) {
    notifyListeners();
    return super.setStateScreen(state);
  }
  @override
  void start() {
    getWeeklyTrip();
  }
bool b=false;
 Future<bool> evaluation(int r,int trip) async {
    //  inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _evaluationUseCase.execute(EvaluationUseCaseInput(trip, r)))
        .fold((failure) {
          b=false;
      setMessage(failure.massage);
    }, (data)async {
          b=true;

    });
    return b;
  }
  List<DataTrips> search =[];

  setSearch( String value){
    search= _trip.where(
            (element){
          final fName=element.time?.start.toLowerCase();
          final lName=element.time?.date.toLowerCase();
          final sear=value.toLowerCase();
          return fName!.contains(sear) ||
              lName!.contains(sear)  ;
        }).toList();

    notifyListeners();

  }

}