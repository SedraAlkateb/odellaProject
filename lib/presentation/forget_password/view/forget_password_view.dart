import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/forget_password/view_model/forget_password_viewmodel.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();

  late var _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = Provider.of<ForgotPasswordViewModel>(context);
    _viewModel.start();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(Provider.of<ForgotPasswordViewModel>(context).getRest()){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<ForgotPasswordViewModel>(context,listen: false).setRest(false);
        Navigator.pushReplacementNamed(context,Routes.resetPasswordRoute);
      });
    }
    return Scaffold(body: _getContentWidget());
  }

  Widget _getContentWidget() {
   final _viewModelFalse = Provider.of<ForgotPasswordViewModel>(context,listen: false);
   final _viewModelTrue = Provider.of<ForgotPasswordViewModel>(context);

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
                     child: Text( Provider.of<ForgotPasswordViewModel>(context).getMassage(),style: Theme.of(context).textTheme.titleLarge),
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
                            _viewModelFalse
                                .setEmail(value);
                          }
                        },
                      )),
                  const SizedBox(
                    height: AppSize.s28,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: AppPadding.p28, right: AppPadding.p28),
                      child: SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Provider.of<ForgotPasswordViewModel>(context,
                                      listen: false)
                                  .forgotPassword();
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
