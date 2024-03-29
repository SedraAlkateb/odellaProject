import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/get_all_lost_usecase.dart';
import 'package:untitled/domain/usecase/store_claim_usecase.dart';
import 'package:untitled/domain/usecase/store_lost_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/common/image/downloadImage.dart';

class LostItemsViewModel extends BaseViewModel with ChangeNotifier{
  final GetAllLostUseCase _allLostUseCase;
  LostFound? lostFound;
  List<LostAndFoundData>search =[];
  LostItemsViewModel(this._allLostUseCase);
  File? image;
  @override
  setMessage(String m) {
    notifyListeners();
    return super.setMessage(m);
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
  @override
  void start() {
    getAllLostAndFound();
  }
setImage(File im){
    image=im;
    notifyListeners();
}
File getImage(){
return image! ;
  }
  /////////////////////////
  setSearch( String value){
    search= lostFound?.lostAndFound?.lostAndFoundData?.where(
            (element){
          final tit=element.description.toLowerCase();
          final sear=value.toLowerCase();
          return   tit.contains(sear);
        }).toList()??[];
    notifyListeners();

  }

  List<LostAndFoundData> getSearch(){
    return search;
  }

  ///////////
  setLost(LostFound data){
    lostFound=data;
    search=lostFound?.lostAndFound?.lostAndFoundData??[];
    notifyListeners();
  }
  LostFound getLost(){
    return lostFound!;
  }
  List<LostAndFoundData>? getListFound(){
    return lostFound?.lostAndFound?.lostAndFoundData;
  }
  getAllLostAndFound() async{
  setStateScreen(1);
    ( await _allLostUseCase.execute(null)).fold(
            (failure)  {
              setMessage(failure.massage);
              setStateScreen(2);
            },
            (data)  async{
              if(data.lostAndFound==null){
                setStateScreen(3);
              }else{
                setStateScreen(0);
                setLost(data);
              }
            });
  }
 /*
  storeLostAndFound() async{
  //  inputState.add(LoadingState(stateRendererType: StateRendererType.popupLoadingState));

    ( await _storeLostUseCase.execute(
        LostUseCaseInput(
            loginObject.userName, loginObject.password,getFcmToken()
        ))).fold(

            (failure)  {
          inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
        },
            (data)  async{
          // await _appPreferences.setToken();
          inputState.add(ContentState());
          setAuth(data);

        });
  }
  */



}