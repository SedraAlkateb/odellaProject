import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/usecase/logout_usecase.dart';


class DrawerSupervisorViewModel  with ChangeNotifier{
  LogoutUseCase _logoutUseCase;

  DrawerSupervisorViewModel(this._logoutUseCase);
int isSucc=0;
@override
  void dispose() {
  isSucc=0;
    super.dispose();
  }
bool isSuccess(){
    if(isSucc==1){
      return true;
    }
    else{
      return false;
    }
}
  logout() async{
 //   inputState.add(LoadingState(stateRendererType: StateRendererType.popupLoadingState));

    ( await _logoutUseCase.execute(
        null)).fold(

            (failure)  {
          //        inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
        },
            (data)  async{
              isSucc=data.status ?? 0;
              notifyListeners();
           });

  }
}