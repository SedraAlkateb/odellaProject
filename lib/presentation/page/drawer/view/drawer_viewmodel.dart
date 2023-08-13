import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';
import 'package:untitled/domain/usecase/logout_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';

class DrawerViewModel  with ChangeNotifier{
  LogoutUseCase _logoutUseCase;

  DrawerViewModel(this._logoutUseCase);
int isSucc=0;
@override
  void dispose() {
  isSucc=0;
  }
bool isSuccess(){
    if(isSucc==1){
      return true;
    }
    else{
      return false;
    }
}
bool s=false;
Future<bool>  logout() async{
 //   inputState.add(LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    ( await _logoutUseCase.execute(
        null)).fold(

            (failure)  {
              s=false;
          //        inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
        },
            (data)  async{
              s=true;
              isSucc=data.status ?? 0;
              notifyListeners();
           });
return s;
  }
}