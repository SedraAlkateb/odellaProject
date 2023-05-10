import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
class AfterSignUpView extends StatefulWidget {
  const AfterSignUpView({Key? key}) : super(key: key);

  @override
  _AfterSignUpViewState createState() => _AfterSignUpViewState();
}

class _AfterSignUpViewState extends State<AfterSignUpView> {
  _goToSignup(){
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, Routes.signupRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            _goToSignup();
          },
          icon:  SvgPicture.asset(
              ImageAssets.vector,
              semanticsLabel: 'Acme Logo'
          ),

        ),
      ),
    //  backgroundColor: ColorManager.primary,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
                ImageAssets.money,
                semanticsLabel: 'Acme Logo'
            ),
            SizedBox(
              height: AppSize.s18,
            ),
            SvgPicture.asset(
                ImageAssets.check,
                semanticsLabel: 'Acme Logo'
            ),


          ],
        ),
      ),
    );
  }
}
