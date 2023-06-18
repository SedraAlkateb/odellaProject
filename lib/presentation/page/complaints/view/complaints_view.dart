import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/page/complaints/view_model/complaints_viewmodel.dart';
import 'package:untitled/presentation/page/drawer/view/drawer.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/style_manage.dart';
import '../../../resources/values_manager.dart';
import 'package:sizer/sizer.dart';

class ComplaintsView extends StatefulWidget {
  const ComplaintsView({Key? key}) : super(key: key);

  @override
  State<ComplaintsView> createState() => _ComplaintsViewState();
}

class _ComplaintsViewState extends State<ComplaintsView> {
  TextEditingController textEditingController = TextEditingController();
  int dropdownTransportationLine = 0;
  var viewModel;
@override
  void initState() {
  viewModel = Provider.of<ComplaintsViewModel>(context, listen: false);
  viewModel.start();
//  Provider.of<ComplaintsViewModel>(context).start();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Scaffold(
          appBar:  AppBar(
            actions: [
              Provider.of<Not>(context).getCount()==0
                  ? IconButton(onPressed: () {print("0");}, icon: const Icon(Icons.notifications))
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

            title: Text(LocaleKeys.complaints.tr(),
                style: getBoldStyle(
                    color: ColorManager.sidBarIcon, fontSize: FontSize.s20)),
          ),
          drawer:  NavBar(),
          body: SingleChildScrollView(
            child: orientation == Orientation.portrait
                ? Column(
              children: [
                Padding(
                  padding:  EdgeInsets.all(16.sp),
                  child: TextField(
                    controller: textEditingController,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.Enteryourcompliaint.tr(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.w, color: ColorManager.sidBar),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 0.5.w, color: Colors.grey),
                      ),
                    ),
                      onChanged: (value){Provider.of<ComplaintsViewModel>(context,listen: false).setDescription(value);
                      textEditingController.text=value;
                    }
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.selecttrip.tr(),
                      style: TextStyle(fontSize: AppSize.s20),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    DropdownButton(
                        icon:
                        const Icon(Icons.keyboard_arrow_down),
                        hint: Text(
                            LocaleKeys.transportationLines.tr()),
                        items:Provider.of<ComplaintsViewModel>(context).getTrip()
                            .map((e) => DropdownMenuItem(
                          value: e.id,
                          child: Text(
                            "${Provider.of<ComplaintsViewModel>(context,
                                listen: false).date(e.time!.date)} ${e.time!.start} ",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: AppSize.s15),
                          ),
                        )).toList(),
                        onChanged: (val) {
                          Provider.of<ComplaintsViewModel>(context,
                              listen: false)
                              .setTripId(val!);
                        }
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                const Text(
                  "data 1",
                  style:
                  TextStyle(fontSize: AppSize.s15, color: Colors.grey),
                ),
                SizedBox(height: 2.h),
                const Text(
                  "data 2",
                  style:
                  TextStyle(fontSize: AppSize.s15, color: Colors.grey),
                ),
                SizedBox(height: 2.h),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ComplaintsViewModel>(context,listen: false).storeClaim();
                  },
                  child: Text(
                    LocaleKeys.send.tr(),
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            )
                : Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${LocaleKeys.selecttrip.tr()}'':',
                            style: TextStyle(fontSize: AppSize.s20),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          DropdownButton(
                              icon:
                              const Icon(Icons.keyboard_arrow_down),
                              hint: Text(
                                  LocaleKeys.transportationLines.tr()),
                              items:Provider.of<ComplaintsViewModel>(context).getTrip()
                                  .map((e) => DropdownMenuItem(
                                value: e.id,
                                child: Text(
                                  "${e.time!.date} ${e.time!.start}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: AppSize.s15),
                                ),
                              )).toList(),
                              onChanged: (val) {
                                Provider.of<ComplaintsViewModel>(context,
                                    listen: false)
                                    .setTripId(val!);
                              }
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const Text(
                        "data 1",
                        style: TextStyle(
                            fontSize: AppSize.s15, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const Text("data 2",
                          style: TextStyle(
                              fontSize: AppSize.s15, color: Colors.grey)),
                      SizedBox(
                        height: 1.h,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(LocaleKeys.send.tr())),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: TextField(
                      controller: textEditingController,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: LocaleKeys.Enteryourcompliaint.tr(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.w, color: ColorManager.sidBar),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 0.5.w, color: Colors.grey),
                        ),

                      ),
                      onTap: () =>Provider.of<ComplaintsViewModel>(context).storeClaim() ,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


