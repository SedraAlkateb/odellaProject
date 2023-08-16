import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
class BackLoginView extends StatelessWidget {
  const BackLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppPreferences _appPreferences =instance<AppPreferences>();

    return  Scaffold(

        body:       Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
              child: Text("You have not used the application for a day,"
                  " for security reasons we have exited it,"
                  " please press the button to return to login"
              ),
            ),
            TextButton(onPressed: (){
              _appPreferences.signOut().then((value) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushNamed(context,Routes.afterSplashRoute);
                });
              }
              );
            }, child: Text("Back To login"))
          ],
        )

    );
  }
}
