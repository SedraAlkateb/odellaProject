import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/lang/locale_keys.g.dart';
import 'package:untitled/presentation/reset_password/view_model/reset_password_viewmodel.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
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
        appBar: AppBar(title: Text("resetpass",style: TextStyle(color: ColorManager.sidBarIcon),),),
        body: _getContentWidget());
  }
  Widget _getContentWidget() {
    return
      SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(
                right: AppPadding.p28,
                left: AppPadding.p28,
                bottom: AppPadding.p28),
            child: Column(
              children: [
                Center(child: Image.asset(ImageAssets.logo4)),
                const SizedBox(
                  height: AppSize.s28,
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: Text( Provider.of<ResetPasswordViewModel>(context).getMessage(),style: Theme.of(context).textTheme.titleLarge),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28,top:AppPadding.p28),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTextEditingController,
                      decoration: InputDecoration(
                        hintText: "email",
                        labelText: "email",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "email";
                        } else {
                          Provider.of<ResetPasswordViewModel>(context,listen: false)
                              .setEmail(value);
                        }
                      },
                    )),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28,top:AppPadding.p28),
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
                    )),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28,top:AppPadding.p28),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordTextEditingController,
                      decoration: InputDecoration(
                        hintText: "resetpass",
                        labelText: "resetpass",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "resetpass";
                        } else {
                          Provider.of<ResetPasswordViewModel>(context,listen: false)
                              .setNewPassword(value);
                        }
                      },
                    )),
                const SizedBox(
                  height: AppSize.s28,
                ),

                Provider.of<ResetPasswordViewModel>(context,
                    listen: false).getSuccses() ?
                Row(
                  children: [
                    Text("Succsses"),
                    Icon(Icons.check_circle ,color: ColorManager.sidBar,)
                  ],

                ):
                Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28),
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
                        child: Text("resetpass"),
                      ),
                    )),
              ],
            ),
          ),
        ),
      );

  }

}
