import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/lang/local_keys.g.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/number/number_view_model.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

class NumberView extends StatelessWidget {
  const NumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric( vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text("input your phone number to detecting from your request"), ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration:  InputDecoration(
                      labelText: LocaleKeys.ePhoneNumber.tr(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.ePhoneNumber;
                      } else {
                        Provider.of<NumberViewModel>(context,listen: false).setPhoneNumber(int.parse(value));
                      }
                    },
                    onChanged: (value){
                      Provider.of<NumberViewModel>(context,listen: false).setPhoneNumber(int.parse(value));

                    },
                  ),
                ),
              TextButton(onPressed: (){
                LoadingState(stateRendererType: StateRendererType.popupLoadingState).showPopup(context, StateRendererType.popupLoadingState, LocaleKeys.loading);
                Provider.of<NumberViewModel>(context,listen: false).detectReservation().then((value) {
                  if(value){
                    SuccessState("success").dismissDialog(context);
                    SuccessState("success").showPopup(context,StateRendererType.popupSuccess,"Success");
                  }else{
                    ErrorState(StateRendererType.popupErrorState,Provider.of<NumberViewModel>(context,listen: false).getMessage1()).dismissDialog(context);
                    ErrorState(StateRendererType.popupErrorState, Provider.of<NumberViewModel>(context,listen: false).getMessage1()).showPopup(context,StateRendererType.popupErrorState,Provider.of<NumberViewModel>(context,listen: false).getMessage1());
                  }
                });
              }, child: Text("send"))




            ],
          ),
        )
      ),
    );
  }
}
