import 'package:flutter/cupertino.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/subscriptions_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';

class SubscriptionViewModel extends BaseViewModel with ChangeNotifier{
  List<DataSubscriptions> _dataSubscriptions=[];
  final SubscriptionsUseCase _subscriptionsUseCase;
  SubscriptionViewModel(this._subscriptionsUseCase);
  @override
  void start() {
    getSubscriptionsData();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  setDataSubscriptions(  List<DataSubscriptions> subscription){
    _dataSubscriptions=subscription;
    notifyListeners();
  }
  List<DataSubscriptions> getDataSubscriptions(){
    return _dataSubscriptions;
  }

  getSubscriptionsData()async{
   // inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
    ( await _subscriptionsUseCase.execute(null))
    
        .fold(
            (failure)  {
     //     inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.massage));
        },
            (data)  {
          setDataSubscriptions(data.dataSubscriptions);
       //   inputState.add(ContentState());
        });

  }
}