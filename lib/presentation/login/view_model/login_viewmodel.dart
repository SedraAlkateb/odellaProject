import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/login_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/common/freezed_data.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs ,LoginViewModelOutputs , ChangeNotifier{
  final LoginUseCase _loginUseCase ;
  LoginViewModel(this._loginUseCase);
  Authentication ?_authentication;
var loginObject=LoginObject("","");

setAuth(Authentication authentication){
  _authentication=authentication;
  notifyListeners();
}
bool success(){
  if(_authentication?.status==1){
    return true;
  }
  return false;
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

@override
  void dispose() {
  _authentication=null;
  loginObject=LoginObject("","");
  super.dispose();
  }
/*
  init()
  async {
    String deviceToken = await getDeviceToken();
    setFcmToken(deviceToken);
    print("//////////////////////////////////////////////////////");
    print(deviceToken);
    print("//////////////////////////////////////////////////////");
  }
  Future getDeviceToken() async
  {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? deviceToken = await firebaseMessaging.getToken();
    return (deviceToken == null) ? "" : deviceToken;
  }
 */
  @override
  void start() {
    // view model should tell view please show content state
    inputState.add(ContentState());
  //  init();
  }
  String fcmToken="";
  setFcmToken(String fcmToken1){
    fcmToken==fcmToken1;
    notifyListeners();

  }
  String getFcmToken(){
    return fcmToken;
  }

  //////////////////////////input////////////////////////
  login() async{
 inputState.add(LoadingState(stateRendererType: StateRendererType.popupLoadingState));

 ( await _loginUseCase.execute(
        LoginUseCaseInput(
            loginObject.userName, loginObject.password,getFcmToken()
        ))).fold(

            (failure)  {
              inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
        },
            (data)  async{
              // await _appPreferences.setToken();
            inputState.add(ContentState());
            setAuth(data);

            });
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