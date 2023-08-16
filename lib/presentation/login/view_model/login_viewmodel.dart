import 'dart:async';
import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/login_usecase.dart';
import 'package:untitled/domain/usecase/refresh_usecase.dart';

import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/common/freezed_data.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs ,LoginViewModelOutputs , ChangeNotifier{
  final LoginUseCase _loginUseCase ;
  final RefreshUseCase _refreshUseCase;
  LoginViewModel(this._loginUseCase,this._refreshUseCase);
  Authentication ?_authentication;
var loginObject=LoginObject("","");
int status=0;
String message="";
String getMessage()
{
  return message;
}
setAuth(Authentication authentication){
  _authentication=authentication;
  notifyListeners();
}
bool success(){
  if(status==1){
    return true;
  }
  return false;
}
setSuc(int s){
  status=s;
  notifyListeners();
}
Authentication? getAuth(){
  return _authentication;
}
String? getRole(){
  return _authentication?.userData?.userModel?.roleModel.first.name.toString();
}
  bool ifStudent(){
    return _authentication?.userData?.userModel?.roleModel.first.name == "student";
  }
  String? getToken(){
    return  _authentication?.userData?.access_token;
  }



  init()
  async {
    String deviceToken = await getDeviceToken();
    fcmToken=deviceToken;
    print("***********************************************");
    print(fcmToken);
    print("//////////////////////////////////////////////////////");
  }
  Future getDeviceToken() async
  {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? deviceToken = await firebaseMessaging.getToken();
    return (deviceToken == null) ? "" : deviceToken;
  }

  @override
  void start() {
    // view model should tell view please show content state
    //inputState.add(ContentState());
  }
  String fcmToken="";
  setFcmToken(String fcmToken1){
    fcmToken==fcmToken1;
    notifyListeners();

  }
  String getFcmToken(){
    return fcmToken;
  }
  setMessage(String m){
    message=m;
    notifyListeners();
  }
bool s=false;
  //////////////////////////input////////////////////////
 Future<bool> login() async{
 //inputState.add(LoadingState(stateRendererType: StateRendererType.popupLoadingState));

 ( await _loginUseCase.execute(
        LoginUseCaseInput(
            loginObject.userName, loginObject.password,fcmToken
        ))).fold(

            (failure)  {
              if(failure.code==422){
                print("object");
              }
              s= false;
              setMessage(failure.massage);
              //inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
        },
            (data)  async{
            //  setSuc(1);
              // await _appPreferences.setToken();
           //inputState.add(ContentState());
            setAuth(data);
            s= true;
            });
 return s;
 }
 Future<String?> refresh() async{

    ( await _refreshUseCase.execute(null)).fold(
            (failure)  {
        },
            (data)  async{
              return await data.userData?.access_token;
        });
  }
  void scheduleTokenRefresh() {
    final AppPreferences _appPreferences =instance<AppPreferences>();

    String token="";
    Timer.periodic(Duration(hours: 1), (timer) async {
    token =(await refresh())!;
    _appPreferences.setToken(token);
    });
  }
@override
  void dispose() {
    super.dispose();
  }


  @override
  setPassword(String password) {
    loginObject= loginObject.copyWith(password: password);
  }

  @override
  setUserName(String userName) {
    loginObject=loginObject.copyWith(userName: userName);
  }
/////////////////////////output//////////////////////////

  @override
  bool isPasswordValid() {
   return loginObject.password.isNotEmpty;

  }

  @override
  bool isUserValid() {
 return loginObject.userName.isNotEmpty;
  }
  bool areAllInputsValid(){
    return isPasswordValid()&&
        isUserValid();
  }
}

////////////////////////////////////////




abstract class LoginViewModelInputs {
  setUserName(String userName);
  setPassword(String password);
  login();
}
abstract class LoginViewModelOutputs {
  bool isPasswordValid();
  bool isUserValid();


}