import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/daily_reservations_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/domain/usecase/approve_usecase.dart';
import 'package:untitled/domain/usecase/deny_usecase.dart';

class DailyReservationsViewModel extends BaseViewModel with ChangeNotifier{
  DailyReservationUseCase _dailyReservationUseCase;
  ApproveUseCase _approveUseCase;
  DenyUseCase _denyUseCase;
  DailyReservationsViewModel(this._dailyReservationUseCase,this._approveUseCase,this._denyUseCase);
  List<DailyReservationsModel> _dailyReservations=[];
  int tripID=0;
  @override
  void start() {
  }
  setTripId(int id){
    tripID=id;
    notifyListeners();
  }

  setDailyReservations(List<DailyReservationsModel> dR){
    _dailyReservations= dR;
  //  notifyListeners();
  }
  List<DailyReservationsModel> getDailyReservations(){
    print(_dailyReservations.length);
    return _dailyReservations;
  }
  Future<void> triggerEvent() async {
    final String appKey = '73533acae2e494dbe929';
    final String appSecret = '91e59dc74100f3750f98';
    final String channelName = 'Public-trackingg';

    final url = Uri.parse('https://api.pusher.com/apps/1652165/events');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${base64Encode(utf8.encode("$appKey:$appSecret"))}',
    };
    final data = {
      'name': 'client-event',
      'channels': [channelName],
      'data': {
        'message': 'Hello, Pusher!',
      },
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
      encoding: Encoding.getByName('utf-8'),
    );

    if (response.statusCode == 200) {
      print('تم إرسال الرسالة بنجاح.');
    } else {
      print('حدث خطأ أثناء إرسال الرسالة: ${response.body}');
    }
  }

  dailyReservation(int id) async{
    setStateScreen(1);
    ( await _dailyReservationUseCase.execute(id)).fold(

            (failure)  {
              setStateScreen(2);
              print(failure.massage);
        },
            (data)  async{
              if(data.dailyReservationsModel?.length==0){
                setStateScreen(3);
              }else{
                setStateScreen(0);
                setDailyReservations(data.dailyReservationsModel ??[]);
              }
        });
  }

  approve(int id) async{

    ( await _approveUseCase.execute(id)).fold(

            (failure)  {
          print(failure.massage);
        },
            (data)  async{
          print("succsec");
        });
  }
  deny(int id) async{

    ( await _denyUseCase.execute(id)).fold(

            (failure)  {
          print(failure.massage);
        },
            (data)  async{
          print("succsec");
        });
  }
  @override
  setDialog(int state) {
    notifyListeners();
    return super.setDialog(state);
  }
  @override
  setStateScreen(int state) {
    notifyListeners();
    return super.setStateScreen(state);
  }
}