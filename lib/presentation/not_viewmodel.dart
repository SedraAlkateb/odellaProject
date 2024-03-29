import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/not_read_all_usecase.dart';
import 'package:untitled/domain/usecase/not_read_by_id_usecase.dart';
import 'package:untitled/domain/usecase/notification_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';

class Not extends BaseViewModel with ChangeNotifier {
  NotificationUseCase _notificationUseCase;
  ReadAllNotificationUseCase _readAllNotificationUseCase;
  ReadNotificationByIdUseCase _notificationByIdUseCase;

  Not(this._notificationUseCase,this._readAllNotificationUseCase,this._notificationByIdUseCase);

  int count = 0;
  late String title;
  late String body;
  int index=0;

  List<RemoteMessage> _messages = [];
  updateMassages(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _messages = [..._messages, message];
      updateInc();
      notifyListeners();
    });
  }

  List<RemoteMessage>  getMessage(){
    return _messages;
  }
  int getMessageL(){
    return  _messages.length;
  }
  RemoteMessage getMessageIndex(int messageIndex){
    return _messages[messageIndex];
  }


  List<NotificationModel> _notifications=[];
  setCount(int i) {
    count = i;
    notifyListeners();
  }
 setIndex(int i){
    index=i;
    notifyListeners();
}
int getIndex(){
    return index;
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
  setNotification(List<NotificationModel> notifications) {
    _notifications=notifications;
    notifyListeners();
  }

  List<NotificationModel>  getNotification() {
    return _notifications;
  }
  NotificationModel  getNotification1() {
    return _notifications[index];
  }
  setBody(String i) {
    body = i;
    //notifyListeners();
  }

  String getBody() {
    return body;
  }

  getAllNotificationsLogin() async{
    setStateScreen(1);

    ( await _notificationUseCase.execute(null)).fold(
            (failure)  {
          setStateScreen(2);
        },
            (data)  async{
          setStateScreen(0);

          setNotification(data.notification!);
        });
  }
  getNotificationRead(int id)
  async{

    ( await _notificationByIdUseCase.execute(id)).fold(
            (failure)  {
        },
            (data)  async{

              return 1;
        });
    notifyListeners();
  }
  getAllNotificationRead()
  async{
    ( await _readAllNotificationUseCase.execute(null)).fold(
            (failure)  {
        },
            (data)  async{
              start();
        });


  }

@override
  setStateScreen(int state) {
    notifyListeners();
    return super.setStateScreen(state);
  }
  @override
  void start() {
    getAllNotificationsLogin();
  }
  }


