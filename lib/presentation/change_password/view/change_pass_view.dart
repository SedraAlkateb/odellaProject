import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/lang/locale_keys.g.dart';
import 'package:untitled/presentation/change_password/view_model/change_pass_view_model.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/page/profile/view_model/profile_view_model.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';

import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';

class ChangePassView extends StatefulWidget {
  @override
  _ChangePassViewState createState() => _ChangePassViewState();
}

class _ChangePassViewState extends State<ChangePassView> {
  final _globalKey = GlobalKey<FormState>();
  TextEditingController _p1controoler = TextEditingController();
  TextEditingController _p2controoler = TextEditingController();
  TextEditingController _p3controoler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.changePassword.tr(), style: Theme
            .of(context)
            .textTheme.bodyLarge,
        ),
      ),
      body:
      Consumer<ChangePasswordViewModel>(
        builder: (context, profile, child) =>
         SingleChildScrollView(
          child:  Form(
            key: _globalKey,
            child: Padding(
              padding:  EdgeInsets.only(
                  right: 28.sp,
                  left: 28.sp,
                  bottom: 28.sp),
              child: Column(
                children: [
                  Center(child: Image.asset(ImageAssets.logo4)),
                  SizedBox(
                    height:5.h,
                  ),
                  Container(
                    height: 10.h,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.oldPassword.tr();
                        } else {
                           profile.setOldPassword(value);
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      controller: _p1controoler,
                      decoration:  InputDecoration(
                        hintText: LocaleKeys.oldPassword,
                        labelText: LocaleKeys.oldPassword,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  Container(
                    height: 10.h,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.newPassword;
                        } else {
                           profile.setNewPassword(value);
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      controller: _p2controoler,
                      decoration:  InputDecoration(
                        hintText: LocaleKeys.newPassword,
                        labelText: LocaleKeys.newPassword,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  Container(
                    height: 10.h,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.confirmPassword;
                        } else {
                          profile.setNewPasswordConfirmation(value);
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: _p3controoler,
                      decoration:  InputDecoration(
                        hintText: LocaleKeys.confirmPassword,
                        labelText: LocaleKeys.confirmPassword,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding:EdgeInsets.only(
                        left: 2.sp, right:2.sp),
                    child: SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: () {

                          if (_globalKey.currentState!.validate()) {
                            LoadingState(stateRendererType: StateRendererType.popupLoadingState).showPopup(context, StateRendererType.popupLoadingState, "loading");
                            profile.setId(Provider.of<ProfileViewModel>(context).getId()??0);

                            profile.updatePassword().then((value) {
                              if(value){
                                ContentState().dismissDialog(context);

                              }else{
                                ErrorState(StateRendererType.popupErrorState, profile.getMessage1()).dismissDialog(context);
                                ErrorState(StateRendererType.popupErrorState, profile.getMessage1()).showPopup(context, StateRendererType.popupErrorState, profile.getMessage1());

                              }
                            });
                          }
                        },
                        child:  Text(LocaleKeys.save.tr()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
