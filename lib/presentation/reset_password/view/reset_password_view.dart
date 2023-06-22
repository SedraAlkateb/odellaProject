import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/lang/locale_keys.g.dart';
import 'package:untitled/presentation/reset_password/view_model/reset_password_viewmodel.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
import 'package:sizer/sizer.dart';
class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
  TextEditingController();
  final TextEditingController _passwordTextEditingController =
  TextEditingController();
  final TextEditingController _codeEditingController =
  TextEditingController();
  @override
  Widget build(BuildContext context) {

    if(Provider.of<ResetPasswordViewModel>(context).getSuccses()){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<ResetPasswordViewModel>(context,listen: false).setSuc(false);
      });
    }
    return Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.resetpass.tr(),style: TextStyle(color: ColorManager.sidBarIcon),),),
        body: _getContentWidget());
  }
  Widget _getContentWidget() {
    return
      SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding:  EdgeInsets.only(
                right: 28.sp,
                left: 28.sp,
                bottom: 28.sp),
            child: Column(
              children: [
                Center(child: Image.asset(ImageAssets.logo4)),
                 SizedBox(
                  height: 5.h,
                ),

                Container(
                  height: 10.h,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailTextEditingController,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.email.tr(),
                      labelText: LocaleKeys.email.tr(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.email.tr();
                      } else {
                        Provider.of<ResetPasswordViewModel>(context,listen: false)
                            .setEmail(value);
                      }
                    },
                  ),
                ),
                 SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 10.h,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _codeEditingController,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.code.tr(),
                      labelText: LocaleKeys.code.tr(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.code.tr();
                      } else {
                        Provider.of<ResetPasswordViewModel>(context,listen: false)
                            .setCode(int.tryParse(_codeEditingController.text)!);
                      }
                    },
                  ),
                ),
               SizedBox(
                  height:1.h,
                ),
                Container(
                  height: 10.h,
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordTextEditingController,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.resetpass.tr(),
                      labelText: LocaleKeys.resetpass.tr(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.resetpass.tr();
                      } else {
                        Provider.of<ResetPasswordViewModel>(context,listen: false)
                            .setNewPassword(value);
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),

                Provider.of<ResetPasswordViewModel>(context,
                    listen: false).getSuccses() ?
                Row(
                  children: [
                    Text(LocaleKeys.success.tr()),
                    Icon(Icons.check_circle ,color: ColorManager.icon1,)
                  ],

                ):
                Padding(
                    padding:EdgeInsets.only(
                        left: 2.sp, right:2.sp),
                    child: SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Provider.of<ResetPasswordViewModel>(context,
                                listen: false)
                                .resetPassword();
                          }
                        },
                        child: Text(LocaleKeys.save.tr()),
                      ),
                    )),
              ],
            ),
          ),
        ),
      );

  }

}
