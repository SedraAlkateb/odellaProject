import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/usecase/forget_password_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';

import '../../../lang/locale_keys.g.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ChangeNotifier{

  final ForgetPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordViewModel(this._forgotPasswordUseCase);

  String _email = "";
  String _massage="LocalKey.forgetMessage.tr()";
bool _rest=false;
  // input
  @override
  void start() {

  }
 String getEmail(){
    return _email;
  }
  setEmail(String e){
    _email=e;
    notifyListeners();
  }
  setStringMassage(String m){
    _massage=m;
    notifyListeners();
  }
  getMassage(){
    return _massage;
  }
 bool getRest(){
return _rest;
  }
  setRest(bool rest){
    _rest=rest;
    notifyListeners();
  }
  @override
  forgotPassword() async {

    (await _forgotPasswordUseCase.execute(getEmail())).fold((failure) {
      print(failure.massage);
      setStringMassage(failure.massage+"LocaleKeys.forgetMessageError");
    }, (supportMessage) {
      print(supportMessage);

      setStringMassage(supportMessage+"LocaleKeys.forgetMessageError");
      notifyListeners();
      setRest(true);

    // setStringMassage(supportMessage);
    });
  }




  @override
  void dispose() {
   }


}
