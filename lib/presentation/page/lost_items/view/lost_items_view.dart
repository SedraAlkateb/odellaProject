
import 'dart:io';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/common/image/downloadImage.dart';
import 'package:untitled/presentation/page/lost_items/view_model/lost_items_viewmodle.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
import 'package:sizer/sizer.dart';
import '../../../resources/routes_manager.dart';
import '../../page_view_model.dart';
import '../../profile/view_model/profile_view_model.dart';

class LostItemsView extends StatefulWidget {
  const LostItemsView({Key? key}) : super(key: key);

  @override
  State<LostItemsView> createState() => _LostItemsViewState();
}

class _LostItemsViewState extends State<LostItemsView> {
  LostItemsViewModel lostItemsViewModel=instance<LostItemsViewModel>();
  @override
  void dispose() {
    lostItemsViewModel.dispose();
    super.dispose();
  }
  @override
void initState() {
Provider.of<LostItemsViewModel>(context,listen: false).start();
    super.initState();
  }
    Widget build(BuildContext context) {
String imageURL="";
      final mp = Provider.of<NavbarProvider>(context);
      return Sizer(builder: (context, orientation, deviceType) {
        // return MaterialApp(
        // debugShowCheckedModeBanner: false,
        // //useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,

        return Scaffold(
          // backgroundColor: Colors.lightGreenAccent,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.addLostItemRoute);
            },
            backgroundColor: Colors.white,
            child: Icon(
              Icons.add,
              color: ColorManager.button,
            ),
          ),
          body: SafeArea(
            child: orientation == Orientation.portrait
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.sp),
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
                          color: ColorManager.icon, fontSize: FontSize.s16),
                      hintText: StringsManager.searchlost,
                      //       hintStyle:Theme.of(context).textTheme.bodySmall,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 8.sp),
                        child: Icon(
                          Icons.search,
                          color: ColorManager.button,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                  child:
                  //Provider.of<HomeViewModel>(context,listen: false).dataTransportationLinesSearch.length == 0
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
                  ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 4.h,
                        ),
                    itemCount: 3,
                    itemBuilder: (context, index) =>
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(AppSize.s12)),
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.sp),
                          padding: EdgeInsets.all(4.sp),
                          child: imageURL.isNotEmpty
                          ?Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(2.sp),
                                    child: Container(
                                      child: Provider.of<ProfileViewModel>(
                                          context)
                                          .getIm() !=
                                          null
                                      //  profile1.getDownload()
                                          ? InkWell(
                                        onTap: () async {
                                          //await profile.updateImageFromGallory();
                                          //await profile.updateImage();
                                        },
                                        child: Container(
                                          width: 14.w,
                                          height: 10.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              //color: Colors.grey[300],
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: FileImage(
                                                      Provider.of<
                                                          ProfileViewModel>(
                                                          context)
                                                          .getIm() ??
                                                          File("")))),
                                        ),
                                      )
                                          : InkWell(
                                        onTap: () async {
                                          // await profile.updateImageFromGallory();
                                          // await profile.updateImage();
                                        },
                                        child: Container(
                                            width: 14.w,
                                            height: 10.h,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(Icons.add,
                                                size: 50,
                                                color:
                                                Color(0xFFFFFFFF))),
                                      )
                                      //:profile1.getLocalPath()!=null?
                                      ,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "name",
                                        style: TextStyle(
                                          color: ColorManager.black,
                                          //fontSize: 18,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "email",
                                        style: TextStyle(
                                          color: ColorManager.lightGrey,
                                          //fontSize: 18,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              ExpandableText(
                                '${StringsManager
                                    .description}'': This Flutter package includes the widget ExpandableText which you can use to initially only show a defined number of lines of a probably long text.',
                                expandText: '${StringsManager.show_more}',
                                collapseText: '${StringsManager.show_less}',
                                maxLines: 1,
                                linkColor: ColorManager.button,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${ StringsManager.status}' ': ',
                                    style: TextStyle(
                                      color: ColorManager.lightGrey,
                                    ),
                                  ),
                                  const Text(
                                    "data",
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(imageURL),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                            ],
                          )
                              :Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(2.sp),
                                    child: Container(
                                      child: Provider.of<ProfileViewModel>(
                                          context)
                                          .getIm() !=
                                          null
                                      //  profile1.getDownload()
                                          ? InkWell(
                                        onTap: () async {
                                          //await profile.updateImageFromGallory();
                                          //await profile.updateImage();
                                        },
                                        child: Container(
                                          width: 14.w,
                                          height: 10.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              //color: Colors.grey[300],
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: FileImage(
                                                      Provider.of<
                                                          ProfileViewModel>(
                                                          context)
                                                          .getIm() ??
                                                          File("")))),
                                        ),
                                      )
                                          : InkWell(
                                        onTap: () async {
                                          // await profile.updateImageFromGallory();
                                          // await profile.updateImage();
                                        },
                                        child: Container(
                                            width: 14.w,
                                            height: 10.h,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(Icons.person,
                                                size: 50,
                                                color:
                                                Color(0xFFFFFFFF))),
                                      )
                                      //:profile1.getLocalPath()!=null?
                                      ,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "name",
                                        style: TextStyle(
                                          color: ColorManager.black,
                                          //fontSize: 18,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "email",
                                        style: TextStyle(
                                          color: ColorManager.lightGrey,
                                          //fontSize: 18,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              ExpandableText(
                                '${StringsManager
                                    .description}'': This Flutter package includes the widget ExpandableText which you can use to initially only show a defined number of lines of a probably long text.',
                                expandText: '${StringsManager.show_more}',
                                collapseText: '${StringsManager.show_less}',
                                maxLines: 3,
                                linkColor: ColorManager.button,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${ StringsManager.status}' ': ',
                                    style: TextStyle(
                                      color: ColorManager.lightGrey,
                                    ),
                                  ),
                                  const Text(
                                    "data",
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                            ],
                          )
                        ),
                  ),
                ),
              ],
            )
                : Column(
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
                        hintText: StringsManager.searchlost,
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
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 2.h,
                        ),
                    itemCount: 3,
                    itemBuilder: (context, index) =>
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(AppSize.s12)),
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 42.sp),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.w),
                                            child: Container(
                                              child:
                                              Provider.of<ProfileViewModel>(
                                                  context)
                                                  .getIm() !=
                                                  null
                                              //  profile1.getDownload()
                                                  ? InkWell(
                                                onTap: () async {
                                                  //await profile.updateImageFromGallory();
                                                  //await profile.updateImage();
                                                },
                                                child: Container(
                                                  width: 25.w,
                                                  height: 8.h,
                                                  decoration:
                                                  BoxDecoration(
                                                      shape: BoxShape
                                                          .circle,
                                                      //color: Colors.grey[300],
                                                      image: DecorationImage(
                                                          fit: BoxFit
                                                              .contain,
                                                          image: FileImage(
                                                              Provider.of<
                                                                  ProfileViewModel>(
                                                                  context)
                                                                  .getIm() ??
                                                                  File("")))),
                                                ),
                                              )
                                                  : InkWell(
                                                onTap: () async {
                                                  // await profile.updateImageFromGallory();
                                                  // await profile.updateImage();
                                                },
                                                child: Container(
                                                    width: 25.w,
                                                    height: 8.h,
                                                    decoration:
                                                    BoxDecoration(
                                                      color: Colors
                                                          .grey[300],
                                                      shape: BoxShape
                                                          .circle,
                                                    ),
                                                    child: const Icon(
                                                        Icons.add,
                                                        size: 50,
                                                        color: Color(
                                                            0xFFFFFFFF))),
                                              )
                                              //:profile1.getLocalPath()!=null?
                                              ,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "name",
                                                style: TextStyle(
                                                  color: ColorManager.black,
                                                  //fontSize: 18,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "email",
                                                style: TextStyle(
                                                  color: ColorManager.lightGrey,
                                                  //fontSize: 18,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      ExpandableText(
                                        '${StringsManager
                                            .description}'': This Flutter package includes the widget ExpandableText which you can use to initially only show a defined number of lines of a probably long text.',
                                        expandText: '${StringsManager.show_more}',
                                        collapseText: '${StringsManager
                                            .show_less}',
                                        maxLines: 1,
                                        linkColor: ColorManager.button,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${ StringsManager.status}' ': ',
                                            style: TextStyle(
                                              color: ColorManager.lightGrey,
                                            ),
                                          ),
                                          const Text(
                                            "data",
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: imageURL.isNotEmpty
                                    ? Container(
                                  height: 18.h,
                                  margin:
                                  EdgeInsets.all(7.sp),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(imageURL),
                                          fit: BoxFit.fill)),
                                )
                                    :  Center(child: Text(StringsManager.no_image)),
                              ),
                            ],
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      });

    }

    Widget contentWidget(){
  //    if(Provider.of<HomeViewModel>(context).getIsPos()){
    //    WidgetsBinding.instance.addPostFrameCallback((_) {
     //     Provider.of<HomeViewModel>(context,listen: false).setIsPos(false);
      //    _navigator.pushNamed(Routes.mapPositionRoute);
      //  });
     // }
      return  Column(

          children: [

            Padding(
              padding:
              const EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20,bottom: AppPadding.p20),
              child: TextFormField(
                onChanged: (value)  {
                  try {
                    Provider.of<LostItemsViewModel>(context,listen: false).setSearch(value);
                  } catch (e, s) {
                    print(s);
                  }

                },
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300,width: AppSize.s1_5),
                    borderRadius:const BorderRadius.all(Radius.circular(AppSize.s16),),

                  ),
                  // fillColor: ColorManager.white,
                  border: OutlineInputBorder(
                    //  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
                    borderSide: BorderSide(color: ColorManager.shadow, width: AppSize.s1_5),
                  ),
                  hintStyle: getRegularStyle(color: ColorManager.icon,fontSize: FontSize.s16),
                  hintText: StringsManager.search,
                  //       hintStyle:Theme.of(context).textTheme.bodySmall,
                  prefixIcon:  Padding(
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
                Provider.of<LostItemsViewModel>(context).getSearch()?.length == 0
                    ? Center(
                  child: Text(
                    "No result found",
                    style: TextStyle(
                        color: ColorManager.shadow,
                        fontSize: FontSize.s22,
                        fontWeight: FontWeight.bold),
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28,right: AppPadding.p28,bottom: AppPadding.p28),
                  child:
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,

                    itemCount: Provider.of<LostItemsViewModel>(context,listen: false).search.length,
                    itemBuilder: (context, index) =>
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Provider.of<LostItemsViewModel>(context).getSearch()?[index].description ??"",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:Theme.of(context).textTheme.labelLarge,
                            ),Center(
                              child: FadeInImage.assetNetwork(
                                placeholder:ImageAssets.leftArrowIc , // الصورة المؤقتة
                                image:  ImageDownloader.getUrl(
                                    Provider.of<LostItemsViewModel>(context)
                                        .getListFound()?[index].image??""),// الصورة الفعلية
                                fit: BoxFit.cover,
                                imageErrorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.grey, // الخلفية البديلة
                                    ),
                                  );
                                },
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                              ),
                            ),

                          ],
                        ),
                  ),
                ))
          ]);
    }
  }



AppBar getAppBarLostItem() {
  return AppBar(
    title: Text(StringsManager.lostItems,
        style: getBoldStyle(
            color: ColorManager.sidBarIcon, fontSize: FontSize.s20)),
  );
}
