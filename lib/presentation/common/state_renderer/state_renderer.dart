
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

import '../../../lang/locale_keys.g.dart';
enum StateRendererType{
///popup states (dialog)

  popupLoadingState,
  popupErrorState,
 popupSuccess,

  /// full screen stated (full screen)
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,
/// general
  contentState
}
class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String message;
  String title;
  Function retryActionFunction;

  StateRenderer(
      {
        required  this.stateRendererType,
        required this.message,
        this.title="",
        required this.retryActionFunction});
  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }
  Widget _getStateWidget(BuildContext context){
    switch(stateRendererType){

      case StateRendererType.popupLoadingState:
        return _getPopupDialog(context,[_getAnimatedImage(JsonAssets.loading1)]);
      case StateRendererType.popupErrorState:
        return _getPopupDialog(context,[
            _getAnimatedImage(JsonAssets.error),
            _getMessage(message),
            _getRetryButton(LocaleKeys.ok.tr(),context)

        ]);

      case StateRendererType.fullScreenLoadingState:
      return _getItemsColumn([_getAnimatedImage(JsonAssets.loading2),_getMessage(message)]);

      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn(
            [
              _getAnimatedImage(JsonAssets.error),
              _getMessage(message),
              _getRetryButton(LocaleKeys.retryAgain.tr(),context)
            ]
        );
      case StateRendererType.fullScreenEmptyState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.empty1),
          _getMessage(message)
        ]);
      case StateRendererType.contentState:
      return Container();
      case StateRendererType.popupSuccess:
        return _getPopupDialog(context, [
        //  _getAnimatedImage(JsonAssets.loading1),
          _getMessage(title),
          _getMessage(message),
          _getRetryButton(LocaleKeys.ok.tr(), context)
        ]);
      default:
        return Container();

    }
  }
Widget _getItemsColumn(List<Widget>children){
 return Column(
   mainAxisAlignment: MainAxisAlignment.center,
   crossAxisAlignment: CrossAxisAlignment.center,
   children: children,
 );
}
Widget _getAnimatedImage(String animationName){
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child:Lottie.asset(animationName )
    );
}
Widget _getMessage(String message){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message,
          style: getRegularStyle(
              color: ColorManager.black,
            fontSize: FontSize.s18
          )
          ,
        ),
      ),
    );
}
Widget _getRetryButton(String buttonTitle,BuildContext context){

  return Padding(
    padding: const EdgeInsets.all(AppPadding.p18),
    child: SizedBox(
      width: double.infinity,

    child:  ElevatedButton(onPressed: (){
      if(stateRendererType==StateRendererType.fullScreenErrorState){
        retryActionFunction.call();
      }else{
        //popup error state
        Navigator.of(context).pop();
      }
    },
        child: Text(buttonTitle)),

    ),
  );
  }
Widget _getPopupDialog(BuildContext context,List<Widget> children){
    return  Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),

      ),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.s14),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26
            )
          ]
        ),
        child: _getDialogContent(context,children) ,
      ),
    );
}
Widget  _getDialogContent (BuildContext context,List<Widget>children){

  return Column(
    mainAxisSize: MainAxisSize.min,
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: children,
  );
}
getMessage(String ){

}
}

