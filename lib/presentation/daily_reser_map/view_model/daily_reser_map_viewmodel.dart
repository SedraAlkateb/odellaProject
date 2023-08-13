import 'package:flutter/material.dart';
import 'package:untitled/presentation/base/base_view_model.dart';

class DailyReservationMap extends BaseViewModel with ChangeNotifier{
  @override
  void start() {
    // TODO: implement start
  }
  int selectedValue=0;
  setSelectedValue(int index){
    selectedValue=index;
    notifyListeners();
  }
 int getSelectedValue(){
    return selectedValue;
  }

}