// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/page/drawer/view/drawer_viewmodel.dart';
import 'package:untitled/presentation/page/home/view_model/home_view_model.dart';
import 'package:untitled/presentation/page/page_view_model.dart';
import 'package:untitled/presentation/page/profile/view_model/profile_view_model.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/conestants_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

class NavBar extends StatelessWidget {
   NavBar({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final AppPreferences _appPreferences =instance<AppPreferences>();
if(Provider.of<DrawerViewModel>(context).isSuccess()){
  _appPreferences.signOut().then((value) {
      Provider.of<DrawerViewModel>(context,listen: false).dispose();
      Navigator.pushReplacementNamed(context,Routes.afterSplashRoute);
    }
    );
}
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppSize.s50),
      ),

      child: Drawer(
backgroundColor: ColorManager.side,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(Provider.of<ProfileViewModel>(context).getName()??""),
              accountEmail: Text(Provider.of<ProfileViewModel>(context).getEmail()),
              currentAccountPicture: CircleAvatar(
                child: Provider.of<ProfileViewModel>(context).getIm() != null
                //  profile1.getDownload()
                    ?Container(
                      width: 160.0,
                      height: 160.0,
                      decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image:
                              FileImage(
                                  Provider.of<ProfileViewModel>(context).getIm()?? File("")
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
                StringsManager.home,
                style: TextStyle(color: ColorManager.sidBarIcon),
              ),
              leading: Icon(
                Icons.home,
                color: ColorManager.sidBarIcon,
              ),

              onTap: () {
      WidgetsBinding.instance.addPostFrameCallback((_) {

      Provider.of<NavbarProvider>(context,listen: false).selectedIndex=AppConstants.home;
      });
              },
            ),
            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),
            ListTile(
              title: Text(StringsManager.profile),
              leading: Icon(Icons.person,color: ColorManager.sidBarIcon,),

              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Provider.of<NavbarProvider>(context,listen: false).selectedIndex=AppConstants.profile;
                });
              },
            ),
            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),
            ListTile(
              title: Text(StringsManager.programmer),
              leading: Icon(Icons.calendar_today,color: ColorManager.sidBarIcon,
              ),

              onTap: () {
                Provider.of<NavbarProvider>(context,listen: false).selectedIndex=AppConstants.program;
              },
            ),
            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),
            ListTile(
              title: Text(StringsManager.busSite),
              leading: Icon(Icons.location_on_outlined, color: ColorManager.sidBarIcon,
              ),

              onTap: () {
                print("on tap");
              },
            ),
            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),
            ListTile(
              title: Text(StringsManager.complaints),
              leading: Icon(Icons.call,
                color: ColorManager.sidBarIcon,

              ),

              onTap: () {
                Provider.of<NavbarProvider>(context,listen: false).selectedIndex=AppConstants.complaints;
                },
            ),
            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),
            ListTile(
                title: Text(StringsManager.lostItems),
                leading: Icon(Icons.storefront,
                  color: ColorManager.sidBarIcon,

                ),

                onTap: () async{
                  Provider.of<NavbarProvider>(context,listen: false).selectedIndex=AppConstants.lostItem;
                }

            ),
            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),
            ListTile(
                title: Text(StringsManager.settings),
                leading: Icon(Icons.settings,
                  color: ColorManager.sidBarIcon,

                ),

                onTap: () {
                  Navigator.pushNamed(context,Routes.settingRoute);
                }

            ),
            Divider(
              color: ColorManager.sidBarIcon,
              height: 15,
            ),
            ListTile(
              title: Text(StringsManager.signOut),
              leading: Icon(Icons.logout,
                color: ColorManager.sidBarIcon,

              ),

              onTap: () async{
                await Provider.of<DrawerViewModel>(context,listen: false).logout();

                }

            ),

          ],
        ),
      ),
    );

  }
}
