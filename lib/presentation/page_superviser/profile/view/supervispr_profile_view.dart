import 'dart:io';

import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/lang/locale_keys.g.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/component/icon_notification.dart';
import 'package:untitled/presentation/page_superviser/profile/view_model/supervisor_profile_viewmodel.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

import '../../../not_viewmodel.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/style_manage.dart';
import '../../drawer/view/drawer.dart';

class SupervisorProfileView extends StatefulWidget {
  const SupervisorProfileView({Key? key}) : super(key: key);

  @override
  _SupervisorProfileViewState createState() => _SupervisorProfileViewState();
}

class _SupervisorProfileViewState extends State<SupervisorProfileView> {
  SupervisorProfileViewModel profileViewModel =
      instance<SupervisorProfileViewModel>();
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<SupervisorProfileViewModel>(context, listen: false).start();
    });
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
      builder: (context, orientation, deviceType) => Scaffold(
          appBar: AppBar(
            actions: [notificationIcon(context)],
            title: Text(LocaleKeys.profile.tr(),
                style: getBoldStyle(
                    color: ColorManager.sidBarIcon, fontSize: FontSize.s20)),
          ),
          drawer: DrawerSupervisorView(),
          body: Provider.of<SupervisorProfileViewModel>(context)
                      .getStateScreen() ==
                  0
              ? contentWidget()
              : Provider.of<SupervisorProfileViewModel>(context)
                          .getStateScreen() ==
                      1
                  ? StateRenderer(
                      stateRendererType:
                          StateRendererType.fullScreenLoadingState,
                      message: "Loading",
                      retryActionFunction: () {})
                  : StateRenderer(
                      stateRendererType: StateRendererType.fullScreenErrorState,
                      message: "something wrong",
                      retryActionFunction: () {
                        Provider.of<SupervisorProfileViewModel>(context,
                                listen: false)
                            .student();
                      })),
    );
  }

  Widget contentWidget() {
    //var profile = Provider.of<SupervisorProfileViewModel>(context, listen: false);
    var profile1 = Provider.of<SupervisorProfileViewModel>(context);
    TextEditingController _firstNameController =
        TextEditingController(text: profile1.getFirstName());
    TextEditingController _streetController =
        TextEditingController(text: profile1.getStreet());
    TextEditingController _lastNameController =
        TextEditingController(text: profile1.getLastName());
    TextEditingController _emailController =
        TextEditingController(text: profile1.getEmail());
    TextEditingController _phoneNumberController =
        TextEditingController(text: profile1.getPhone());

    return Sizer(builder: (context, orientation, deviceType) {
      return Consumer<SupervisorProfileViewModel>(
        builder: (context, model, child) => SafeArea(
          child: orientation == Orientation.portrait
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.sp),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      child:
                                          Provider.of<SupervisorProfileViewModel>(
                                                          context)
                                                      .getIm() !=
                                                  null
                                              //  profile1.getDownload()
                                              ? InkWell(
                                                  onTap: () async {
                                                    showDialogFunc(
                                                        context,
                                                        40.h,
                                                        40.h,
                                                        40.w,
                                                        40.w);
                                                  },
                                                  child: Container(
                                                    width: 28.w,
                                                    height: 17.h,
                                                    decoration: BoxDecoration(
                                                        shape:
                                                            BoxShape.circle,
                                                        //color: Colors.grey[300],
                                                        image: DecorationImage(
                                                            fit: BoxFit
                                                                .contain,
                                                            image: FileImage(
                                                                Provider.of<SupervisorProfileViewModel>(
                                                                            context)
                                                                        .getIm() ??
                                                                    File(
                                                                        "")))),
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () async {
                                                    await profile1
                                                        .updateImageFromGallory();
                                                    await profile1
                                                        .updateImage();
                                                  },
                                                  child: Container(
                                                      width: 28.w,
                                                      height: 17.h,
                                                      decoration:
                                                          BoxDecoration(
                                                        color:
                                                            Colors.grey[300],
                                                        shape:
                                                            BoxShape.circle,
                                                      ),
                                                      child: const Icon(
                                                          Icons.add,
                                                          size: AppSize.s50,
                                                          color: Color(
                                                              0xFFFFFFFF))),
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
                                        onTap: () async {
                                          await profile1
                                              .updateImageFromGallory();
                                          await profile1.updateImage();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      profile1.getName() ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeightManager.bold,
                                          fontSize: FontSize.s18),
                                    ),
                                    Text(
                                      profile1.getEmail(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge,
                                    ),
                                    Text(
                                      profile1.getPhone(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge,
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   width:0.5.w,
                                // ),
                                // IconButton(onPressed: ()
                                // {
                                //   Navigator.pushNamed(context, Routes.qrscan);
                                // }, icon: Icon(Icons.qr_code_scanner,size: 25,)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20.sp, left: 20.sp,top:15.sp, ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: AppSize.s8, left: 8),
                                        child: Text(
                                          "Personal Information",
                                          style:
                                          Theme.of(context).textTheme.titleLarge,
                                        ),
                                      ),
                                      Expanded(
                                          child: Divider(
                                            height: 3.h,
                                            color: ColorManager.sidBarIcon,
                                            thickness: 1,
                                          )),
                                    ],
                                  ),

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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(LocaleKeys.eFirstName.tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
                                          SizedBox(
                                            width: 55.w,
                                            child: TextField(
                                              controller: _firstNameController,
                                              onSubmitted: (value) {
                                                _firstNameController.text =
                                                    value;
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
                                        Icons.person,
                                        size: AppSize.s25,
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(LocaleKeys.eLastName.tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
                                          SizedBox(
                                            width: 55.w,
                                            child: TextField(
                                              controller: _lastNameController,
                                              onSubmitted: (value) {
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(LocaleKeys.ePhoneNumber.tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
                                          SizedBox(
                                            width: 55.w,
                                            child: TextField(
                                              controller:
                                                  _phoneNumberController,
                                              onSubmitted: (value) {
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
                                    height: 6.h,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: AppSize.s8, left: 8),
                                  child: Text(
                                    "Residence",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge,
                                  ),
                                ),
                                Expanded(
                                    child: Divider(
                                  height: 3.h,
                                  color: ColorManager.sidBarIcon,
                                  thickness: 1,
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20.sp, left: 20.sp),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //SizedBox(height: 4.h,),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Icon(
                                            Icons.location_city,
                                            size: AppSize.s25,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("   ${LocaleKeys.city.tr()} "),
                                          SizedBox(
                                            height: 14.h,
                                            width: 70.w,
                                            child: DropdownButtonFormField(
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                hint: Text(
                                                    model.getProfileCity()),
                                                items: model
                                                    .getCities()
                                                    .map(
                                                        (e) => DropdownMenuItem(
                                                              value: e.id,
                                                              child: Text(
                                                                " ${e.name}",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ))
                                                    .toList(),
                                                onChanged: (val) {
                                                  model.setCityId(val!);
                                                  model.getAreasByIdCity(val);
                                                }),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Icon(
                                            Icons.area_chart_outlined,
                                            size: AppSize.s25,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("   ${LocaleKeys.area.tr()} "),
                                          SizedBox(
                                            height: 14.h,
                                            width: 70.w,
                                            child: DropdownButtonFormField(
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                hint: Text(
                                                    model.getProfileArea()),
                                                items: model
                                                    .getAreas()
                                                    .map(
                                                        (e) => DropdownMenuItem(
                                                              value: e.id,
                                                              child: Text(
                                                                " ${e.name}",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ))
                                                    .toList(),
                                                onChanged: (val) {
                                                  model.setAreaId(val!);
                                                }),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: AppPadding.p28,
                                        horizontal: AppPadding.p50),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        model.updateSupervisor();
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
                          ],
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      child:
                                          Provider.of<SupervisorProfileViewModel>(
                                                          context)
                                                      .getIm() !=
                                                  null
                                              //  profile1.getDownload()
                                              ? InkWell(
                                                  onTap: () async {
                                                    //Navigator.pushNamed(context, Routes.display_image);
                                                    showDialogFunc(context,
                                                        30.h, 30.h, 40.w, 40.w);
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
                                                                Provider.of<SupervisorProfileViewModel>(
                                                                            context)
                                                                        .getIm() ??
                                                                    File("")))),
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () async {
                                                    await profile1
                                                        .updateImageFromGallory();
                                                    await profile1
                                                        .updateImage();
                                                  },
                                                  child: Container(
                                                      width: 28.w,
                                                      height: 17.h,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[300],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: const Icon(
                                                          Icons.add,
                                                          size: AppSize.s50,
                                                          color: Color(
                                                              0xFFFFFFFF))),
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
                                        onTap: () async {
                                          await profile1
                                              .updateImageFromGallory();
                                          await profile1.updateImage();
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
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Text(
                                      profile1.getPhone(),
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   width: 18.w,
                                // ),
                                // IconButton(onPressed: ()
                                // {
                                //   Navigator.pushNamed(context, Routes.qrscan);
                                // }, icon: Icon(Icons.qr_code_sharp,size: 25,)),
                              ],
                            ),
                          ),
                          Container(
                            width: 200.w,
                            child: Divider(
                              height: 2.h,
                              color: ColorManager.sidBar,
                              thickness: 2,
                            ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(LocaleKeys.eFirstName.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                            SizedBox(
                                              width: 100.w,
                                              child: TextField(
                                                controller:
                                                    _firstNameController,
                                                onSubmitted: (value) {
                                                  _firstNameController.text =
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(LocaleKeys.eLastName.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                            SizedBox(
                                              width: 100.w,
                                              child: TextField(
                                                controller: _lastNameController,
                                                onSubmitted: (value) {
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
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(LocaleKeys.ePhoneNumber.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                            SizedBox(
                                              width: 100.w,
                                              child: TextField(
                                                controller:
                                                    _phoneNumberController,
                                                onSubmitted: (value) {
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("LocaleKeys.street",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                            SizedBox(
                                              width: 100.w,
                                              child: TextField(
                                                controller: _streetController,
                                                onSubmitted: (value) {
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
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: AppPadding.p28,
                                          horizontal: AppPadding.p28),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          model.updateSupervisor();
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
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Icon(
                                      Icons.location_city,
                                      size: AppSize.s25,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("   ${LocaleKeys.city.tr()} "),
                                    SizedBox(
                                      height: 10.h,
                                      width: 120.w,
                                      child: DropdownButtonFormField(
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),
                                          hint: Text(model.getProfileCity()),
                                          items: model
                                              .getCities()
                                              .map((e) => DropdownMenuItem(
                                                    value: e.id,
                                                    child: Text(
                                                      " ${e.name}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ))
                                              .toList(),
                                          onChanged: (val) {
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
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Icon(
                                      Icons.area_chart_outlined,
                                      size: AppSize.s25,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("   ${LocaleKeys.area.tr()}"),
                                    SizedBox(
                                      height: 10.h,
                                      width: 120.w,
                                      child: DropdownButtonFormField(
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),
                                          hint: Text(model.getProfileArea()),
                                          items: model
                                              .getAreas()
                                              .map((e) => DropdownMenuItem(
                                                    value: e.id,
                                                    child: Text(
                                                      " ${e.name}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ))
                                              .toList(),
                                          onChanged: (val) {
                                            model.setAreaId(val!);
                                          }),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
  }

  showDialogFunc(context, double h1, double w1, double h2, double w2) {
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
              height: h1,
              width: w1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    width: h2,
                    height: w2,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: FileImage(
                              Provider.of<SupervisorProfileViewModel>(context)
                                      .getIm() ??
                                  File(""))),
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

/*
 StreamBuilder<FlowState>(
          stream:
          Provider.of<ProfileViewModel>(context, listen: false).outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget( context, contentWidget(), () {
              Provider.of<ProfileViewModel>(context, listen: false).start();
            }) ??
                contentWidget();
          })
 */
