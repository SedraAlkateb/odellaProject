
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/lang/locale_keys.g.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/page/page_view_model.dart';
import 'package:untitled/presentation/page_superviser/drawer/view_model/drawer_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/home_supervisor/view_model/home_super_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/profile/view_model/supervisor_profile_viewmodel.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/conestants_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

import '../../page_view_model.dart';

class DrawerSupervisorView extends StatelessWidget {
  DrawerSupervisorView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    final AppPreferences _appPreferences =instance<AppPreferences>();


    return Drawer(

        //backgroundColor: ColorManager.side,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                  Provider.of<SupervisorProfileViewModel>(context)
                      .getName() ?? ""),
              accountEmail: Text(
                  Provider.of<SupervisorProfileViewModel>(context)
                      .getEmail()),
              currentAccountPicture: CircleAvatar(
                  child: Provider.of<SupervisorProfileViewModel>(context)
                      .getIm() != null
                  //  profile1.getDownload()
                      ? Container(
                    width: 160.0,
                    height: 160.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image:
                            FileImage(
                                Provider.of<SupervisorProfileViewModel>(
                                    context).getIm() ?? File("")
                            )
                        )
                    ),


                  )
                      : Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add,
                          size: 50, color: Color(0xFFFFFFFF)))
                //:profile1.getLocalPath()!=null?

              ),

              decoration: BoxDecoration(
                color: ColorManager.side,
              ),
            ),
            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),
            ListTile(

              title: Text(
                LocaleKeys.Home.tr(),
                style: TextStyle(color: ColorManager.sidBarIcon),
              ),
              leading: Icon(
                Icons.home,
                color: ColorManager.sidBarIcon,
              ),

              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Provider
                      .of<PageSupervisorViewModel>(context, listen: false)
                      .selectedIndex = AppConstants.home2;
                });
              },
            ),
            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),
            ListTile(
              title: Text(LocaleKeys.profile.tr()),
              leading: Icon(
                Icons.person, color: ColorManager.sidBarIcon,),

              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Provider
                      .of<PageSupervisorViewModel>(context, listen: false)
                      .selectedIndex = AppConstants.profile2;
                });
              },
            ),
            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),
            ListTile(
              title: Text(LocaleKeys.programmer.tr()),
              leading: Icon(
                Icons.calendar_today, color: ColorManager.sidBarIcon,
              ),

              onTap: () {
                Provider
                    .of<PageSupervisorViewModel>(context, listen: false)
                    .selectedIndex = AppConstants.program2;
              },
            ),
            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),
            ListTile(
              title: Text(LocaleKeys.dailyrecieve.tr()),
              leading: Icon(Icons.location_on_outlined,
                color: ColorManager.sidBarIcon,
              ),

              onTap: () {
                Provider
                    .of<PageSupervisorViewModel>(context, listen: false)
                    .selectedIndex = AppConstants.dailyrecieve;
              },
            ),
            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),

            ListTile(
                title: Text(LocaleKeys.qrscan.tr()),
                leading: Icon(Icons.qr_code_scanner,
                  color: ColorManager.sidBarIcon,

                ),

                onTap: () {
                  Navigator.pushNamed(context, Routes.qrscan);
                }

            ),
            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),

            ListTile(
                title: Text(LocaleKeys.notification.tr()),
                leading: Icon(Icons.notifications,
                  color: ColorManager.sidBarIcon,
                ),

                onTap: () {
                  Navigator.pushNamed(context, Routes.application);
                }

            ),

            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),
            ListTile(
                title: Text(LocaleKeys.settings.tr()),
                leading: Icon(Icons.settings,
                  color: ColorManager.sidBarIcon,

                ),

                onTap: () {
                  Navigator.pushNamed(context, Routes.settingRoute);
                }

            ),
            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),
            ListTile(
                title: Text(LocaleKeys.signOut.tr()),
                leading: Icon(Icons.logout,
                  color: ColorManager.sidBarIcon,

                ),

                onTap: () async {
                    LoadingState(stateRendererType: StateRendererType.popupLoadingState).showPopup(context, StateRendererType.popupLoadingState, "Loading");
                    await Provider.of<DrawerSupervisorViewModel>(context, listen: false).logout().then((value) {
                      if(value){
                          _appPreferences.signOut().then((value) {
                            ContentState().dismissDialog(context);

                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              Provider.of<HomeSuperVisorViewModel>(context,listen: false).stopTracking();
                              Provider.of<DrawerSupervisorViewModel>(context,listen: false).dispose();
                              Navigator.pushReplacementNamed(context,Routes.afterSplashRoute);

                            });
                                                      }
                          );
                      }
                      else{
                        ErrorState(StateRendererType.popupErrorState, "Error").dismissDialog(context);
                        ErrorState(StateRendererType.popupErrorState, "Error").showPopup(context,StateRendererType.popupErrorState, "Error");
                      }


                  }
                  );
                }

            ),

          ],
        ),
      );

  }
}
