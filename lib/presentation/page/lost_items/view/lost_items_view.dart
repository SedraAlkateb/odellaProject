import 'dart:io';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/common/image/downloadImage.dart';
import 'package:untitled/presentation/detail_screen/view/detail_screen_view.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/page/drawer/view/drawer.dart';
import 'package:untitled/presentation/page/lost_items/view_model/lost_items_viewmodle.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
import 'package:sizer/sizer.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../resources/routes_manager.dart';
import '../../page_view_model.dart';
import '../../profile/view_model/profile_view_model.dart';

class LostItemsView extends StatefulWidget {
  const LostItemsView({Key? key}) : super(key: key);

  @override
  State<LostItemsView> createState() => _LostItemsViewState();
}

class _LostItemsViewState extends State<LostItemsView> {
  LostItemsViewModel lostItemsViewModel = instance<LostItemsViewModel>();
  @override
  void dispose() {
    lostItemsViewModel.dispose();
    super.dispose();
  }

  var viewModel;
  @override
  void initState() {
    viewModel = Provider.of<LostItemsViewModel>(context, listen: false);
    viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        drawer:  NavBar(),
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

          title: Text(LocaleKeys.lostItems.tr(),
              style: getBoldStyle(
                  color: ColorManager.sidBarIcon, fontSize: FontSize.s20)),
        ),
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
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: TextFormField(
                  onChanged: (value) {
                    try {
                      Provider.of<LostItemsViewModel>(context,
                          listen: false)
                          .setSearch(value);
                    } catch (e, s) {
                      print(s);
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.shade300, width: 0.5.w),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(AppSize.s16),
                      ),
                    ),
                    // fillColor: ColorManager.white,
                    border: OutlineInputBorder(
                      //  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
                      borderSide: BorderSide(
                          color: ColorManager.shadow, width: 0.5.w),
                    ),
                    hintStyle: getRegularStyle(
                        color: ColorManager.icon, fontSize: FontSize.s16),
                    hintText: LocaleKeys.Searchlost.tr(),
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
              Provider.of<LostItemsViewModel>(context)
                  .getSearch()
                  .length ==
                  0
                  ? Center(
                child: Text(
                  "No result found",
                  style: TextStyle(
                      color: ColorManager.shadow,
                      fontSize: FontSize.s22,
                      fontWeight: FontWeight.bold),
                ),
              )
                  : Expanded(
                child:
                ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 4.h,
                  ),
                  itemCount: Provider.of<LostItemsViewModel>(
                      context,
                      listen: false)
                      .search
                      .length,
                  itemBuilder: (context, index) => Container(

                      decoration: BoxDecoration(
                        border:
                        Border.all(color: Colors.grey.shade300),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppSize.s12)),
                      ),
                      margin:
                      EdgeInsets.symmetric(horizontal: 20.sp),
                      padding: EdgeInsets.all(4.sp),
                      child: Provider.of<LostItemsViewModel>(context, listen: false).getSearch()[index]
                          .user?.image!=null &&Provider.of<LostItemsViewModel>(context, listen: false).getSearch()[index].user?.image!=""
                          ? Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(2.sp),
                                child: Container(
                                  width: 15.w,
                                  height: 15.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: FadeInImage
                                        .assetNetwork(
                                      placeholder: ImageAssets
                                          .gray, // الصورة المؤقتة
                                      image: ImageDownloader.getUrl(
                                          Provider.of<LostItemsViewModel>(
                                              context)
                                              .getListFound()?[
                                          index]
                                              .user?.image ??
                                              ""), // الصورة الفعلية
                                      fit: BoxFit.cover,
                                      imageErrorBuilder:
                                          (BuildContext context,
                                          Object exception,
                                          StackTrace?
                                          stackTrace) {
                                        return Container(
                                          decoration:
                                          BoxDecoration(
                                            color: Colors
                                                .grey, // الخلفية البديلة
                                          ),
                                        );
                                      },
                                      fadeInDuration: Duration(
                                          milliseconds: 500),
                                      fadeOutDuration: Duration(
                                          milliseconds: 500),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${Provider.of<LostItemsViewModel>(context).getSearch()[index].user!.firstName} ${Provider.of<LostItemsViewModel>(context).getSearch()[index].user!.lastName}",
                                    style: TextStyle(
                                      color:
                                      ColorManager.black,
                                      //fontSize: 18,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${Provider.of<LostItemsViewModel>(context).getSearch()[index].user!.email}",
                                    style: TextStyle(
                                      color: ColorManager
                                          .lightGrey,
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
                            '${LocaleKeys.description.tr()} :'
                                '${Provider.of<LostItemsViewModel>(context).getSearch()[index].description }' ,
                            expandText:
                            '${LocaleKeys.showmore.tr()}',
                            collapseText:
                            '${LocaleKeys.showless.tr()}',
                            maxLines: 1,
                            linkColor: ColorManager.button,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            children: [
                              Text(
                                '${LocaleKeys.status.tr()}'
                                    ': ',
                                style: TextStyle(
                                  color:
                                  ColorManager.lightGrey,
                                ),
                              ),
                              Text(
                                "${Provider.of<LostItemsViewModel>(context).getSearch()[index].trip!.status}"  ,
                                maxLines: 1,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Center(
                            child: Container(
                              width: 80.w,
                              height: 80.w,
                              child: FadeInImage.assetNetwork(
                                placeholder:
                                ImageAssets.gray, // الصورة المؤقتة
                                image: ImageDownloader.getUrl(
                                    Provider.of<LostItemsViewModel>(context)
                                        .getListFound()?[index]
                                        .image ??
                                        ""), // الصورة الفعلية
                                fit: BoxFit.cover,
                                imageErrorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Container(
                                    width: double.infinity,
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
                          SizedBox(
                            height: 3.h,
                          ),
                        ],
                      )
                          : Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(2.sp),
                                child: Container(
                                  // width: 14.w,
                                  // height: 10.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child:
                                  FadeInImage
                                      .assetNetwork(
                                    placeholder: ImageAssets
                                        .gray, // الصورة المؤقتة
                                    image: ImageDownloader.getUrl(

                                        Provider.of<LostItemsViewModel>(
                                            context)
                                            .getListFound()?[
                                        index]
                                            .user?.image ??
                                            ""), // الصورة الفعلية
                                    fit: BoxFit.cover,
                                    imageErrorBuilder:
                                        (BuildContext context,
                                        Object exception,
                                        StackTrace?
                                        stackTrace) {
                                      return Container(
                                        decoration:
                                        BoxDecoration(
                                            color: Colors
                                                .grey, // الخلفية البديلة
                                            shape: BoxShape.circle
                                        ),
                                      );
                                    },
                                    fadeInDuration: Duration(
                                        milliseconds: 500),
                                    fadeOutDuration: Duration(
                                        milliseconds: 500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${Provider.of<LostItemsViewModel>(context).getSearch()[index].user!.firstName} ${Provider.of<LostItemsViewModel>(context).getSearch()[index].user!.lastName}" ,

                                    style: TextStyle(
                                      color:
                                      ColorManager.black,
                                      //fontSize: 18,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${Provider.of<LostItemsViewModel>(context).getSearch()[index].user!.email}",
                                    style: TextStyle(
                                      color: ColorManager
                                          .lightGrey,
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
                            '${LocaleKeys.description.tr()} :'
                                '${Provider.of<LostItemsViewModel>(context).getSearch()[index].description }' ,
                            expandText:
                            '${LocaleKeys.showmore.tr()}',
                            collapseText:
                            '${LocaleKeys.showless.tr()}',
                            maxLines: 1,
                            linkColor: ColorManager.button,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            children: [
                              Text(
                                '${LocaleKeys.status.tr()}'
                                    ': ',
                                style: TextStyle(
                                  color:
                                  ColorManager.lightGrey,
                                ),
                              ),
                              Text(
                                "${Provider.of<LostItemsViewModel>(context).getSearch()[index].trip!.status}" ,
                                maxLines: 1,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          // SizedBox(
                          //   height: 3.h,
                          // ),
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
                margin: EdgeInsets.symmetric(horizontal: 40.sp),
                child: TextFormField(
                  onChanged: (value) {
                    try {
                      Provider.of<LostItemsViewModel>(context,
                          listen: false)
                          .setSearch(value);
                    } catch (e, s) {
                      print(s);
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.shade300, width: 0.5.w),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(AppSize.s16),
                        ),
                      ),
                      // fillColor: ColorManager.white,
                      border: OutlineInputBorder(
                        //  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
                        borderSide: BorderSide(
                            color: ColorManager.shadow, width: 0.5.w),
                      ),
                      hintStyle: getRegularStyle(
                          color: ColorManager.icon,
                          fontSize: FontSize.s16),
                      hintText: LocaleKeys.Searchlost.tr(),
                      //       hintStyle:Theme.of(context).textTheme.bodySmall,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 8.sp),
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
              Provider.of<LostItemsViewModel>(context)
                  .getSearch()
                  .length ==
                  0
                  ? Center(
                child: Text(
                  "No result found",
                  style: TextStyle(
                      color: ColorManager.shadow,
                      fontSize: FontSize.s22,
                      fontWeight: FontWeight.bold),
                ),
              )
                  :Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 2.h,
                  ),
                  itemCount: Provider.of<LostItemsViewModel>(context,
                      listen: false)
                      .search
                      .length,
                  itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppSize.s12)),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 42.sp),
                      child:
                      Provider.of<LostItemsViewModel>(context, listen: false).getSearch()[index].user?.image!=null &&Provider.of<LostItemsViewModel>(context, listen: false).getSearch()[index].user?.image!=""
                          ?
                      Row(
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
                                        padding: EdgeInsets.all(2.sp),
                                        child: Container(
                                          width: 15.w,
                                          height: 15.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: FadeInImage
                                                .assetNetwork(
                                              placeholder: ImageAssets
                                                  .gray, // الصورة المؤقتة
                                              image: ImageDownloader.getUrl(
                                                  Provider.of<LostItemsViewModel>(
                                                      context)
                                                      .getListFound()?[
                                                  index]
                                                      .user?.image ??
                                                      ""), // الصورة الفعلية
                                              fit: BoxFit.cover,
                                              imageErrorBuilder:
                                                  (BuildContext context,
                                                  Object exception,
                                                  StackTrace?
                                                  stackTrace) {
                                                return Container(
                                                  decoration:
                                                  BoxDecoration(
                                                    color: Colors
                                                        .grey, // الخلفية البديلة
                                                  ),
                                                );
                                              },
                                              fadeInDuration: Duration(
                                                  milliseconds: 500),
                                              fadeOutDuration: Duration(
                                                  milliseconds: 500),
                                            ),
                                          ),
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
                                            "${Provider.of<LostItemsViewModel>(context).getSearch()[index].user!.firstName} ${Provider.of<LostItemsViewModel>(context).getSearch()[index].user!.lastName}",
                                            style: TextStyle(
                                              color: ColorManager.black,
                                              //fontSize: 18,
                                              //fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "${Provider.of<LostItemsViewModel>(context).getSearch()[index].user!.email}",
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
                                    '${LocaleKeys.description.tr()} :'
                                        '${Provider.of<LostItemsViewModel>(context).getSearch()[index].description }' ,
                                    expandText:
                                    '${LocaleKeys.showmore.tr()}',
                                    collapseText:
                                    '${LocaleKeys.showless.tr()}',
                                    maxLines: 1,
                                    linkColor: ColorManager.button,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${LocaleKeys.status.tr()}' ': ',
                                        style: TextStyle(
                                          color: ColorManager.lightGrey,
                                        ),
                                      ),
                                      Text(
                                        "${Provider.of<LostItemsViewModel>(context).getSearch()[index].trip!.status}" ,
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
                            child: Container(
                              height: 40.w,
                              width: 40.w,
                              child: FadeInImage.assetNetwork(
                                placeholder:
                                ImageAssets.gray, // الصورة المؤقتة
                                image: ImageDownloader.getUrl(
                                    Provider.of<LostItemsViewModel>(context)
                                        .getListFound()?[index]
                                        .image ??
                                        ""), // الصورة الفعلية
                                fit: BoxFit.fitHeight,
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
                        ],
                      ):
                      Row(
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
                                                  image: DecorationImage(
                                                      fit: BoxFit
                                                          .contain,
                                                      image: FileImage(Provider.of<ProfileViewModel>(context).getIm() ??
                                                          File("")))),
                                            ),
                                          )
                                              : InkWell(
                                            onTap: () async {},
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
                                            "${Provider.of<LostItemsViewModel>(context).getSearch()[index].user!.firstName} ${Provider.of<LostItemsViewModel>(context).getSearch()[index].user!.lastName}",
                                            style: TextStyle(
                                              color: ColorManager.black,
                                              //fontSize: 18,
                                              //fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "${Provider.of<LostItemsViewModel>(context).getSearch()[index].user!.email}",
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
                                    '${LocaleKeys.description.tr()} :'
                                        '${Provider.of<LostItemsViewModel>(context).getSearch()[index].description }' ,
                                    expandText:
                                    '${LocaleKeys.showmore.tr()}',
                                    collapseText:
                                    '${LocaleKeys.showless.tr()}',
                                    maxLines: 1,
                                    linkColor: ColorManager.button,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${LocaleKeys.status.tr()}' ': ',
                                        style: TextStyle(
                                          color: ColorManager.lightGrey,
                                        ),
                                      ),
                                      Text(
                                        "${Provider.of<LostItemsViewModel>(context).getSearch()[index].trip!.status}" ,
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
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) {
                                  return DetailScreenView(imageUrl: Provider.of<LostItemsViewModel>(context)
                                      .getListFound()?[index]
                                      .image ??"");
                                }));
                              },
                              child: Center(
                                child: Hero(
                                  tag: "imageHero",
                                  child:
                                  FadeInImage.assetNetwork(
                                    placeholder:
                                    ImageAssets.gray, // الصورة المؤقتة
                                    image: ImageDownloader.getUrl(
                                        Provider.of<LostItemsViewModel>(context)
                                            .getListFound()?[index]
                                            .image ??
                                            ""), // الصورة الفعلية
                                    fit: BoxFit.cover,
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
                        ],
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

}


