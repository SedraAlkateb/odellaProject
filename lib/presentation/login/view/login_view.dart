import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/login/view_model/login_viewmodel.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
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
  LoginViewModel _viewModel=instance<LoginViewModel>();
  _bind() {

       SchedulerBinding.instance.addPostFrameCallback((_) {

     Provider.of<LoginViewModel>(context,listen: false).start();
      });
  }

  @override
  void dispose() {
 //  _viewModel.setM(false);
    _viewModel.dispose();
    //cancelFetchData();
    super.dispose();
  }
  @override
  void initState() {
    isobscured=true;
    _bind();
    super.initState();
  }
 var isobscured;
  late NavigatorState _navigator;

  @override
  void didChangeDependencies() {
    _navigator = Navigator.of(context);
    super.didChangeDependencies();
  }

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
              _navigator.pushReplacementNamed(Routes.afterSplashRoute);
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
          Provider.of<LoginViewModel>(context, listen: false).outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(
                _scaffoldKey.currentContext!, _getContentWidget(), () {
              Provider.of<LoginViewModel>(context, listen: false).login();
            }) ??
                _getContentWidget();
          }),
        //_getContentWidget()

    );
  }

  Widget _getContentWidget() {
    if (Provider.of<LoginViewModel>(context,listen: false).success()) {

      _appPreferences.setLoggedIn(Provider.of<LoginViewModel>(context).getToken() ??"").then((value) =>
          SchedulerBinding.instance.addPostFrameCallback((_) {
            if(_appPreferences.getToken()!=null){
              if (Provider.of<LoginViewModel>(context,listen: false).getRole() == "Student") {
                _navigator.pushReplacementNamed(Routes.pageScreen);
              }else    if (Provider.of<LoginViewModel>(context,listen: false).getRole() == "Supervisor") {
                _navigator.pushReplacementNamed(Routes.supervisorPageRoute);
              }
            }else{
              Provider.of<LoginViewModel>(context,listen: false).start();
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
                      Provider.of<LoginViewModel>(context,listen: false).setUserName(value);
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
                      Provider.of<LoginViewModel>(context,listen: false)
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
                      Navigator.pushReplacementNamed(
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
                          Provider.of<LoginViewModel>(context,listen: false).login();
                        }
                      },
                      child:  Text(StringsManager.signIn)),
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
                       Text(StringsManager.registerText),
                      TextButton(
                        onPressed: () {
                            Navigator.pushNamed(context, Routes.signupRoute);
                        },
                        child: Text(
                          StringsManager.signUp,
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