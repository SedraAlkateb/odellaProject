import 'dart:io';

import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/page/drawer/view/drawer.dart';
import 'package:untitled/presentation/page/profile/view_model/profile_view_model.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
import 'package:sizer/sizer.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/routes_manager.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileViewModel profileViewModel = instance<ProfileViewModel>();
  GlobalKey<FormBuilderState> _fbKey2 = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    Provider.of<ProfileViewModel>(context, listen: false).start();
    super.initState();
  }

  @override
  void dispose() {
    profileViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) =>
          Scaffold(
            drawer: NavBar(),
            appBar: AppBar(
              actions: [
                Provider.of<Not>(context).getCount() == 0
                    ? IconButton(onPressed: () {
                  Navigator.pushNamed(context, Routes.notification);
                }, icon: const Icon(Icons.notifications))
                    : Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    child: Badge(
                      badgeContent: Text(
                        "${ Provider.of<Not>(context).getCount()}",
                        style: TextStyle(color: Colors.white),),

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
            body: contentWidget(),
          ),
    );
  }

  Widget contentWidget() {
    var profile = Provider.of<ProfileViewModel>(context, listen: false);
    var profile1 = Provider.of<ProfileViewModel>(context);
    TextEditingController _firstNameController =
    TextEditingController(text: profile1.getFirstName());
    TextEditingController _lastNameController =
    TextEditingController(text: profile1.getLastName());
    TextEditingController _phoneNumberController =
    TextEditingController(text: profile1.getPhone());
    TextEditingController _streetController =
    TextEditingController(text: profile1.getStreet());
    return Consumer<ProfileViewModel>(
      builder: (context, model, child) =>
          Sizer(
            builder: (context, orientation, deviceType) {
              return SafeArea(
                child: orientation == Orientation.portrait
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(16.sp),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      child: Provider.of<ProfileViewModel>(
                                          context)
                                          .getIm() !=
                                          null
                                      //  profile1.getDownload()
                                          ? InkWell(
                                        onTap: () async {

                                          showDialogFunc(
                                              context, 40.h,40.h,40.w,40.w);
                                        },
                                        child: Container(
                                          width: 28.w,
                                          height: 17.h,
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
                                          await profile
                                              .updateImageFromGallory();
                                          await profile.updateImage();
                                        },
                                        child: Container(
                                            width: 28.w,
                                            height: 17.h,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(Icons.add,
                                                size: AppSize.s50,
                                                color: Color(0xFFFFFFFF))),
                                      )
                                      //:profile1.getLocalPath()!=null?
                                      ,
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: InkWell(
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorManager.sidBarIcon,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.edit,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onTap: () async
                                        {
                                          await profile
                                              .updateImageFromGallory();
                                          await profile.updateImage();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      profile1.getName() ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeightManager.bold,
                                          fontSize: FontSize.s18),
                                    ),
                                    Text(
                                      profile1.getEmail(),
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyLarge,
                                    ),
                                    Text(
                                      profile1.getPhone(),
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyLarge,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h,),
                            Divider(height: 3.h,
                              color: ColorManager.sidBarIcon,
                              thickness: 1,),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.sp,left: 20.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.person,
                                    size: AppSize.s25,
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(LocaleKeys.eFirstName.tr(),
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodySmall),
                                      SizedBox(
                                        width: 55.w,
                                        child: TextField(
                                            controller: _firstNameController,

                                            onChanged: (value) {
                                              Provider.of<ProfileViewModel>(
                                                  context, listen: false)
                                                  .updateFirstName(value);
                                            }

                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.person,
                                    size: AppSize.s25,
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(LocaleKeys.eLastName.tr(),
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodySmall),
                                      SizedBox(
                                        width: 55.w,
                                        child: TextField(
                                          controller: _lastNameController,
                                          onChanged: (value) {
                                            Provider.of<ProfileViewModel>(
                                                context, listen: false)
                                                .updateLastName(value);
                                            _lastNameController.text = value;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.streetview,
                                    size: AppSize.s25,
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  Street",
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodySmall),
                                      SizedBox(
                                        width: 55.w,
                                        child: TextField(
                                          controller: _streetController,
                                          onChanged: (value) {
                                            Provider.of<ProfileViewModel>(
                                                context, listen: false)
                                                .updateStreet(value);

                                            _streetController.text = value;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.phone,
                                    size: AppSize.s25,
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(LocaleKeys.ePhoneNumber.tr(),
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodySmall),
                                      SizedBox(
                                        width: 55.w,
                                        child: TextField(
                                          controller: _phoneNumberController,
                                          onChanged: (value) {
                                            Provider.of<ProfileViewModel>(
                                                context, listen: false)
                                                .updatePhone(value);

                                            _phoneNumberController.text = value;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Divider(
                                height: 3.h,
                                thickness: 1,
                                color: ColorManager.sidBarIcon,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.location_city,size: AppSize.s25,),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("   City :"),
                                      SizedBox(
                                        height: 14.h,
                                        width: 70.w,
                                        child: DropdownButtonFormField(
                                            icon:
                                            const Icon(Icons.keyboard_arrow_down),
                                            hint: Text(model.getProfileCity()),
                                            items: model
                                                .getCities()
                                                .map((e) =>
                                                DropdownMenuItem(
                                                  value: e.id,
                                                  child: Text(" ${e.name}",
                                                    overflow: TextOverflow.ellipsis,),
                                                ))
                                                .toList(),
                                            onChanged: (val) {
                                              if (_fbKey2.currentState != null) {
                                                _fbKey2.currentState?.reset();
                                              }
                                              model.setCityId(val!);
                                              model.getAreasByIdCity(val);
                                            }),
                                      ),
                                    ],
                                  ),

                                ],
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Icon(Icons.area_chart_outlined,size: AppSize.s25,),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text("   Area :"),
                                      SizedBox(
                                        height: 14.h,
                                        width: 70.w,
                                        child: FormBuilder(
                                          key: _fbKey2,
                                          child: DropdownButtonFormField(
                                              icon:
                                              const Icon(Icons.keyboard_arrow_down),
                                              hint: Text(model.getProfileArea()),
                                              items: model
                                                  .getAreas()
                                                  .map((e) =>
                                                  DropdownMenuItem(
                                                    value: e.id,
                                                    child: Text(" ${e.name}",
                                                      overflow: TextOverflow.ellipsis,),
                                                  ))
                                                  .toList(),
                                              onChanged: (val) {
                                                model.setAreaId(val!);
                                              }),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Icon(Icons.account_balance,size: AppSize.s25,),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("   University :"),
                                      SizedBox(
                                        height: 14.h,
                                        width: 70.w,
                                        child: DropdownButtonFormField(
                                            icon:
                                            const Icon(Icons.keyboard_arrow_down),
                                            hint: Text(model.getProfileUni()),
                                            validator: (value) {
                                              if (value == null) {
                                                return LocaleKeys.universities.tr();
                                              }
                                              return null;
                                            },
                                            items: model
                                                .getUniversities()
                                                .map((e) =>
                                                DropdownMenuItem(
                                                  value: e.id,
                                                  child: Text(" ${e.name}",
                                                    overflow: TextOverflow.ellipsis,),
                                                ))
                                                .toList(),
                                            onChanged: (val) {
                                              model.setUniversityId(val!);
                                            }),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                height: 3.h,
                                thickness: 1,
                                color: ColorManager.sidBarIcon,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("${LocaleKeys.subscription.tr()} : lllllll"),
                                  Text("${LocaleKeys.daysNumber.tr()} : lllllll"),
                                  Text("${LocaleKeys.price.tr()} : lllllll"),
                                ],),


                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppPadding.p28,
                                    horizontal: AppPadding.p28),
                                child: ElevatedButton(
                                  onPressed: () {
                                    profile.UpdateStudent();
                                  },
                                  child: Text(LocaleKeys.save.tr()),
                                ),
                              ),


                              SizedBox(
                                height: 5.h,
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                    : Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 15.h,
                            padding: const EdgeInsets.all(AppPadding.p20),
                            child: Row(
                              children:[
                                Stack(
                                  children: [
                                    Container(
                                      child: Provider.of<ProfileViewModel>(
                                          context)
                                          .getIm() !=
                                          null
                                      //  profile1.getDownload()
                                          ? InkWell(
                                        onTap: () async {
                                          //Navigator.pushNamed(context, Routes.display_image);
                                          showDialogFunc(
                                              context, 30.h,30.h,40.w,40.w);
                                        },
                                        child: Container(
                                          width: 28.w,
                                          height: 17.h,
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
                                          await profile
                                              .updateImageFromGallory();
                                          await profile.updateImage();
                                        },
                                        child: Container(
                                            width: 28.w,
                                            height: 17.h,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(Icons.add,
                                                size: AppSize.s50,
                                                color: Color(0xFFFFFFFF))),
                                      )
                                      //:profile1.getLocalPath()!=null?
                                      ,
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: InkWell(
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorManager.sidBarIcon,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.edit,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onTap: () async
                                        {
                                          await profile
                                              .updateImageFromGallory();
                                          await profile.updateImage();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      profile1.getName() ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeightManager.bold,
                                          fontSize: FontSize.s18),
                                    ),
                                    Text(
                                      profile1.getEmail(),
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyLarge,
                                    ),
                                    Text(
                                      profile1.getPhone(),
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyLarge,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 200.w,
                            child: Divider(height: 2.h,
                              color: ColorManager.sidBarIcon,
                              thickness: 1,),
                          ),
                          Expanded(
                            child: SingleChildScrollView(

                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppSize.s45),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    // Text(LocaleKeys.profile,style: Theme.of(context).textTheme.labelLarge),
                                    // const SizedBox(
                                    //   height: 16,
                                    // ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          size: AppSize.s25,
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(LocaleKeys.eFirstName.tr(),
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodySmall),
                                            SizedBox(
                                              width: 100.w,
                                              child: TextField(
                                                controller: _firstNameController,
                                                onChanged: (value) {
                                                  _firstNameController.text =
                                                      value;
                                                  Provider.of<ProfileViewModel>(
                                                      context).updateFirstName(
                                                      value);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          size: AppSize.s25,
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(LocaleKeys.eLastName.tr(),
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodySmall),
                                            SizedBox(
                                              width: 100.w,
                                              child: TextField(
                                                controller: _lastNameController,
                                                onChanged: (value) {
                                                  Provider.of<ProfileViewModel>(
                                                      context, listen: false)
                                                      .updateLastName(value);
                                                  _lastNameController.text =
                                                      value;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Icon(
                                          Icons.streetview,
                                          size: AppSize.s25,
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text("LocaleKeys.street",
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodySmall),
                                            SizedBox(
                                              width: 100.w,
                                              child: TextField(
                                                controller: _streetController,
                                                onChanged: (value) {
                                                  Provider.of<ProfileViewModel>(
                                                      context, listen: false)
                                                      .updateStreet(value);
                                                  _streetController.text =
                                                      value;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Icon(
                                          Icons.phone,
                                          size: AppSize.s25,
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(LocaleKeys.ePhoneNumber.tr(),
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodySmall),
                                            SizedBox(
                                              width: 100.w,
                                              child: TextField(
                                                controller: _phoneNumberController,
                                                onChanged: (value) {
                                                  Provider.of<ProfileViewModel>(
                                                      context, listen: false)
                                                      .updatePhone(value);

                                                  _phoneNumberController.text =
                                                      value;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: AppPadding.p28,
                                          horizontal: AppPadding.p28),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          profile.UpdateStudent();
                                        },
                                        child: Text(LocaleKeys.save.tr()),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_city,size: AppSize.s25,),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("   City :"),
                                    SizedBox(
                                      height: 10.h,
                                      width: 120.w,
                                      child: DropdownButtonFormField(
                                          icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                          hint: Text(model.getProfileCity()),
                                          items: model
                                              .getCities()
                                              .map((e) =>
                                              DropdownMenuItem(
                                                value: e.id,
                                                child: Text(" ${e.name}",
                                                  overflow: TextOverflow.ellipsis,),
                                              ))
                                              .toList(),
                                          onChanged: (val) {
                                            if (_fbKey2.currentState != null) {
                                              _fbKey2.currentState?.reset();
                                            }
                                            model.setCityId(val!);
                                            model.getAreasByIdCity(val);
                                          }),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Icon(Icons.area_chart_outlined,size: AppSize.s25,),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text("   Area :"),
                                    SizedBox(
                                      height: 10.h,
                                      width: 120.w,
                                      child: FormBuilder(
                                        key: _fbKey2,
                                        child: DropdownButtonFormField(
                                            icon:
                                            const Icon(Icons.keyboard_arrow_down),
                                            hint: Text(model.getProfileArea()),
                                            items: model
                                                .getAreas()
                                                .map((e) =>
                                                DropdownMenuItem(
                                                  value: e.id,
                                                  child: Text(" ${e.name}",
                                                    overflow: TextOverflow.ellipsis,),
                                                ))
                                                .toList(),
                                            onChanged: (val) {
                                              model.setAreaId(val!);
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Icon(Icons.account_balance,size: AppSize.s25,),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("   University :"),
                                    SizedBox(
                                      height: 10.h,
                                      width: 120.w,
                                      child: DropdownButtonFormField(
                                          icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                          hint: Text(model.getProfileUni()),
                                          validator: (value) {
                                            if (value == null) {
                                              return LocaleKeys.universities.tr();
                                            }
                                            return null;
                                          },
                                          items: model
                                              .getUniversities()
                                              .map((e) =>
                                              DropdownMenuItem(
                                                value: e.id,
                                                child: Text(" ${e.name}",
                                                  overflow: TextOverflow.ellipsis,),
                                              ))
                                              .toList(),
                                          onChanged: (val) {
                                            model.setUniversityId(val!);
                                          }),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(height: 2.h,
                              color: ColorManager.sidBarIcon,
                              thickness: 1,),
                            SizedBox(height: 4.h,),
                            Text("${LocaleKeys.subscription.tr()} : lllllll"),
                            Text("${LocaleKeys.daysNumber.tr()} : lllllll"),
                            Text("${LocaleKeys.price.tr()} : lllllll"),
                            SizedBox(height: 4.h,),
                          ],
                        ),

                      ),

                    ),
                  ],
                ),
              );
            },
          ),
    );
  }

  showDialogFunc(context,double h1,double w1,double h2,double w2) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15.sp),
              height:h1,
              width: w1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 5.h,),
                  Container(
                    width: h2,
                    height: w2,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: FileImage(
                              Provider.of<ProfileViewModel>(
                                  context)
                                  .getIm() ??
                                  File(""))
                      ),
                    ),
                  ),

                ],),

            ),
          ),

        );
      },
    );
  }
}
