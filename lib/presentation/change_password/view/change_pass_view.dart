


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/lang/locale_keys.g.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
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
                              // profile.setOldPassword(value);
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
                             // profile.setNewPassword(value);
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
                              //profile.setNewPasswordConfirmation(value);
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
                            //profile.updatePassword();
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
    );
  }
}
