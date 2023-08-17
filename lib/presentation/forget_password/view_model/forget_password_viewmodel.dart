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
  @override
  setMessage(String m) {
    notifyListeners();
    return super.setMessage(m);
  }
 String getEmail(){
    return _email;
  }
  setEmail(String e){
    _email=e;
    notifyListeners();
  }

 bool getRest(){
return _rest;
  }
  setRest(bool rest){
    _rest=rest;
    notifyListeners();
  }
  bool b=false;
  @override
 Future<bool> forgotPassword() async {
    (await _forgotPasswordUseCase.execute(getEmail())).fold((failure) {
      print(failure.massage);
      setMessage(failure.massage);
      b=false;
    }, (supportMessage) {
      print(supportMessage);
      setMessage(supportMessage);
      notifyListeners();
      setRest(true);
      b=true;

    // setStringMassage(supportMessage);
    });
    return b;
  }




  @override
  void dispose() {
   }


}
