import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/usecase/store_claim_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';

class ComplaintsViewModel extends BaseViewModel with ChangeNotifier{
  @override
  StoreClaimUseCase _claimUseCase;
  String _description="";

  ComplaintsViewModel(this._claimUseCase);

  void start() {
    // TODO: implement start
  }
  String getDescription(){
    return _description;
  }
  setDescription(String d){
    _description=d;
    notifyListeners();
  }
Future  storeClaim() async {
   // inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _claimUseCase.execute(ClaimUseCaseInput(1, getDescription())))
        .fold((failure) {
   //   inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
    }, (data)async {

          notifyListeners();
    });
  }

}