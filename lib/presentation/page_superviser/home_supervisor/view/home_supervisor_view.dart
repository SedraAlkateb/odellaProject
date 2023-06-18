import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/data/network/pusher.dart';
import 'package:untitled/presentation/common/image/downloadImage.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/daily_recieve/model.dart';
import 'package:untitled/presentation/page_superviser/daily_recieve/view_model/daily_recieve_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/drawer/view/drawer.dart';
import 'package:untitled/presentation/page_superviser/home_supervisor/view_model/home_super_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/trip_information/view/trip_information_view.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/style_manage.dart';
import '../../../resources/values_manager.dart';



class HomeSupervisorView extends StatefulWidget {
  const HomeSupervisorView({Key? key}) : super(key: key);

  @override
  State<HomeSupervisorView> createState() => _HomeSupervisorViewState();
}

class _HomeSupervisorViewState extends State<HomeSupervisorView> {


  @override
  void initState() {
    Provider.of<HomeSuperVisorViewModel>(context, listen: false).start();
       super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Consumer<HomeSuperVisorViewModel>(
        builder: (context, model, child) =>
         Scaffold(
           drawer:  DrawerSupervisorView(),
          appBar: AppBar(
            actions: [
              Provider.of<Not>(context).getCount()==0
                  ? IconButton(onPressed: () {
                    Navigator.pushNamed(context,Routes.notification);

                    }, icon: const Icon(Icons.notifications))
                  : Padding(
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
              ),
            ],
             title: Text(LocaleKeys.Home.tr(),
                 style: getBoldStyle(
                     color: ColorManager.sidBarIcon, fontSize: FontSize.s20)),
           ),
           body: SafeArea(
            child: orientation == Orientation.portrait
                ? Column(
              children: [
                Container(
                  height: 10.h,
                  margin: EdgeInsets.symmetric(
                      horizontal: 20.sp),
                  child: TextFormField(
                    onChanged: (value) {
                      try {
                       model
                            .setSearch(value);
                      } catch (e, s) {
                        print(s);
                      }
                    },
                    decoration: InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 0.5.w),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(AppSize.s16),
                          ),
                        ),
                        // fillColor: ColorManager.white,
                        border: OutlineInputBorder(
                          //  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
                          borderSide: BorderSide(
                              color: ColorManager.shadow,
                              width: 0.5.w),
                        ),
                        hintStyle: getRegularStyle(
                            color: ColorManager.icon,
                            fontSize: FontSize.s16),
                        hintText: LocaleKeys.searchstudent.tr(),
                        //       hintStyle:Theme.of(context).textTheme.bodySmall,
                        prefixIcon: Padding(
                          padding:
                          EdgeInsets.only(left: 8.sp),
                          child: Icon(
                            Icons.search,
                            color: ColorManager.button,
                          ),
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 1.h)),
                  ),
                ),
                SizedBox(height: 4.h),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                        Routes.informationTrip
                    );
                  },
                  child:  Text('${LocaleKeys.tripinformation.tr()}' ' ?',style: TextStyle(fontSize: FontSize.s18,color: ColorManager.sidBar,),),
                ),
                SizedBox(height: 4.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    model.getLocationData() != null
                        ? Text(
                        'Lat: ${model.getLocationData()?.latitude}, Long: ${model.getLocationData()?.longitude}')
                        : model.getError() != null
                        ? Text('Error: ${model.getError()}')
                        : CircularProgressIndicator(),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (_, index) => Container(
                      margin:  EdgeInsets.symmetric(horizontal: 25.sp),
                      padding: EdgeInsets.all(20.sp),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:  Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.grey,
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.white,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(28),
                                  ),
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                    ImageAssets.gray, // الصورة المؤقتة
                                    image: ImageDownloader.getUrl(
                                        model.getHomeSuperVisor().users?[index]
                                            .image ??
                                            ""), // الصورة الفعلية
                                    fit: BoxFit.contain,
                                    imageErrorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Container(

                                        decoration: BoxDecoration(
                                          color: Colors.grey, // الخلفية البديلة
                                        ),
                                      );
                                    },
                                    fadeInDuration: Duration(milliseconds: 500),
                                    fadeOutDuration: Duration(milliseconds: 500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${model.getUser()[index].firstName} ${model.getUser()[index].lastName}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 0.5.h,),
                                  Text(
                                    model.getUser()[index].email,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 0.3.h,),
                                  Text(
                                    model.getUser()[index].phoneNumber,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (_, index) =>  SizedBox(
                      height: 2.h,
                    ),
                    itemCount: model.getUser().length,
                  ),
                ),
              ],
            )
                :Column(
              children: [
                Container(
                  height: 5.h,
                  margin: EdgeInsets.symmetric(
                      horizontal: 40.sp),
                  child: TextFormField(
                    onChanged: (value) {
                      try {
                        // Provider.of<HomeViewModel>(context,listen: false).setSearch(value);
                      } catch (e, s) {
                        print(s);
                      }
                    },
                    decoration: InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 0.5.w),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(AppSize.s16),
                          ),
                        ),
                        // fillColor: ColorManager.white,
                        border: OutlineInputBorder(
                          //  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
                          borderSide: BorderSide(
                              color: ColorManager.shadow,
                              width: 0.5.w),
                        ),
                        hintStyle: getRegularStyle(
                            color: ColorManager.icon,
                            fontSize: FontSize.s16),
                        hintText: LocaleKeys.searchstudent.tr(),
                        //       hintStyle:Theme.of(context).textTheme.bodySmall,
                        prefixIcon: Padding(
                          padding:
                          EdgeInsets.only(left: 8.sp),
                          child: Icon(
                            Icons.search,
                            color: ColorManager.button,
                          ),
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 1.h)),
                  ),
                ),
                SizedBox(height:3.h),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                        Routes.informationTrip
                    );
                  },
                  child: const Text('trip informations ?',style: TextStyle(fontSize: FontSize.s18),),
                ),
                SizedBox(height: 3.h),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (_, index) => Container(
                      margin:  EdgeInsets.symmetric(horizontal: 45.sp),
                      padding: EdgeInsets.all(25.sp),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:  Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(AppSize.s15)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.grey,
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.white,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(28),
                                  ),
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                    ImageAssets.gray, // الصورة المؤقتة
                                    image: ImageDownloader.getUrl(
                                        model.getHomeSuperVisor().users?[index]
                                            .image ??
                                            ""), // الصورة الفعلية
                                    fit: BoxFit.contain,
                                    imageErrorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Container(

                                        decoration: BoxDecoration(
                                          color: Colors.grey, // الخلفية البديلة
                                        ),
                                      );
                                    },
                                    fadeInDuration: Duration(milliseconds: 500),
                                    fadeOutDuration: Duration(milliseconds: 500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${model.getUser()[index].firstName} ${model.getUser()[index].lastName}"
                                    ,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 0.5.h,),
                                  Text(
                                    model.getUser()[index].email,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize:AppSize.s12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 0.3.h,),
                                  Text(
                                    model.getUser()[index].phoneNumber,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: AppSize.s12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (_, index) =>  SizedBox(
                      height: 2.h,
                    ),
                    itemCount: model.getUser().length,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

    },
    );
  }
}

