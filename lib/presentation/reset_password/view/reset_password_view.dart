import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return Scaffold(body: _getContentWidget());
  }
  Widget _getContentWidget() {
    return Container(
      constraints: const BoxConstraints.expand(),
      padding: const EdgeInsets.only(top: AppPadding.p100),
      color: ColorManager.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(ImageAssets.logo4)),

          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                          hintText: "StringsManager.emailHint.tr()",
                          labelText: "StringsManager.emailHint.tr()",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " StringsManager.forgetPasswordError";
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
                          hintText: "StringsManager.Code.tr()",
                          labelText: "StringsManager.Code.tr()",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " StringsManager.code";
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
                          hintText: "StringsManager.reserPassword.tr()",
                          labelText: "StringsManager.reserPassword.tr()",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " StringsManager.reserPassword";
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
                      Icon(Icons.check_circle ,color: ColorManager.icon1,)
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
                          child: Text("ResetPassword"),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
