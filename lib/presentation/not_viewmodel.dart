import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/usecase/notification_usecase.dart';

class Not extends ChangeNotifier {
  //NotificationUseCase _notificationUseCase;
  //Not(this._notificationUseCase,this.count);
  int count = 0;
  late String title;
  late String body;
  setCount(int i) {
    count = i;
    notifyListeners();
  }

  int getCount() {
    return count;
  }

  updateInc() {
    count = count + 1;
  }

  updateDec() {
    count = count - 1;
  }
  setTitle(String i) {
    title = i;
    notifyListeners();
  }

  String getTitle() {
    return title;
  }
  setBody(String i) {
    body = i;
    //notifyListeners();
  }

  String getBody() {
    return body;
  }

  // getAllNotificationsLogin()
  // async{
  //   //   inputState.add(LoadingState(stateRendererType: StateRendererType.popupLoadingState));
  //
  //   ( await _notificationUseCase.execute(null)).fold(
  //           (failure)  {
  //         //  inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
  //       },
  //           (data)  async{
  //         // await _appPreferences.setToken();
  //         //    inputState.add(ContentState());
  //         setLost(data);
  //       });
  }


