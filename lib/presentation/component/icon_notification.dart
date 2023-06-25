import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

Widget notificationIcon(BuildContext context){
  if(Provider.of<Not>(context).getCount()==0){
    return IconButton(onPressed: () {
      Navigator.pushNamed(context,Routes.application);
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
          Navigator.pushNamed(context,Routes.application);
        },
      ),
    );
  }

}

Icon iconNotification(int icon){
  switch(icon){
    case IconType.expiredSubscription:
      return Icon(Icons.attach_money,color: ColorManager.sidBarIcon,);
    case IconType.registration:
      return Icon(Icons.app_registration);
    case IconType.guestDailyReservation:
      return Icon(Icons.hail_outlined);
    case IconType.positionTime:
      return Icon(Icons.directions_bus_filled);
    case IconType.returnTime:
      return Icon(Icons.share_arrival_time);
    case IconType.stopRegistration:
      return Icon(Icons.group_off_rounded);
    default:
      return Icon(Icons.notifications);

  }

}
class IconType{
static const int  registration =0;
static const int expiredSubscription=1;
static const int positionTime=2;
static const int returnTime=3;
static const int stopRegistration=4;
static const int supervisorDailyReservation=5;
static const int guestDailyReservation=6;


}