import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/usecase/phone._usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/domain/models/models.dart';

class NumberViewModel extends BaseViewModel with ChangeNotifier {
  @override
  int phoneNumber=0946575839;
  PhoneUseCase phoneUseCase ;
 late Phone phone;
  NumberViewModel(this.phoneUseCase);
setPhone(Phone phone1){
  phone=phone1;
  notifyListeners();
}
  void start() {
    // TODO: implement start
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
  setPhoneNumber(int phone){
    phoneNumber=phone;
    notifyListeners();
  }
 int getPhoneNumber(){
    return phoneNumber;
  }
  bool b=false;
 Future<bool> detectReservation()async{
   ( await phoneUseCase.execute(getPhoneNumber())).fold(

           (failure)  {
         b= false;
         setMessage(failure.massage);
       },
           (data)  async{
         //  setSuc(1);
         // await _appPreferences.setToken();
         //inputState.add(ContentState());
             setPhone(data.phone!);
         b= true;
       }

   );

   return  b;

  }

}