import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/lang/locale_keys.g.dart';
import 'package:untitled/presentation/forget_password/view_model/forget_password_viewmodel.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
import 'package:sizer/sizer.dart';

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

    return Scaffold(appBar:AppBar(title: Text(LocaleKeys.forgetPassword.tr(),style: TextStyle(color: ColorManager.sidBarIcon),),),
        body: _getContentWidget());
  }

  Widget _getContentWidget() {
    final _viewModelFalse = Provider.of<ForgotPasswordViewModel>(context,listen: false);
    final _viewModelTrue = Provider.of<ForgotPasswordViewModel>(context);

    return

      SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(

            padding: EdgeInsets.only(
                right: AppPadding.p28,
                left: AppPadding.p28,
                bottom: AppPadding.p28),
            child: Column(
              children: [
                Center(child: Image.asset(ImageAssets.logo4)),

                 SizedBox(
                  height:50,
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28,top:AppPadding.p28),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTextEditingController,
                      decoration: InputDecoration(
                        hintText: LocaleKeys.email.tr(),
                        labelText: LocaleKeys.email.tr()
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.errorEmail.tr();
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
