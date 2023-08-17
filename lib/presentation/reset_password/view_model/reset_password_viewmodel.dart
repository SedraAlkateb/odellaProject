import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/usecase/reset_password_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/common/freezed_data.dart';

class ResetPasswordViewModel extends BaseViewModel with ChangeNotifier{
  ResetPasswordUseCase _resetPasswordUseCase;
ResetPasswordViewModel(this._resetPasswordUseCase);
  var _resetPasswordObject=ResetPasswordObject("",0,"");
bool _succ=false;
bool getSuccses(){
  return  _succ;
}
setSuc(bool s){
  _succ =s;
  notifyListeners();
}
setEmail(String email){
  _resetPasswordObject= _resetPasswordObject.copyWith(email: email);

}
setNewPassword(String password){
  _resetPasswordObject= _resetPasswordObject.copyWith(newPassword: password);

}
setCode(int code){
  _resetPasswordObject= _resetPasswordObject.copyWith(code: code);

}
bool b=false;
 Future<bool> resetPassword() async{

    ( await _resetPasswordUseCase.execute(
        RestPasswordUseCaseInput(
            _resetPasswordObject.email, _resetPasswordObject.code,_resetPasswordObject.newPassword
        ))).fold(

            (failure)  {
              b=false;
              setMessage(failure.massage);
        },
            (data)  async{
              b=true;
              setMessage(data);
              setSuc(true);
        });
    return b;
  }
  @override
  setMessage(String m) {
notifyListeners();
return super.setMessage(m);
  }
  @override
  void start() {
    // TODO: implement start
  }
}