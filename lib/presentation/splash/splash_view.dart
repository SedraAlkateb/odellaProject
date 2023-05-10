

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/conestants_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _time;
  final AppPreferences _appPreferences =instance<AppPreferences>();
  _startDelay(){
    _time=Timer(const  Duration(seconds: AppConstants.splashDelay), _goNext);
  }
  _goNext() async{
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) {
      if(isUserLoggedIn){
        Navigator.pushReplacementNamed(context, Routes.pageScreen);
  }else{
        Navigator.pushReplacementNamed(context, Routes.afterSplashRoute);
      }
    }

    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    //  backgroundColor: ColorManager.primary,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAssets.logo4),
            SvgPicture.asset(ImageAssets.odella),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _time?.cancel();
    super.dispose();
  }

}

