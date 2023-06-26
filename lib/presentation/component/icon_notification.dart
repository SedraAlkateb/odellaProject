import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

Widget notificationIcon(BuildContext context){
  if(Provider.of<Not>(context).getCount()==0){
    return IconButton(onPressed: () {
      Navigator.pushNamed(context,Routes.notification);
    }, icon: const Icon(Icons.notifications));
  }else{
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        child: Badge(
          badgeContent: Text("${ Provider.of<Not>(context).getCount()}",style: TextStyle(color: Colors.white),),

          child: Icon(Icons.notifications,size: AppSize.s30),
          badgeAnimation: BadgeAnimation.fade(animationDuration: Duration(milliseconds:250 )),
        ),
        onTap: ()
        {
          print("kkkkkk");
          Navigator.pushNamed(context,Routes.notification);
        },
      ),
    );
  }

}