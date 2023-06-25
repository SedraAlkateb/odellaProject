import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
//   TextEditingController textEditingController = TextEditingController();
//   int dropdownTransportationLine = 0;
//   var viewModel;
// @override
//   void initState() {
//   viewModel = Provider.of<ComplaintsViewModel>(context, listen: false);
//   viewModel.start();
// //  Provider.of<ComplaintsViewModel>(context).start();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return OrientationBuilder(
//       builder: (BuildContext context, Orientation orientation) {
//         return Scaffold(
//           appBar:  AppBar(
//             actions: [
//               Provider.of<Not>(context).getCount()==0
//                   ? IconButton(onPressed: () {
//                 Navigator.pushNamed(context,Routes.notification);
//                     }, icon: const Icon(Icons.notifications))
//                   : Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: InkWell(
//                   child: Badge(
//                     badgeContent: Text("${ Provider.of<Not>(context).getCount()}",style: TextStyle(color: Colors.white),),
//
//                     child: Icon(Icons.notifications,size: AppSize.s30),
//                     badgeAnimation: BadgeAnimation.fade(animationDuration: Duration(milliseconds:250 )),
//                   ),
//                   onTap: ()
//                   {
//                     print("kkkkkk");
//                     Navigator.pushNamed(context,Routes.notification);
//                   },
//                 ),
//               ),
//             ],
//
//             title: Text(LocaleKeys.complaints.tr(),
//                 style: getBoldStyle(
//                     color: ColorManager.sidBarIcon, fontSize: FontSize.s20)),
//           ),
//           drawer:  NavBar(),
//           body: SingleChildScrollView(
//             child: orientation == Orientation.portrait
//                 ? Column(
//               children: [
//                 Padding(
//                   padding:  EdgeInsets.all(16.sp),
//                   child: TextField(
//                     controller: textEditingController,
//                     maxLines: 10,
//                     decoration: InputDecoration(
//                       hintText: LocaleKeys.Enteryourcompliaint.tr(),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             width: 1.w, color: ColorManager.sidBar),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide:
//                         BorderSide(width: 0.5.w, color: Colors.grey),
//                       ),
//                     ),
//                       onChanged: (value){Provider.of<ComplaintsViewModel>(context,listen: false).setDescription(value);
//                       textEditingController.text=value;
//                     }
//                   ),
//                 ),
//                 SizedBox(height: 2.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       LocaleKeys.selecttrip.tr(),
//                       style: TextStyle(fontSize: AppSize.s20),
//                     ),
//                     SizedBox(
//                       width: 10.w,
//                     ),
//                     DropdownButton(
//                         icon:
//                         const Icon(Icons.keyboard_arrow_down),
//                         hint: Text(
//                             LocaleKeys.transportationLines.tr()),
//                         items:Provider.of<ComplaintsViewModel>(context).getTrip()
//                             .map((e) => DropdownMenuItem(
//                           value: e.id,
//                           child: Text(
//                             "${Provider.of<ComplaintsViewModel>(context,
//                                 listen: false).date(e.time!.date)} ${e.time!.start} ",
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                                 fontSize: AppSize.s15),
//                           ),
//                         )).toList(),
//                         onChanged: (val) {
//                           Provider.of<ComplaintsViewModel>(context,
//                               listen: false)
//                               .setTripId(val!);
//                         }
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 2.h),
//                 const Text(
//                   "data 1",
//                   style:
//                   TextStyle(fontSize: AppSize.s15, color: Colors.grey),
//                 ),
//                 SizedBox(height: 2.h),
//                 const Text(
//                   "data 2",
//                   style:
//                   TextStyle(fontSize: AppSize.s15, color: Colors.grey),
//                 ),
//                 SizedBox(height: 2.h),
//                 ElevatedButton(
//                   onPressed: () {
//                     Provider.of<ComplaintsViewModel>(context,listen: false).storeClaim();
//                   },
//                   child: Text(
//                     LocaleKeys.send.tr(),
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//               ],
//             )
//                 : Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 1.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             '${LocaleKeys.selecttrip.tr()}'':',
//                             style: TextStyle(fontSize: AppSize.s20),
//                           ),
//                           SizedBox(
//                             width: 3.w,
//                           ),
//                           DropdownButton(
//                               icon:
//                               const Icon(Icons.keyboard_arrow_down),
//                               hint: Text(
//                                   LocaleKeys.transportationLines.tr()),
//                               items:Provider.of<ComplaintsViewModel>(context).getTrip()
//                                   .map((e) => DropdownMenuItem(
//                                 value: e.id,
//                                 child: Text(
//                                   "${e.time!.date} ${e.time!.start}",
//                                   overflow: TextOverflow.ellipsis,
//                                   style: const TextStyle(
//                                       fontSize: AppSize.s15),
//                                 ),
//                               )).toList(),
//                               onChanged: (val) {
//                                 Provider.of<ComplaintsViewModel>(context,
//                                     listen: false)
//                                     .setTripId(val!);
//                               }
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 1.h,
//                       ),
//                       const Text(
//                         "data 1",
//                         style: TextStyle(
//                             fontSize: AppSize.s15, color: Colors.grey),
//                       ),
//                       SizedBox(
//                         height: 1.h,
//                       ),
//                       const Text("data 2",
//                           style: TextStyle(
//                               fontSize: AppSize.s15, color: Colors.grey)),
//                       SizedBox(
//                         height: 1.h,
//                       ),
//                       ElevatedButton(
//                           onPressed: () {},
//                           child: Text(LocaleKeys.send.tr())),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.all(15.sp),
//                     child: TextField(
//                       controller: textEditingController,
//                       maxLines: 10,
//                       decoration: InputDecoration(
//                         hintText: LocaleKeys.Enteryourcompliaint.tr(),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               width: 1.w, color: ColorManager.sidBar),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(width: 0.5.w, color: Colors.grey),
//                         ),
//
//                       ),
//                       onTap: () =>Provider.of<ComplaintsViewModel>(context).storeClaim() ,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          LocaleKeys.comprating.tr(),
          style: getBoldStyle(
            color: ColorManager.sidBarIcon,
            fontSize: FontSize.s20,
          ),
        ),
        actions: [
          Provider.of<Not>(context, listen: true).getCount() == 0
              ? IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.notification);
              },
              icon: const Icon(Icons.notifications))
              : Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              child: Badge(
                badgeContent: Text(
                  "${Provider.of<Not>(context).getCount()}",
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(Icons.notifications, size: AppSize.s30),
                badgeAnimation: BadgeAnimation.fade(
                    animationDuration: Duration(milliseconds: 250)),
              ),
              onTap: () {
                print("kkkkkk");
                Navigator.pushNamed(context, Routes.notification);
              },
            ),
          ),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
              left: AppPadding.p20,
              right: AppPadding.p20,
              bottom: AppPadding.p20),
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
                    color: Colors.grey.shade300, width: AppSize.s1_5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppSize.s16),
                ),
              ),
              // fillColor: ColorManager.white,
              border: OutlineInputBorder(
                //  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
                borderSide:
                BorderSide(color: ColorManager.shadow, width: AppSize.s1_5),
              ),
              hintStyle: getRegularStyle(
                  color: ColorManager.icon, fontSize: FontSize.s16),
              hintText: "${LocaleKeys.searchtrip.tr()}",
              //       hintStyle:Theme.of(context).textTheme.bodySmall,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: AppPadding.p8),
                child: Icon(
                  Icons.search,
                  color: ColorManager.button,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child:
          // Provider.of<HomeViewModel>(context,listen: false).dataTransportationLinesSearch.length == 0
          // ? Center(
          // child: Text(
          // "No result found",
          // style: TextStyle(
          // color: ColorManager.shadow,
          // fontSize: FontSize.s22,
          // fontWeight: FontWeight.bold),
          // ),
          // )
          //     :
          Padding(
            padding: const EdgeInsets.only(
                left: AppPadding.p28,
                right: AppPadding.p28,
                bottom: AppPadding.p28),
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => const SizedBox(
                width: double.infinity,
                height: AppSize.s20,
                // color: Color,
              ),
              itemCount: 3,
              itemBuilder: (context, index) => Container(
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius:
                  const BorderRadius.all(Radius.circular(AppSize.s30)),
                  //        color: ColorManager.card,
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          SizedBox(width: 4.w,),
                          Text("${LocaleKeys.linename.tr()} : LINEE",style: getBoldStyle(color: Colors.black,fontSize: FontSize.s16),),
                        ],
                      ),
                      SizedBox(height: 1.h,),
                      Row(
                        children: [
                          SizedBox(width: 4.w,),
                          Text("${LocaleKeys.day.tr()} : Saturday",style: getMediumStyle(color: Colors.black,fontSize: FontSize.s16),),
                        ],
                      ),
                      SizedBox(height: 2.h,),
                      Row(
                        children: [
                          SizedBox(width: 4.w,),
                          Text("${LocaleKeys.ratingsent.tr()} :"),
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            //   allowHalfRating: true,
                            itemCount: 5,
                            itemSize:25,
                            itemPadding:  EdgeInsets.symmetric(
                                horizontal: 1.sp),
                            itemBuilder: (context, _) =>
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),

                            onRatingUpdate: (rating) {
                              // Provider.of<ProgramsViewModel>(context,
                              //     listen: false)
                              //     .evaluation(rating.toInt());
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h,),
                      TextField(
                          controller: textEditingController,
                          maxLines: 2,
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
                          onChanged: (value){
                          }
                      ),
                      SizedBox(height: 3.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          IconButton(icon: Icon(Icons.check_circle,size: 30,), onPressed: () {  },color: ColorManager.sidBar),
                        ],
                      ),



                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}


