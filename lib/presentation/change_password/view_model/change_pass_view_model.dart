import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/usecase/update_supervisor_password_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/common/freezed_data.dart';

class ChangePasswordViewModel extends BaseViewModel with ChangeNotifier{
  final UpdateSupervisorPasswordUseCase _updatePasswordUseCase;
ChangePasswordViewModel(this._updatePasswordUseCase);
  ChangePasswordObject changePasswordObject=ChangePasswordObject("", "", "");
  @override
  void start() {
    // TODO: implement start
  }
  setNewPassword(String string) {
    changePasswordObject = changePasswordObject.copyWith(newPassword: string);
  }

  setOldPassword(String string) {
    changePasswordObject = changePasswordObject.copyWith(oldPassword: string);
  }

  setNewPasswordConfirmation(String string) {
    changePasswordObject = changePasswordObject.copyWith(newPassword_confirmation: string);
  }

  int id=0;
 int  getId(){
    return id;
  }
@override
  setMessage(String m) {
notifyListeners();
return super.setMessage(m);
  }
  @override
  setStateScreen(int state) {
    notifyListeners();
    return super.setStateScreen(state);
  }
  setId(int i){
   id=i;
   notifyListeners();
  }
  bool b=false;
 Future<bool> updatePassword() async {
  setStateScreen(1);
    (await _updatePasswordUseCase.execute(UpdatePasswordUseCaseInput(
      getId(),
      changePasswordObject.oldPassword ,
      changePasswordObject.newPassword,
      changePasswordObject.newPassword_confirmation ,
    )))
        .fold((failure) {
          b=false;
      setMessage(failure.massage);
      setStateScreen(2);
    }, (data) {
          b=true;
      setStateScreen(0);
      print("object");
      notifyListeners();
    });
    return b;
  }

}