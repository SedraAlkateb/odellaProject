import 'package:flutter/material.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AfterSplashView extends StatefulWidget {
  const AfterSplashView({Key? key}) : super(key: key);

  @override
  _AfterSplashViewState createState() => _AfterSplashViewState();
}

class _AfterSplashViewState extends State<AfterSplashView> {
  @override
  _goLogin(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamed(context, Routes.loginRoute);
    });
  }
  _goTransactionLine(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        Navigator.pushNamed(context, Routes.homeScreen);
      } catch (e, s) {
        print(s);
      }
    });
  }
  _dailyReservation(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamed(context, Routes.mapPositionRoute);
    });
  }
  _subscription(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamed(context, Routes.subscriptionRoute);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: AppPadding.p28,right: AppPadding.p28,top: AppPadding.p40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.logo4),
              SizedBox(
                height: AppSize.s30,
              ),
              SvgPicture.asset(ImageAssets.odella),
              const SizedBox(
              height: AppSize.s40,
            ),
              SizedBox(
            height: AppSize.s64,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () =>
                  _goTransactionLine(),
                child:  Text(StringsManager.transportationLines)),
              ),
              const SizedBox(
            height: AppSize.s28,
              ),
              SizedBox(
            height: AppSize.s64,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: ()  =>
                    _dailyReservation(),
                child:  Text(StringsManager.dailyReservation)),
              ),
              const SizedBox(
            height: AppSize.s28,
              ),
              SizedBox(
            height: AppSize.s64,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: ()  =>
                    _subscription(),
                child:  Text(StringsManager.subscription)),
              ),
              const SizedBox(
            height: AppSize.s28,
              ),
              SizedBox(
            height: AppSize.s64,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () =>
                  _goLogin(),
                child:  Text(StringsManager.signIn)),
              ),
            ],
          ),
          ),
        ),
      )

    );
  }
}
