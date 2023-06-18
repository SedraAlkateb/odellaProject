import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/constants.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/login/view_model/login_viewmodel.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
import '../../../lang/locale_keys.g.dart';
import '../../resources/assets_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _forKey = GlobalKey<FormState>();
  final AppPreferences _appPreferences =instance<AppPreferences>();
  var loginViewModelWatch;
  var loginViewModelRead;
  @override
  void didChangeDependencies() {
    loginViewModelWatch  = context.watch<LoginViewModel>();
    loginViewModelRead = context.read<LoginViewModel>();
    loginViewModelRead.start();

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    loginViewModelRead.status=0;

    super.dispose();
  }
  @override
  void initState() {
 isobscured=true;
 SchedulerBinding.instance.addPostFrameCallback((_) {
   Provider.of<LoginViewModel>(context, listen: false).init();
 });
 super.initState();
  }
 var isobscured;



  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: _scaffoldKey,
      //  backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context,Routes.afterSplashRoute);
            });
          },
          icon:
              SvgPicture.asset(ImageAssets.vector, semanticsLabel: 'Acme Logo'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.pop(context, Routes.afterSplashRoute);
              });
            },
            icon: SvgPicture.asset(
              ImageAssets.note,
              //  semanticsLabel: 'Acme Logo'
            ),
          ),
        ],
      ),
      body:  StreamBuilder<FlowState>(
          stream:
          loginViewModelRead.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(
                _scaffoldKey.currentContext!, _getContentWidget(), () {
              loginViewModelRead.start();
            }) ??
                _getContentWidget();
          }),
        //_getContentWidget()

    );
  }

  Widget _getContentWidget() {
    if (loginViewModelWatch.success()) {
      _appPreferences.setLoggedIn(loginViewModelWatch.getToken() ??"",loginViewModelRead.getRole() ??"").then((value) =>
          SchedulerBinding.instance.addPostFrameCallback((_) {
            if(_appPreferences.getToken()!=null){
              if (_appPreferences.getUser() ==  Constants.student) {
              //  Provider.of<LoginViewModel>(context,listen: false).setSuc(0);
                Navigator.pushReplacementNamed(context,Routes.pageScreen);
              }else if(_appPreferences.getUser() == Constants.supervisor) {
                Navigator.pushReplacementNamed(context,Routes.supervisorPageRoute);
              }
            }else{
              loginViewModelRead.login();
            }

          })
      );

    }

    return SingleChildScrollView(
      child: Form(
        key: _forKey,
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
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _userNameController,
                  decoration:  InputDecoration(
                    hintText: StringsManager.username,
                    labelText: StringsManager.username,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return StringsManager.usernameError;
                    } else {
                      loginViewModelRead.setUserName(value);
                    }
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  obscureText: isobscured,
                  decoration:  InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isobscured=!isobscured;
                          }
                          );
                        },

                        icon: isobscured?  Icon(Icons.visibility
                          ,color: ColorManager.kMainColor,
                        ):
                         Icon(Icons.visibility_off,
                           color: ColorManager.kMainColor,
                         )),
                    hintText: StringsManager.password,
                    labelText: StringsManager.password,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return StringsManager.passwordError;
                    } else {
                      loginViewModelRead
                          .setPassword(value);
                    }
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: AppPadding.p28, bottom: AppPadding.p8),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.forgotPasswordRoute);
                    },
                    child: Text(
                      StringsManager.forgetPassword,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: SizedBox(
                  width: double.infinity,
                  height: AppSize.s64,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_forKey.currentState!.validate()) {
                          loginViewModelRead.login();
                          loginViewModelRead.scheduleTokenRefresh();
                        }
                      },
                      child:  Text(LocaleKeys.signIn.tr())),
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: AppPadding.p12,
                    left: AppPadding.p28,
                    right: AppPadding.p28),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                       Text(LocaleKeys.registerText.tr()),
                      TextButton(
                        onPressed: () {
                            Navigator.pushNamed(context, Routes.signupRoute);
                        },
                        child: Text(
                          LocaleKeys.signUp.tr(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
      StreamBuilder<FlowState>(
          stream:
              Provider.of<LoginViewModel>(context, listen: false).outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(
                    _scaffoldKey.currentContext!, _getContentWidget(), () {
                  Provider.of<LoginViewModel>(context, listen: false).login();
                }) ??
                _getContentWidget();
          }),
 */