import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/get_all_lost_usecase.dart';
import 'package:untitled/domain/usecase/store_claim_usecase.dart';
import 'package:untitled/domain/usecase/store_lost_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/common/image/downloadImage.dart';

class LostItemsViewModel extends BaseViewModel with ChangeNotifier{
  final StoreLostUseCase _storeLostUseCase ;
  final GetAllLostUseCase _allLostUseCase;
  LostFound? lostFound;
  List<LostAndFoundData>search =[];
  LostItemsViewModel(this._storeLostUseCase, this._allLostUseCase);
  File? image;

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

  getSearch(){
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
 //   inputState.add(LoadingState(stateRendererType: StateRendererType.popupLoadingState));

    ( await _allLostUseCase.execute(null)).fold(
            (failure)  {
        //  inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
        },
            (data)  async{
          // await _appPreferences.setToken();
      //    inputState.add(ContentState());
          setLost(data);
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