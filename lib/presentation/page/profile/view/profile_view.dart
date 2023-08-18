

import 'dart:io';
import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/back_login/back_login.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/component/icon_notification.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/page/drawer/view/drawer.dart';
import 'package:untitled/presentation/page/profile/view_model/profile_view_model.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
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
  static const delayDuration = Duration(milliseconds: 3000);

  void didChangeDependencies() {
    if( Provider.of<ProfileViewModel>(context).getStateScreen() == 4){
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        Future.delayed(delayDuration, () {
          // Write your code here
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BackLoginView()),
                (route) => false,
          );
        });
      });
    }
    super.didChangeDependencies();
  }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    var  viewModel = Provider.of<ProfileViewModel>(context, listen: false);
      viewModel.start();
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

    RefreshController _refreshController =
    RefreshController(initialRefresh: false);
    void _onRefresh() async {
      Provider.of<ProfileViewModel>(context,listen: false).start();
      _refreshController.refreshCompleted();
    }
    return Sizer(
      builder: (context, orientation, deviceType) =>
          Scaffold(
            drawer: NavBar(),
            appBar: AppBar(
              actions: [
                notificationIcon(context)

              ],
            ),
            body:
            Provider.of<ProfileViewModel>(context).getStateScreen() == 0
                ? SmartRefresher(
                controller: _refreshController,
                onRefresh: _onRefresh,
                child: contentWidget())
                :Provider.of<ProfileViewModel>(context).getStateScreen()==1
                ?StateRenderer(
                stateRendererType: StateRendererType.fullScreenLoadingState,
                message: "Loading",
                retryActionFunction: () {})
               : StateRenderer(
                stateRendererType: StateRendererType.fullScreenErrorState,
                message: Provider.of<ProfileViewModel>(context).getMessage1(),
                retryActionFunction: () {
                  Provider.of<ProfileViewModel>(context).start();
                })


          ),
    );
  }

  Widget contentWidget() {
    GlobalKey<FormBuilderState> _fbKey2 = GlobalKey<FormBuilderState>();

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
    return
      Consumer<ProfileViewModel>(
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
                                  width: 1.w,
                                ),
                                Expanded(
                                  child: Column(
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
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                IconButton(onPressed: ()
                                {
                                  Navigator.pushNamed(context, Routes.qrCodeViewRoute);
                                }, icon: Icon(Icons.qr_code_sharp,size: 25,)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.sp,left: 20.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: AppSize.s8, left: 8,top: 8),
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
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: AppSize.s8, left: 8),
                                    child: Text(
                                      "Residence",
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
                                height: 6.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //SizedBox(height: 4.h,),
                                  Column(
                                    children: [
                                      SizedBox(height: 5.h,),
                                      Icon(Icons.location_city,size: AppSize.s25,),
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
                                        height: 14.h,
                                        width: 70.w,
                                        child: FormBuilder(
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
                                                model.setCityId(val!);
                                                model.getAreasByIdCity(val);
                                                if (_fbKey2.currentState != null) {
                                                  _fbKey2.currentState?.reset();
                                                }
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
                                  Column(
                                    children: [
                                      SizedBox(height: 5.h,),
                                      Icon(Icons.area_chart_outlined,size: AppSize.s25,),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text("   ${LocaleKeys.area.tr()} "),
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
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: AppSize.s8, left: 8),
                                    child: Text(LocaleKeys.university.tr()
                                      ,
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
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.account_balance,size: AppSize.s25,),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text(model.getProfileUni())

                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: AppSize.s8, left: 8),
                                    child: Text(
                                      "Payment Information",
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
                                    child: Row(
                                      children: [
                                        Text("${LocaleKeys.subscription.tr()} :"),
                                        Text(" ${model.getStudentSub()?.name ??""} ")
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
                                    child: Row(
                                      children: [
                                        Text("${LocaleKeys.daysNumber.tr()} :"),
                                        Text("${model.getStudentSub()?.daysNumber??""}")
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
                                    child: Row(
                                      children: [
                                        Text("${LocaleKeys.price.tr()} :"),
                                        Text(" ${model.getStudentSub()?.price??""}")
                                      ],
                                    ),
                                  ),
                                ],),

                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: AppPadding.p28,
                                        horizontal: AppPadding.p28),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        LoadingState(stateRendererType: StateRendererType.popupLoadingState).showPopup(context, StateRendererType.popupLoadingState, profile1.getMessage1());
                                        profile.UpdateStudent().then((value) {
                                          if(value){
                                            SuccessState(profile1.getMessage1()).dismissDialog(context);
                                            SuccessState(profile1.getMessage1()).showPopup(context, StateRendererType.popupSuccess, profile1.getMessage1());
                                          }else{
                                            ErrorState(StateRendererType.popupErrorState, profile1.getMessage1()).dismissDialog(context);
                                            ErrorState(StateRendererType.popupErrorState, profile1.getMessage1()).showPopup(context, StateRendererType.popupErrorState, profile1.getMessage1());
                                          }
                                        }
                                        );
                                      },
                                      child: Text(LocaleKeys.save.tr()),
                                    ),
                                  ),

                                ],
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
                                SizedBox(
                                  width: 18.w,
                                ),
                                IconButton(onPressed: ()
                                {
                                  Navigator.pushNamed(context, Routes.qrCodeViewRoute);
                                }, icon: Icon(Icons.qr_code_sharp,size: 25,)),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: AppSize.s8, left: 8),
                                child: Text(
                                  "Personal Informatio",
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
                                Column(
                                  children: [
                                    SizedBox(height: 3.h,),
                                    Icon(Icons.location_city,size: AppSize.s25,),
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
                                    SizedBox(height: 3.h,),
                                    Icon(Icons.area_chart_outlined,size: AppSize.s25,),
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
                                    SizedBox(height: 3.h,),
                                    Icon(Icons.account_balance,size: AppSize.s25,),
                                  ],
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("   ${LocaleKeys.university.tr()}"),
                                    SizedBox(
                                      height: 10.h,
                                      width: 128.w,
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

                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: AppSize.s8, left: 8),
                                  child: Text(
                                    "Residence",
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

                            SizedBox(height: 4.h,),
                            Text("${LocaleKeys.subscription.tr()} : ${model.getStudentSub()?.name} "),
                            Text("${LocaleKeys.daysNumber.tr()} :  ${model.getStudentSub()?.daysNumber}"),
                            Text("${LocaleKeys.price.tr()} :  ${model.getStudentSub()?.price}"),
                            SizedBox(height: 4.h,),                          ],
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


